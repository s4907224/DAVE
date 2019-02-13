import maya.cmds as cmds
import pymel.core as pm
import maya.OpenMaya as om
import base64
import hashlib
import os
import sys
import math
import time
import random
import urllib
from functools import partial

def navTab(*args):
    cmds.tabLayout(args[0], e = True, st = args[1])

def vectorAngle(vector1, vector2):
    magU = vectorLength(vector1)
    magV = vectorLength(vector2)
    uDotV = vectorDot(vector1, vector2)
    cosTheta = uDotV / (magU * magV)
    return math.acos(cosTheta)

def vectorDot(vector1, vector2):
    if len(vector1) != len(vector2):
        print "Vectors given to function vectorDifference have differing number of dimensions!"
        return None 
    a1 = vector1[0]
    b1 = vector1[1]
    c1 = 0
    a2 = vector2[0]
    b2 = vector2[1]
    c2 = 0
    if len(vector1) == 3:
        c1 = vector1[2]
        c2 = vector2[2]
    return a1 * a2 + b1 * b2 + c1 * c2

def vectorDifference(vector1, vector2):
    if len(vector1) != len(vector2):
        print "Vectors given to function vectorDifference have differing number of dimensions!"
        return None
    a1 = vector1[0]
    b1 = vector1[1]
    c1 = 0
    a2 = vector2[0]
    b2 = vector2[1]
    c2 = 0
    if len(vector1) == 3:
        c1 = vector1[2]
        c2 = vector2[2]
    return [a1 - a2, b1 - b2, c1 - c2]
    

def vectorLength(vector):
    a = vector[0]
    b = vector[1]
    c = 0
    if (len(vector) == 3):
        c = vector[2]
    return math.sqrt(math.pow(a, 2) + math.pow(b, 2) + math.pow(c, 2))

def selectAndViewObject(objectName):
    cmds.select(objectName)
    cmds.viewFit(objectName)  

class daveObject:
    def __init__(self, transform, id):
        print "Object added with name "+str(transform)+" and ID "+str(id)
        self.transform = transform
        self.index = id
        self.imported = False
        self.numVerts = cmds.polyEvaluate(self.transform, v = True)
        self.topVerts = []
        self.topVertsIndex = []
        self.hull = []
        self.hash = 0
        self.tag = None
        self.enabled = False
        allVPos = []
        maxVPos = -sys.maxint
        minVPos = sys.maxint
        for i in range(self.numVerts):
            allVPos.append(cmds.pointPosition(self.transform + ".vtx[" + str(i) + "]", w = True))
            maxVPos = max(maxVPos, allVPos[i][1])
            minVPos = min(minVPos, allVPos[i][1])
        topMargin = maxVPos - ((maxVPos - minVPos) * 0.3)
        self.hullHeight = maxVPos
        upperVerts = []
        upperVertsIndex = []
        for i in range(self.numVerts):
            if round(allVPos[i][1], 2) >= round(topMargin, 2):
                upperVerts.append(allVPos[i])
                upperVertsIndex.append(i)
        delIndices = []
        for i in range(len(self.topVerts)):
            for j in range(len(self.topVerts)):
                if i == j:
                    continue
                if upperVerts[i][0] == upperVerts[j][0] and upperVerts[i][2] == upperVerts[j][2]:
                    if upperVerts[i][1] > upperVerts[j][1]:
                        delIndices.append(j)
                    else:
                        delIndices.append(i)

        for i in range(len(delIndices)):
            del upperVerts[delIndices[i] - i]
            del upperVertsIndex[delIndices[i] - i]
        
        self.topVerts = upperVerts
        self.topVertsIndex = upperVertsIndex

        self.searchForHull()

    def searchForHull(self):
        if cmds.objExists("*_usrHull"):
            cmds.select(d = True)
            cmds.select("*_usrHull")
            for s in cmds.ls(sl = True):
                if cmds.listAttr(s, st='DAVEHULL') != None:
                    if cmds.getAttr(s+".DAVEHULL") == self.transform:
                        self.hullTransform = s
                        self.outerHullVerts = []
                        for v in range(cmds.polyEvaluate(s, v = True)):
                            self.outerHullVerts.append(cmds.pointPosition(s+".vtx["+str(v)+"]", w = True))
                        numFaces = cmds.getAttr(s+".face", size=1)
                        for j in range(numFaces):
                            cmds.select(s+".f["+str(j)+"]")
                            verts = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
                            self.hull.append(verts)
                        return
        elif cmds.objExists("*_cvxHull"):
            cmds.select(d = True)
            cmds.select("*_cvxHull")
            for s in cmds.ls(sl = True):
                if cmds.listAttr(s, st='DAVEHULL') != None:
                    if cmds.getAttr(s+".DAVEHULL") == transform:
                        self.hullTransform = s
                        self.outerHullVerts = []
                        for v in range(cmds.polyEvaluate(hullName, v = True)):
                            self.outerHullVerts.append(cmds.pointPosition(s+".vtx["+str(v)+"]", w = True))
                        numFaces = cmds.getAttr(s+".face", size=1)
                        for j in range(numFaces):
                            cmds.select(s+".f["+str(j)+"]")
                            verts = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
                            self.hull.append(verts)
                        return

    def genConvexHull(self):
        if self.hull != []:
            return
        if len(self.topVerts) < 3:
            self.outerHullVerts = []
            print "Not enough verts to construct BBox"
            self.wrongBox = True
            return
        def ccw(p1, p2, p3):
            for d in p1:
                d = round(d, 2)
            for d in p2:
                d = round(d, 2)
            for d in p3:
                d = round(d, 2)
            return (p2[0] - p1[0]) * (p3[2] - p1[2]) - (p2[2] - p1[2]) * (p3[0] - p1[0])
        def polarAngle(a, b):
            x = a[0] - b[0]
            y = a[2] - b[2]
            if (x > 0 and y > 0):
                return math.atan(y / x)
            elif (x < 0 and y > 0):
                return math.atan(-x / y) + math.pi / 2.0
            elif (x < 0 and y < 0):
                return math.atan(y / x) + math.pi
            elif (x > 0 and y < 0):
                return math.atan(-x / y) + math.pi / 2.0 + math.pi
            elif (x == 0 and y > 0):
                return math.pi / 2.0
            elif (x < 0 and y == 0):
                return math.pi
            elif (x == 0 and y < 0):
                return math.pi / 2.0 + math.pi
            else:
                return 0
        points = self.topVerts
        pointsIndex =[]
        for i in range(len(points)):
            pointsIndex.append(i)
        pointsIndex = [x for y, x in sorted(zip(self.topVerts, pointsIndex), key = lambda var: var[0][2])]
        pointsIndex = sorted(pointsIndex, key = lambda var: polarAngle(self.topVerts[var], self.topVerts[pointsIndex[0]]))
        stack = []
        stack.append(pointsIndex[0])
        stack.append(pointsIndex[1])
        for i in range(2, len(points)):
            while len(stack) >= 2 and ccw(points[stack[len(stack) - 2]], points[stack[len(stack) - 1]], points[pointsIndex[i]]) <= 0:
                stack.pop()
            stack.append(pointsIndex[i])
        cmds.select(d = True)
        facetList = []
        self.cvxHVerts = stack
        for i in range(len(stack)):
            cmds.select(self.transform+".vtx["+str(self.topVertsIndex[stack[i]])+"]", add = True)
            pos = self.topVerts[stack[i]]
            facetList.append((pos[0], self.hullHeight, pos[2]))
        if len(facetList) < 3:
            self.outerHullVerts = []
            return
        else:
            self.outerHullVerts = facetList
        cmds.polyCreateFacet(name = self.transform+"_cvxHull", p = self.outerHullVerts)
        sf = 100
        currentUnit = cmds.currentUnit(q = True, linear = True)
        if currentUnit == "cm" or currentUnit == "centimeter":
            sf = 1
        elif currentUnit == "mm" or currentUnit == "millimeter":
            sf = 0.1
        cmds.scale(sf, sf, sf)
        cmds.polyNormal(nm = 0)
        cmds.polyTriangulate(self.transform+"_cvxHull")
        cmds.select(self.transform+"_cvxHull.vtx[0:]")
        numFaces = cmds.getAttr(self.transform+"_cvxHull.face", size=1)
        self.hull = []
        for j in range(numFaces):
            cmds.select(self.transform+"_cvxHull.f["+str(j)+"]")
            verts = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
            self.hull.append(verts)
        if len(self.outerHullVerts) == 3:
            print "Hull has only 3 verts, may be incorrect."
            self.wrongBox = True
        elif (max(self.outerHullVerts, key = lambda x: x[0])[0] > max(self.topVerts, key = lambda x: x[0])[0] or
            max(self.outerHullVerts, key = lambda x: x[2])[2] > max(self.topVerts, key = lambda x: x[2])[2] or
            min(self.outerHullVerts, key = lambda x: x[0])[0] < min(self.topVerts, key = lambda x: x[0])[0] or
            max(self.outerHullVerts, key = lambda x: x[2])[2] < min(self.topVerts, key = lambda x: x[2])[2]):
            print "BBOX ERROR!"
            self.wrongBox = True
        else:
            self.wrongBox = False
        self.hullTransform = self.transform+"_cvxHull"

    def determineShape(self):
        print "Hull has " + str(len(self.outerHullVerts)) + " edges."
        nE = 0
        print "Hull is made up of " + str(len(self.hull)) + " convex hulls."

class daveManager:
    def __init__(self, path):
        print "DAVE is starting..."
        self.path = path
        self.dbpath = path + "assets/assets.davedb"
        self.parseDAVEDB()
        self.sessionObjects = []
        self.hash = None
        self.walls = []
        self.buildingStates = []
        self.roomStates = []
        self.roomPlans = []
        self.roomOuterPlans = []
        for i in range(100):
            self.buildingStates.append(False)
            self.roomStates.append([])
            self.roomPlans.append([])
            self.roomOuterPlans.append([])
            for j in range(100):
                self.roomStates[i].append(False)
                self.roomPlans[i].append([])
                self.roomOuterPlans[i].append([])
        self.hullTool = cmds.polyCreateFacetCtx(i1 = self.dbpath+"fetch/hull.png")
        self.delTransforms = []
        '''
        python is simple
        makes programming fast and slick
        but no pointer type
        '''

    def cleanup(self):
        if hasattr(self, "secondaryWindow"):
            if (cmds.window(self.secondaryWindow, exists=True)):
                cmds.deleteUI(self.secondaryWindow)
        cmds.scriptJob(kill = self.deleteJob, force = True)
        print "Exiting DAVE..."
        cmds.refresh()

    def __del__(self):
        print "dtor called"
        
    def parseDAVEDB(self):
        names = []
        hashes = []
        tags = []
        with open(self.dbpath) as p:
            i = 0
            assetCount = 0
            shouldRead = False
            line = p.readline()
            while line:
                if line[0] == '!':
                    if not shouldRead:
                        shouldRead = True
                    else:
                        shouldRead = False
                elif shouldRead:
                    if line[0] == "$":
                        assetCount += 1
                        line = p.readline()
                        string = ''
                        for j in range(len(line) - 5):
                            if line[j + 5] != "\n" and line[j + 5] != "\r":
                                string += line[j + 5]
                        names.append(string)
                        line = p.readline()
                        string = ''
                        for j in range(len(line) - 4):
                            if line[j + 4] != "\n" and line[j + 4] != "\r":
                                string += line[j + 4]
                        tags.append(string)
                        line = p.readline()
                        string = ''
                        for j in range(len(line) - 5):
                            if line[j + 5] != "\n" and line[j + 5] != "\r":
                                string += line[j + 5]
                        hashes.append(string)
                        line = p.readline()

                line = p.readline()
                i +=1
        self.db = [hashes, names, tags]

    def UI(self):
        self.window = cmds.window(title='DAVE: Main Window')
        self.deleteJob = cmds.scriptJob(ct = ["SomethingSelected",self.checkForDeletions])
        col = cmds.columnLayout()
        cmds.image(image = self.path+"fetch/header.png")
        cmds.rowLayout(nc=3)
        cmds.button(label="Import Selection", width=150, c = lambda x : self.importSelectedObjects())
        def test(*args):
            cmds.refresh()
            print "Hello and welcome to the test function."
            cmds.refresh()
            self.scanSceneAndImport()
        comm = partial(test)
        cmds.button(label="Scan Scene", width = 150, c = comm)
        #cmds.button(label="Test hulls", c = lambda x: self.demoTest())
        cmds.setParent(col)
        cmds.showWindow()
        #self.mainWindowCloseJob = cmds.scriptJob(uiDeleted = [self.window, "cmds.scriptJob(kill = "+str(self.deleteJob)+", force = True)"], ro = True)
        self.mainWindowCloseJob = cmds.scriptJob(uiDeleted = [self.window, self.cleanup], ro = True)

    def checkForDeletions(self, *args):
        node = pm.selected()[0]
        if node in self.delTransforms:
            print "Node already tagged."
            return
        mObj = node.__apimobject__()
        event = om.MNodeMessage.addNodePreRemovalCallback(mObj, self.searchSessionForObject, node)
        self.delTransforms.append(node)

    def searchSessionForObject(self, *args):
        transform = args[1]
        matches = []
        for ob in self.sessionObjects:
            if ob.enabled and ob.transform == transform:
                matches.append(ob.index)
        if len(matches) > 1:
            print "Multiple matching objects were found, this isn't good."
            return
        if not len(matches):
            print "No matching objects were found."
            return
        else:
            print "Removing match"
            self.sessionObjects[matches[0]].enabled = False
            self.delTransforms.remove(args[0])

    def checkAgainstDatabase(self, objIndex):
        if self.sessionObjects[objIndex].hash in self.db[0]:
            index = self.db[0].index(self.sessionObjects[objIndex].hash)
            self.sessionObjects[objIndex].tag = self.db[2][index]
            if cmds.listAttr(self.sessionObjects[objIndex].transform, st='DAVETAG') == None:
                cmds.addAttr(self.sessionObjects[objIndex].transform, longName = "DAVETAG", dataType = "string", hidden = False)
            cmds.setAttr(self.sessionObjects[objIndex].transform+".DAVETAG", self.db[2][index], type = "string")
            cmds.rename(self.sessionObjects[objIndex].transform, self.db[1][index])
            self.sessionObjects[objIndex].transform = self.db[1][index]
            return True
        else:
            return False

    def checkDAVECompliance(self, obj):
        if cmds.listAttr(self.sessionObjects[obj].transform, st = "DAVEHASH"):
            self.sessionObjects[obj].hash = cmds.getAttr(str(self.sessionObjects[obj].transform) + ".DAVEHASH")
            return True
        elif (len(self.sessionObjects[obj].transform) < 9):
            return False
        endIndex = len(self.sessionObjects[obj].transform) - 1
        if self.sessionObjects[obj].transform[0] == 'D' and self.sessionObjects[obj].transform[9] == '_':
            cmds.addAttr(self.sessionObjects[obj].transform, longName = 'DAVEHASH', dataType = "string")
            cmds.setAttr(self.sessionObjects[obj].transform+".DAVEHASH", self.sessionObjects[obj].transform[1:9], type = "string")
            cmds.rename(self.sessionObjects[obj].transform, self.sessionObjects[obj].transform[10:])
            self.sessionObjects[obj].hash = self.sessionObjects[obj].transform[1:9]
            self.sessionObjects[obj].transform = self.sessionObjects[obj].transform[10:]
            return True
        elif self.sessionObjects[obj].transform[endIndex - 8] == 'D' and self.sessionObjects[obj].transform[endIndex - 9] == '_':
            cmds.addAttr(self.sessionObjects[obj].transform, longName = 'DAVEHASH', dataType = "string")
            cmds.setAttr(self.sessionObjects[obj].transform+".DAVEHASH", self.sessionObjects[obj].transform[endIndex - 7:], type = "string")
            cmds.rename(self.sessionObjects[obj].transform, self.sessionObjects[obj].transform[:endIndex - 9])
            self.sessionObjects[obj].hash = self.sessionObjects[obj].transform[endIndex - 7:]
            self.sessionObjects[obj].transform = self.sessionObjects[obj].transform[:endIndex - 9]
            return True
        else:
            return False

    def createHash(self, string):
        hasher = hashlib.sha1(string)
        return base64.urlsafe_b64encode(hasher.digest()[:6])

    def scanSceneAndImport(self):
        print ""
        print "scanSceneAndImport"
        geometry = cmds.ls(geometry=True)
        print "Geometry = "+str(geometry)
        transforms = cmds.listRelatives(geometry, p=True, pa = True)
        print "Transforms = "+str(transforms)
        cmds.select(transforms)
        print "Going to import..."
        self.importSelectedObjects()

    def importSelectedObjects(self):
        if cmds.objExists("*_usrHull"):
            cmds.select("*_usrHull", d = True)
        if cmds.objExists("*_cvxHull"):
            cmds.select("*_cvxHull", d = True)
        if cmds.objExists("*_flr"):
            cmds.select("*_flr", d = True)
        selection = cmds.ls(sl = True)
        print "Selection = "+str(selection)
        if cmds.objExists("*_flr"):
            cmds.select("*_flr")
            for s in cmds.ls(sl = True):
                if cmds.listAttr(s, st = "DAVEPLANBUILDING") and cmds.listAttr(s, st = "DAVEPLANBUILDING"):
                    building = int(cmds.getAttr(s+".DAVEPLANBUILDING"))
                    room = int(cmds.getAttr(s+".DAVEPLANROOM"))
                    cmds.select(s+".vtx[0:]")
                    for v in range(cmds.polyEvaluate(s, v = True)):
                        self.roomOuterPlans[building][room].append(cmds.pointPosition(s+".vtx["+str(v)+"]", w = True))
                    cmds.polyTriangulate(s)
                    cmds.select(s+".vtx[0:]")
                    yNormals = cmds.polyNormalPerVertex( query=True, y=True )
                    if (sum(yNormals)/float(len(yNormals))) < 0:
                        cmds.polyNormal(nm = 0)
                    numFaces = cmds.getAttr(s+".face", size=1)
                    for j in range(numFaces):
                        cmds.select(s+".f["+str(j)+"]")
                        verts = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
                        self.roomPlans[building][room].append(verts)
                    self.roomStates[building][room] = True

        toBeImported = []
        self.newObjects = []
        for i in range(len(selection)):
            if cmds.listAttr(selection[i], st='DAVEHULL') != None:
                continue
            currentIndex = len(self.sessionObjects)
            if not any(dObject.transform == selection[i] for dObject in self.sessionObjects if dObject.enabled):
                self.sessionObjects.append(daveObject(selection[i], currentIndex))
                self.newObjects.append(currentIndex)
                if cmds.listAttr(self.sessionObjects[currentIndex].transform, st='DAVEBUILDING') != None:
                    self.walls.append(currentIndex)
            else:
                continue
            compliantObject = self.checkDAVECompliance(currentIndex)
            inDB = self.checkAgainstDatabase(currentIndex)
            if (not compliantObject) or (not inDB):
                toBeImported.append(currentIndex)
        cmds.select(d = True)
        if len(toBeImported) != 0:
            self.importSelection(toBeImported)
        elif len(self.sessionObjects) != 0:
            self.tagWalls()

    def importSelection(self, objects):
        print "IMPORT SELECTION"
        print "Objects = "+str(objects)
        self.secondaryWindow = cmds.window(title="DAVE: Set tags for objects")
        form = cmds.formLayout()
        tabs = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5)
        cmds.formLayout(form, edit=True, attachForm=((tabs, 'top', 0), (tabs, 'left', 0), (tabs, 'bottom', 0), (tabs, 'right', 0)))
        numTabs = math.ceil(float(len(objects)) / 5.0)
        cols = []
        text = []
        focusButtons = []
        radioButtons = []
        hullRadButtons = []
        hullButtons = []
        userGivenHulls = []
        userHullTextFields = []
        nameFields = []

        def toggleHullButton(*args):
            cmds.button(hullButtons[args[0]], e = True, en = args[1])
            cmds.textField(userHullTextFields[args[0]], e = True, en = args[1])

        def toggleWholeItem(*args):
            cmds.text(text[args[0]], e = True, en = args[1])
            cmds.radioButtonGrp(hullRadButtons[args[0]], e = True, en = args[1])
            cmds.radioButtonGrp(radioButtons[args[0]], e = True, en = args[1])
            if args[1] and cmds.radioButtonGrp(hullRadButtons[args[0]], q = True, sl = True) == 2:
                cmds.button(hullButtons[args[0]], e = True, en = True)
                cmds.textField(userHullTextFields[args[0]], e = True, en = True)
            elif not args[1]:
                cmds.button(hullButtons[args[0]], e = True, en = False)
                cmds.textField(userHullTextFields[args[0]], e = True, en = False)
            cmds.button(focusButtons[args[0]], e = True, en = args[1])
            cmds.textField(nameFields[args[0]], e = True, en = args[1])

        def attachUserHull(*args):
            selectAndViewObject(self.sessionObjects[objects[args[0]]].transform)
            def checkNewHulls(*args):
                if [s for s in cmds.ls(sl = True)][0][:11] == "polySurface":
                    hullName = args[0]+"_usrHull"
                    cmds.rename([s for s in cmds.ls(sl = True)][0], hullName)
                    cmds.textField(userHullTextFields[args[1]], e = True, text = hullName)
                    cmds.addAttr(hullName, longName = "DAVEHULL", dataType = "string", hidden = False)
                    cmds.setAttr(hullName+".DAVEHULL", args[0], type = "string")
            cmds.setToolTo(self.hullTool)
            comm = partial(checkNewHulls, args[1], args[0])
            self.hullJob = cmds.scriptJob(runOnce = True, event = ["ToolChanged", comm])

        for i in range(int(numTabs)):
            cols.append(cmds.columnLayout())
            cmds.setParent(tabs)
            cmds.tabLayout(tabs, e=True, tabLabel=((cols[i], str(i + 1))))
        for i in range(len(objects)):
            cmds.setParent(cols[i / 5])
            row = cmds.rowLayout(nc = 4)
            cmds.setParent(row)
            toggleOn = partial(toggleWholeItem, i, True)
            toggleOff = partial(toggleWholeItem, i, False)
            cmds.checkBox(width = 190, onc = toggleOn, ofc = toggleOff, v = 1, label = "Import "+self.sessionObjects[objects[i]].transform+":", al = "left")
            cmds.separator(width = 20, style = "none")
            focusButtons.append(cmds.button(label = "Focus on object", width = 160, command = "selectAndViewObject('"+str(self.sessionObjects[objects[i]].transform)+"')"))
            cmds.setParent(cols[i / 5])
            radioButtons.append(cmds.radioButtonGrp(nrb = 2, la2 = ["NONE", "WALL"]))
            cmds.radioButtonGrp(radioButtons[i], e = True, sl = 1)
            text.append(cmds.text(label = "Set object name (optional)", font = "smallBoldLabelFont"))
            nameFields.append(cmds.textField(width = 380, text = self.sessionObjects[objects[i]].transform))
            row = cmds.rowLayout(nc = 4)
            cmds.setParent(row)
            hullRadButtons.append(cmds.radioButtonGrp(nrb = 2, width = 130, la2 = ["Generate Hull", ""]))
            userGivenHulls.append(None)
            giveHull = partial(attachUserHull, i, self.sessionObjects[objects[i]].transform)
            hullButtons.append(cmds.button(label = "Create Hull", width = 70, enable = False, command = giveHull))
            userHullTextFields.append(cmds.textField(text = '', en = False, width = 175))
            hideHullB = partial(toggleHullButton, i, False)
            showHullB = partial(toggleHullButton, i, True)
            cmds.radioButtonGrp(hullRadButtons[i], e = True, sl = 1, on1 = hideHullB, on2 = showHullB)
            cmds.setParent(cols[i / 5])   
            cmds.separator(height=20)
            prv = partial(navTab, tabs, cols[(i / 5) - 1])
            if i == len(objects) - 1:
                cmds.setParent(cols[i / 5])
                row = cmds.rowLayout(nc = 4)
                cmds.setParent(row)
                if i >= 5:
                    label = "Previous"
                    cmds.button(label = label,command = prv, width = 80)
                    cmds.separator(width = 213, style = "none")
                else:
                    cmds.separator(width = 295, style = "none")
                label = "Done"
                def helpPlease(*args):
                    print "Contratulations!  You got to the help function."
                    print nameFields
                    print radioButtons
                    print userHullTextFields
                    print objects
                    self.completeTagging(nameFields, radioButtons, userHullTextFields, objects, False)
                test = partial(helpPlease)
                cmds.button(label = label,command = test, width = 80)
                cmds.setParent(cols[i / 5])
                continue
            if i % 5 == 4:
                cmds.setParent(cols[i / 5])
                row = cmds.rowLayout(nc = 4)
                cmds.setParent(row)
                nxt = partial(navTab, tabs, cols[(i / 5) + 1])
                if i >= 5:
                    label = "Previous"
                    cmds.button(label = label, command = prv, width = 80)
                    cmds.separator(width = 213, style = "none")
                else:
                    cmds.separator(width = 295, style = "none")
                label = "Next"
                cmds.button(label = label, command = nxt, width = 80)
                cmds.setParent(cols[i / 5])
        cmds.showWindow()

    def completeTagging(self, nameFields, radioButtons, userHullTextFields, objects, force):
        print "COMPLETETAGGING"
        if not force:
            for hullText in userHullTextFields:
                if cmds.textField(hullText, q = True, en = True):
                    hullName = cmds.textField(hullText, q = True, text = True)
                    if hullName == "" or not cmds.objExists(hullName):
                        errorString = "One or more objects are not selected to auto generate a hull, but no hull has been provided (or the wrong name was given), continue with auto generated hulls for these objects?"
                        if (cmds.confirmDialog(title = "Hull not provided", message = errorString, button=['Yes','No'], defaultButton='Yes', cancelButton='No', dismissString='No' )) == "Yes":
                            self.completeTagging(nameFields, radioButtons, userHullTextFields, objects, True)
                            if hasattr(self, "hullJob"):
                                cmds.scriptJob(kill = self.hullJob)
                        return
        anyImported = False
        db = open(self.dbpath, "a+")
        for i in range(len(nameFields)):
            if not cmds.textField(nameFields[i], q = True, en = True):
                print self.newObjects
                self.newObjects.remove(i)
                print self.newObjects
                continue
            name =  cmds.textField(nameFields[i], q = True, text = True)
            activeButton = cmds.radioButtonGrp(radioButtons[i], q = True, sl = True)
            tag = cmds.radioButtonGrp(radioButtons[i], q = True, la2 = True)[activeButton - 1]
            self.sessionObjects[objects[i]].tag = tag
            hashstring = name + tag
            objectHash = self.createHash(hashstring)
            userSpecifiedHull = ''
            if cmds.textField(userHullTextFields[i], q = True, en = True):
                userSpecifiedHull = cmds.textField(userHullTextFields[i], q = True, text = True)
            if name != "":
                cmds.rename(self.sessionObjects[objects[i]].transform, name)
                self.sessionObjects[objects[i]].transform = name
            if cmds.listAttr(self.sessionObjects[objects[i]].transform, st='DAVEHASH') == None:
                cmds.addAttr(self.sessionObjects[objects[i]].transform, longName = "DAVEHASH", dataType = "string", hidden = False)
            cmds.setAttr(self.sessionObjects[objects[i]].transform+".DAVEHASH", objectHash, type = "string")
            if cmds.listAttr(self.sessionObjects[objects[i]].transform, st='DAVETAG') == None:
                cmds.addAttr(self.sessionObjects[objects[i]].transform, longName = "DAVETAG", dataType = "string", hidden = False)
            cmds.setAttr(self.sessionObjects[objects[i]].transform+".DAVETAG", tag, type = "string")
            cmds.setAttr(self.sessionObjects[objects[i]].transform+".DAVETAG", tag, type = "string")
            if self.sessionObjects[objects[i]].hull == [] and tag != "WALL":
                if userSpecifiedHull == '':
                    self.sessionObjects[objects[i]].genConvexHull()
                else:
                    hullName = userSpecifiedHull
                    self.sessionObjects[objects[i]].hullTransform = hullName
                    cmds.select(hullName+".vtx[0:]")
                    self.sessionObjects[objects[i]].outerHullVerts = []
                    for v in range(cmds.polyEvaluate(hullName, v = True)):
                        self.sessionObjects[objects[i]].outerHullVerts.append(cmds.pointPosition(hullName+".vtx["+str(v)+"]", w = True))
                    cmds.polyTriangulate(hullName)
                    cmds.select(hullName+".vtx[0:]")
                    yNormals = cmds.polyNormalPerVertex( query=True, y=True )
                    if (sum(yNormals)/float(len(yNormals))) < 0:
                        cmds.polyNormal(nm = 0)
                    numFaces = cmds.getAttr(hullName+".face", size=1)
                    for j in range(numFaces):
                        cmds.select(hullName+".f["+str(j)+"]")
                        verts = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
                        self.sessionObjects[objects[i]].hull.append(verts)
                self.sessionObjects[objects[i]].determineShape()
            if objectHash in self.db[0]:
                continue
            if not self.checkAgainstDatabase(objects[i]):
                if not anyImported:
                    db.write("\n!\n")
                    anyImported = True
                db.write("$\nNAME=%s\nTAG=%s\nHASH=%s\n$\n" % (name, tag, objectHash))
            self.sessionObjects[objects[i]].imported = True
            if hasattr(self.sessionObjects[objects[i]], "wrongBox"):
                if self.sessionObjects[objects[i]].wrongBox:
                    print "An object has a bad hull"
        if anyImported:
            db.write("!\n")
        db.close()
        cmds.select(d = True)
        cmds.deleteUI(self.secondaryWindow)
        self.tagWalls()

    def tagWalls(self):
        newWalls = []
        for i in range(len(self.sessionObjects)):
            if self.sessionObjects[i].tag == "WALL" and cmds.listAttr(self.sessionObjects[i].transform, st='DAVEBUILDING') == None and self.sessionObjects[i].enabled:
                self.walls.append(i)
                newWalls.append(i)
        if len(newWalls) != 0:
            numTabs = math.ceil(float(len(newWalls)) / 5.0)
            self.secondaryWindow = cmds.window(title="DAVE: Set buildings")
            form = cmds.formLayout()
            tabs = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5)
            cmds.formLayout(form, edit=True, attachForm=((tabs, 'top', 0), (tabs, 'left', 0), (tabs, 'bottom', 0), (tabs, 'right', 0)))
            cols = []
            fields = []
            for i in range(int(numTabs)):
                cols.append(cmds.columnLayout())
                cmds.setParent(tabs)
                cmds.tabLayout(tabs, e=True, tabLabel=((cols[i], str(i + 1))))
            for i in range(len(newWalls)):
                cmds.setParent(cols[i / 5])
                row = cmds.rowLayout(nc = 3)
                cmds.setParent(row)
                cmds.text(label = "Set building identifier for "+self.sessionObjects[newWalls[i]].transform+':', font = "boldLabelFont", width = 200)
                cmds.separator(width = 20, style = "none")
                cmds.button(label = "Focus on object", width = 160, command = "selectAndViewObject('"+str(self.sessionObjects[newWalls[i]].transform)+"')")
                cmds.setParent(cols[i / 5])
                cmds.columnLayout(width = 400)
                fields.append(cmds.optionMenu(label='Building Identifier'))
                for j in range(100):
                    cmds.menuItem(label=str(j + 1))
                cmds.separator(height=10)
                prv = partial(navTab, tabs, cols[(i / 5) - 1])
                if i == len(newWalls) - 1:
                    cmds.setParent(cols[i / 5])
                    row = cmds.rowLayout(nc = 4)
                    cmds.setParent(row)
                    if i >= 5:
                        label = "Previous"
                        cmds.button(label = label, command = prv, width = 80)
                        cmds.separator(width = 218, style = "none")
                    else:
                        cmds.separator(width = 300, style = "none")
                    label = "Done"
                    cmds.button(label = label, command = lambda x: self.processWalls(fields, newWalls), width = 80)
                    cmds.setParent(cols[i / 5])
                    continue
                if i % 5 == 4:
                    cmds.setParent(cols[i / 5])
                    row = cmds.rowLayout(nc = 4)
                    cmds.setParent(row)
                    nxt = partial(navTab, tabs, cols[(i / 5) + 1])
                    if i >= 5:
                        label = "Previous"
                        cmds.button(label = label, command = prv, width = 80)
                        cmds.separator(width = 218, style = "none")
                    else:
                        cmds.separator(width = 300, style = "none")
                    label = "Next"
                    cmds.button(label = label,command = nxt, width = 80)
                    cmds.setParent(cols[i / 5])
            cmds.showWindow()
        else:
            self.processWalls([], [])

    def processWalls(self, fields, newWalls):
        self.wallCollections = []
        for i in range(100):
            self.wallCollections.append([])
        if len(fields) != 0:
            for i in range(len(fields)):
                activeBuilding = int(cmds.optionMenu(fields[i], q = True, v = True)) - 1
                wallNo = newWalls[i]
                self.buildingStates[activeBuilding] = False
                if cmds.listAttr(self.sessionObjects[wallNo].transform, st='DAVEBUILDING') == None:
                    cmds.addAttr(self.sessionObjects[wallNo].transform, longName = "DAVEBUILDING", dataType = "string", hidden = False)
                cmds.setAttr(self.sessionObjects[wallNo].transform+".DAVEBUILDING", activeBuilding, type = "string")
            cmds.deleteUI(self.secondaryWindow)
        for i in range(len(self.walls)):
            activeBuilding = None
            if cmds.listAttr(self.sessionObjects[self.walls[i]].transform, st = "DAVEBUILDING") != None:
                activeBuilding = int(cmds.getAttr(self.sessionObjects[self.walls[i]].transform+".DAVEBUILDING"))
            wallNo = self.walls[i]
            self.wallCollections[activeBuilding].append(wallNo)
        self.tagRooms()

    def tagRooms(self):
        buildingSet = set()
        newWalls = []
        buildingCollection = []
        for i in range(100):
            buildingCollection.append([])
        for i in self.walls:
            if not self.sessionObjects[i].enabled:
                continue
            if cmds.listAttr(self.sessionObjects[i].transform, st = "DAVEBUILDING") != None:
                if cmds.listAttr(self.sessionObjects[i].transform, st = "DAVEROOM") == None:
                    bNo = int(cmds.getAttr(self.sessionObjects[i].transform+".DAVEBUILDING"))
                    buildingSet.add(bNo)
                    buildingCollection[bNo].append(i)
                    newWalls.append(i)
        buildings = []
        if len(buildingSet):
            buildings = list(buildingSet)
        numBuildings = len(buildings)
        self.secondaryWindow = cmds.window(title="DAVE: Set rooms")
        form = cmds.formLayout()
        tabs = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5)
        cmds.formLayout(form, edit=True, attachForm=((tabs, 'top', 0), (tabs, 'left', 0), (tabs, 'bottom', 0), (tabs, 'right', 0)))
        cols = []
        fields = []
        transforms = []
        if numBuildings != 0:
            for i in range(numBuildings):
                cols.append(cmds.scrollLayout(width = 404, height = 150))
                cmds.setParent(tabs)
                cmds.tabLayout(tabs, e=True, tabLabel=((cols[i], "Building "+str(buildings[i] + 1))))
            for i in range(numBuildings):
                for j in range(len(buildingCollection[buildings[i]])):
                    cmds.setParent(cols[i])
                    row = cmds.rowLayout(nc = 3)
                    cmds.setParent(row)
                    transforms.append(self.sessionObjects[buildingCollection[buildings[i]][j]].transform)
                    cmds.text(label = "Set room identifier for "+self.sessionObjects[buildingCollection[buildings[i]][j]].transform+':', font = "boldLabelFont", width = 200)
                    cmds.separator(width = 20, style = "none")
                    cmds.button(label = "Focus on object", width = 160, command = "selectAndViewObject('"+str(self.sessionObjects[buildingCollection[buildings[i]][j]].transform)+"')")
                    cmds.setParent(cols[i])
                    cmds.columnLayout(width = 400)
                    fields.append(cmds.optionMenu(label='Room Identifier'))
                    for k in range(100):
                        cmds.menuItem(label=str(k + 1))
                    cmds.separator(height=10)
                    prv = partial(navTab, tabs, cols[i - 1])
                    if j == len(buildingCollection[buildings[i]]) - 1 and i == numBuildings - 1:
                        cmds.setParent(cols[i])
                        row = cmds.rowLayout(nc = 4)
                        cmds.setParent(row)
                        if i >= 1:
                            label = "Previous"
                            cmds.button(label = label, command = prv, width = 80)
                            cmds.separator(width = 218, style = "none")
                        else:
                            cmds.separator(width = 300, style = "none")
                        label = "Done"
                        cmds.button(label = label, command = lambda x: self.processRooms(fields, newWalls, transforms), width = 80)
                        cmds.setParent(cols[i])
                        continue
                    if j == len(buildingCollection[buildings[i]]) - 1:
                        cmds.setParent(cols[i])
                        row = cmds.rowLayout(nc = 4)
                        cmds.setParent(row)
                        nxt = partial(navTab, tabs, cols[i + 1])
                        if i >= 1:
                            label = "Previous"
                            cmds.button(label = label, command = prv, width = 80)
                            cmds.separator(width = 218, style = "none")
                        else:
                            cmds.separator(width = 300, style = "none")
                        label = "Next"
                        cmds.button(label = label, command = nxt, width = 80)
                        cmds.setParent(cols[i])
            cmds.showWindow()
        else:
            self.processRooms([], [], [])

    def processRooms(self, fields, newWalls, transforms):
        for i in self.newObjects:
            self.sessionObjects[i].enabled = True
        #This is the final step of import so we can assume all objects are now present
        self.roomCollections = []
        for i in range(100):
            self.roomCollections.append([])
            for j in range(100):
                self.roomCollections[i].append([])
        if len(fields) != 0:
            for i in range(len(fields)):
                activeRoom = int(cmds.optionMenu(fields[i], q = True, v = True)) - 1
                activeBuilding = int(cmds.getAttr(transforms[i]+".DAVEBUILDING"))
                wallNo = newWalls[i]
                self.roomStates[activeBuilding][activeRoom] = False
                if cmds.listAttr(transforms[i], st='DAVEROOM') == None:
                    cmds.addAttr(transforms[i], longName = "DAVEROOM", dataType = "string", hidden = False)
                cmds.setAttr(transforms[i]+".DAVEROOM", activeRoom, type = "string")
            cmds.deleteUI(self.secondaryWindow)
        for i in range(len(self.walls)):
            activeBuilding = None
            if not self.sessionObjects[self.walls[i]].enabled:
                continue
            if cmds.listAttr(self.sessionObjects[self.walls[i]].transform, st = "DAVEBUILDING") != None:
                activeBuilding = int(cmds.getAttr(self.sessionObjects[self.walls[i]].transform+".DAVEBUILDING"))
            if cmds.listAttr(self.sessionObjects[self.walls[i]].transform, st = "DAVEROOM") != None:
                activeRoom = int(cmds.getAttr(self.sessionObjects[self.walls[i]].transform+".DAVEROOM"))
            wallNo = self.walls[i]
            self.roomCollections[activeBuilding][activeRoom].append(wallNo)
        self.checkBuildingHullStates()



    def checkBuildingHullStates(self):
        roomsNeeded = []
        roomTransforms = []
        for building in range(len(self.wallCollections)):
            for room in range(len(self.roomCollections[building])):
                if not self.roomStates[building][room] and len(self.roomCollections[building][room]) != 0:
                    roomsNeeded.append([building, room])
                    roomTransforms.append([])
                    for wall in self.roomCollections[building][room]:
                        roomTransforms[len(roomTransforms) - 1].append(self.sessionObjects[wall].transform)

        numRooms = len(roomsNeeded)
        self.secondaryWindow = cmds.window(title="DAVE: Set room floorplans")
        form = cmds.formLayout()
        tabs = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5)
        cmds.formLayout(form, edit=True, attachForm=((tabs, 'top', 0), (tabs, 'left', 0), (tabs, 'bottom', 0), (tabs, 'right', 0)))
        cols = []
        fields = []
        if numRooms != 0:
            for i in range(numRooms):
                cols.append(cmds.scrollLayout(width = 404, height = 150))
                cmds.setParent(tabs)
                cmds.tabLayout(tabs, e=True, tabLabel=((cols[i], "Building "+str(roomsNeeded[i][0] + 1)+", room "+str(roomsNeeded[i][1] + 1))))  

            def selectRoom(*args):
                cmds.select(d = True)
                cmds.select(args[0])
                cmds.viewFit(args[0])  
            
            def attachUserHull(*args):
                selectAndViewObject(args[1])
                def checkNewHulls(*args):
                    if [s for s in cmds.ls(sl = True)][0][:11] == "polySurface":
                        hullName = "building"+str(args[0] + 1)+"Room"+str(args[1] + 1)+"_flr"
                        cmds.rename([s for s in cmds.ls(sl = True)][0], hullName)
                        cmds.textField(fields[args[2]], e = True, text = hullName)
                        cmds.addAttr(hullName, longName = "DAVEPLANBUILDING", dataType = "string", hidden = False)
                        cmds.setAttr(hullName+".DAVEPLANBUILDING", args[0], type = "string")
                        cmds.addAttr(hullName, longName = "DAVEPLANROOM", dataType = "string", hidden = False)
                        cmds.setAttr(hullName+".DAVEPLANROOM", args[1], type = "string")
                cmds.setToolTo(self.hullTool)
                comm = partial(checkNewHulls, args[2], args[3], args[0])
                self.hullJob = cmds.scriptJob(runOnce = True, event = ["ToolChanged", comm])

            for i in range(numRooms):
                cmds.setParent(cols[i])
                row = cmds.rowLayout(nc = 3)
                cmds.setParent(row)
                cmds.text(label = "Set floor plan for Building "+str(roomsNeeded[i][0] + 1)+", room "+str(roomsNeeded[i][1] + 1)+':', font = "boldLabelFont", width = 200)
                cmds.separator(width = 20, style = "none")
                focus = partial(selectRoom, roomTransforms[i])
                cmds.button(label = "Focus on room", width = 160, command = focus)
                cmds.setParent(cols[i])
                cmds.columnLayout(width = 400)
                giveHull = partial(attachUserHull, i, roomTransforms[i], roomsNeeded[i][0], roomsNeeded[i][1])
                row = cmds.rowLayout(nc = 2)
                cmds.setParent(row)
                cmds.button(label='Create Hull', command = giveHull, width = 80)
                fields.append(cmds.textField(text = "", width = 300))
                cmds.setParent(cols[i])
                cmds.separator(height=10)
                prv = partial(navTab, tabs, cols[i - 1])
                if i == numRooms - 1:
                    cmds.setParent(cols[i])
                    row = cmds.rowLayout(nc = 4)
                    cmds.setParent(row)
                    if i >= 1:
                        label = "Previous"
                        cmds.button(label = label, command = prv, width = 80)
                        cmds.separator(width = 218, style = "none")
                    else:
                        cmds.separator(width = 300, style = "none")
                    label = "Done"
                    cmds.button(label = label, command = lambda x: self.genBuildingHulls(fields, roomsNeeded, False), width = 80)
                    cmds.setParent(cols[i])
                    continue
                cmds.setParent(cols[i])
                row = cmds.rowLayout(nc = 4)
                cmds.setParent(row)
                nxt = partial(navTab, tabs, cols[i + 1])
                if i >= 1:
                    label = "Previous"
                    cmds.button(label = label, command = prv, width = 80)
                    cmds.separator(width = 218, style = "none")
                else:
                    cmds.separator(width = 300, style = "none")
                label = "Next"
                cmds.button(label = label, command = nxt, width = 80)
                cmds.setParent(cols[i])
            cmds.showWindow()
        
    def genBuildingHulls(self, fields, rooms, force):
        if not force:
            for hullText in fields:
                if cmds.textField(hullText, q = True, en = True):
                    hullName = cmds.textField(hullText, q = True, text = True)
                    if hullName == "" or not cmds.objExists(hullName):
                        errorString = "One or more room hulls have not been provided, or the wrong name was given, continue with *REALLY BAD* AABB's?"
                        if (cmds.confirmDialog(title = "Floorplan not provided", message = errorString, button=['Yes','No'], defaultButton='Yes', cancelButton='No', dismissString='No' )) == "Yes":
                            self.genBuildingHulls(fields, rooms, True)
                            if hasattr(self, "hullJob"):
                                cmds.scriptJob(kill = self.hullJob)
                        return
        for room in rooms:
            self.roomStates[room[0]][room[1]] = True
        for i in range(len(fields)):
            hullName = cmds.textField(fields[i], q = True, text = True)
            cmds.select(hullName+".vtx[0:]")
            for v in range(cmds.polyEvaluate(hullName, v = True)):
                self.roomOuterPlans[rooms[i][0]][rooms[i][1]].append(cmds.pointPosition(hullName+".vtx["+str(v)+"]", w = True))
            cmds.polyTriangulate(hullName)
            cmds.select(hullName+".vtx[0:]")
            yNormals = cmds.polyNormalPerVertex( query=True, y=True )
            if (sum(yNormals)/float(len(yNormals))) < 0:
                cmds.polyNormal(nm = 0)
            numFaces = cmds.getAttr(hullName+".face", size=1)
            for j in range(numFaces):
                cmds.select(hullName+".f["+str(j)+"]")
                verts = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
                self.roomPlans[rooms[i][0]][rooms[i][1]].append(verts)
        cmds.deleteUI(self.secondaryWindow)

    def pointTriangleTest(self, point, triVerts):
        def lineSegmentTest(s1, s2):
            if max(s1[0], s1[2]) < min(s2[0], s2[2]):
                return False
            grad1 = sys.maxint
            dy1 = s1[1] - s1[3]
            dx1 = s1[0] - s1[2]
            if dx1 != 0:
                grad1 = dy1/dx1
            grad2 = sys.maxint
            dy2 = s2[1] - s2[3]
            dx2 = s2[0] - s2[2]
            if dx2 != 0:
                grad2 = dy2/dx2
            if grad1 == grad2:
                return False
            c1 = s1[1] - (grad1 * s1[0])
            c2 = s2[1] - (grad2 * s2[0])
            pi = [None, None]
            pi[0] = (c2 - c1) / (grad1 - grad2)
            pi[1] = grad1 * pi[0] + c1
            if pi[0] < max(min(s1[0], s1[2]), min(s2[0], s2[2])) or pi[0] > min(max(s1[0], s1[2]), max(s2[0], s2[2])):
                return False
            else:
                return True

        mX = 2 * random.randint(0, 1) - 1
        mY = 2 * random.randint(0, 1) - 1
        bx = max(triVerts, key = lambda x: x[0])[0]
        by = max(triVerts, key = lambda x: x[1])[1]
        pointSeg = [point[0], point[1], bx * 2, by * 2]
        intersections = 0
        for i in range(3):
            v1 = triVerts[i - 1]
            v2 = triVerts[i]
            triSeg = [v1[0], v1[1], v2[0], v2[1]]
            if lineSegmentTest(pointSeg, triSeg):
                intersections += 1
        if intersections % 2 == 1:
            return True

    def pointCmplxHullTest(self, point, cmplxHull):
        for triangle in cmplxHull:
            triVPos = []
            for vert in triangle:
                pos = cmds.pointPosition(vert)
                triVPos.append([pos[0], pos[2]])
            if self.pointTriangleTest(point, triVPos):
                return True
        return False

    def demoTest(self):
        failed = []
        for ob in self.sessionObjects:
            if not ob.enabled:
                continue
            bbox = cmds.exactWorldBoundingBox(ob.hullTransform)
            hull = []
            if hasattr(ob, "hull"):
                hull = ob.hull
            else:
                continue
            for i in range(1000):
                point = [random.uniform(bbox[0], bbox[3]), random.uniform(bbox[2], bbox[5])]
                tests = 0
                while not self.pointCmplxHullTest(point, hull):
                    point = [random.uniform(bbox[0], bbox[3]), random.uniform(bbox[2], bbox[5])]
                cmds.polyCube(w = 0.05, d = 0.05, h = 0.05)
                cmds.move(point[0], 0, point[1])

def main():
    dave = daveManager("D:/Python/DAVE/DAVE/")
    urllib.urlretrieve("https://www.glovefx.com/s/dave.png", dave.path+"fetch/header.png")
    urllib.urlretrieve("https://www.glovefx.com/s/hull.png", dave.path+"fetch/hull.png")
    dave.UI()
    
if __name__== "__main__":
  main()

