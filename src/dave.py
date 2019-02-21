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
import time
from functools import partial

'''
navTab:
    Used in various UI elements to navigate through a set of tabs(args[0]) to a particular tab(args[1])
'''
def navTab(*args):
    cmds.tabLayout(args[0], e = True, st = args[1])

'''
vectorMix:
    Used to linearly interpolate between two vectors
'''
def vectorMix(vector1, vector2, mix):
    if len(vector1) != len(vector2):
        print "Vectors given to function vectorMix have differing number of dimensions!"
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
    mComp = 1.0 - mix
    return [mComp * a1 + mix * a2, mComp * b1 + mix * b2, mComp * c1 + mix * c2]

'''
vectorUnitize:
    Returns the unit vector of vector1
'''
def vectorUnitize(vector1):
    l = vectorLength(vector1)
    if len(vector1) == 2:
        return vectorDivide(vector1, [l, l])
    else:
        return vectorDivide(vector1, [l, l, l])

'''
vectorAngle:
    Returns the angle between two vectors
'''
def vectorAngle(vector1, vector2):
    magU = vectorLength(vector1)
    magV = vectorLength(vector2)
    uDotV = vectorDot(vector1, vector2)
    cosTheta = uDotV / (magU * magV)
    return math.acos(cosTheta)

'''
vectorDot:
    Returns the dot product of vector1 and vector2
'''
def vectorDot(vector1, vector2):
    if len(vector1) != len(vector2):
        print "Vectors given to function vectorDot have differing number of dimensions!"
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

'''
vectorSum:
    Returns the sum of vector1 and vector2
'''
def vectorSum(vector1, vector2):
    if len(vector1) != len(vector2):
        print "Vectors given to function vectorSum have differing number of dimensions!"
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
    return [a1 + a2, b1 + b2, c1 + c2]

'''
vectorDifference:
    Returns vector1 - vector2
'''
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
    
'''
vectorDivide:
    Used to divide one vector (numerator) by another (denominator).  Returns the result
'''
def vectorDivide(numerator, denominator):
    if len(numerator) != len(denominator):
        print "Vectors given to function vectorDivide have differing number of dimensions!"
        return None
    if 0 in denominator:
        print "One or more components of denominator given to vectorDivide were zero!"
        return None
    a1 = numerator[0]
    b1 = numerator[1]
    c1 = 1
    a2 = denominator[0]
    b2 = denominator[1]
    c2 = 1
    if len(numerator) == 3:
        c1 = numerator[2]
        c2 = denominator[2]
        return [a1 / a2, b1 / b2, c1 / c2]
    else:
        return [a1 / a2, b1 / b2]

'''
vectorProduct:
    Returns vector1 multiplied element-wise by vector2
'''
def vectorProduct(vector1, vector2):
    if len(vector1) != len(vector2):
        print "Vectors given to function vectorProduct have differing number of dimensions!"
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
    return [a1 * a2, b1 * b2, c1 * c2]

'''
vectorLength:
    Returns the length of a given vector
'''
def vectorLength(vector):
    a = vector[0]
    b = vector[1]
    c = 0.0
    if (len(vector) == 3):
        c = vector[2]
    return math.sqrt(math.pow(a, 2) + math.pow(b, 2) + math.pow(c, 2))

'''
selectAndViewObject:
    Used in various UI elements to select a given object and centre it in the viewport
'''
def selectAndViewObject(objectName):
    cmds.select(objectName)
    cmds.viewFit(objectName)  

'''
daveObject:
    Class data structure that handles individual objects used by the tool itself, contains their relevant methods
'''
class daveObject:
    def __init__(self, transform, id):
        print "Object added with name "+str(transform)+" and ID "+str(id)
        self.transform = transform #Object's transform name (THIS MEANS THAT THE TOOL NEEDS EVERY KNOWN OBJECT TO HAVE A UNIQUE NAME,
                                   #THIS CAN BE CHANGED TO BE INDEPENDANT AND WORK WITH HEIRARCHIES)
        self.index = id            #The object's position in DAVE's 'sessionObjects' list.
        self.imported = False
        self.hull = {
            "tris": [],
            "outer": [],
            "placementVerts": [],
            "height": 0,
            "transform": ""
        }
        self.wrongBox = False
        self.hash = 0
        self.tag = None
        self.enabled = False
        self.processed = False
        self.processable = True
        self.searchForHull()
        if cmds.listAttr(self.transform, st = "DAVEHULLFLIPPED") == None:
            cmds.addAttr(self.transform, longName = "DAVEHULLFLIPPED", dataType = "string", hidden = False)
            cmds.setAttr(self.transform+".DAVEHULLFLIPPED", "False", type = "string")

    def grabVerts(self):
        self.topVerts = []
        allVPos = []
        maxVPos = -sys.maxint
        minVPos = sys.maxint
        numVerts = cmds.polyEvaluate(self.transform, v = True)
        for i in range(numVerts):
            allVPos.append(cmds.pointPosition(self.transform + ".vtx[" + str(i) + "]", w = True))
            maxVPos = max(maxVPos, allVPos[i][1])
            minVPos = min(minVPos, allVPos[i][1])
        topMargin = maxVPos - ((maxVPos - minVPos) * 0.3)
        self.hull["height"] = maxVPos
        upperVerts = []
        upperVertsIndex = []
        for i in range(numVerts):
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

    def searchForHull(self):
        self.grabVerts()
        if cmds.objExists("*_usrHull"):
            cmds.select(d = True)
            cmds.select("*_usrHull")
            for s in cmds.ls(sl = True):
                if cmds.listAttr(s, st='DAVEHULL') != None:
                    if cmds.getAttr(s+".DAVEHULL") == self.transform:
                        self.hull["transform"] = s
                        self.hull["outer"] = []
                        for v in range(cmds.polyEvaluate(s, v = True)):
                            self.hull["outer"].append(s+".vtx["+str(v)+"]")
                        numFaces = cmds.getAttr(s+".face", size=1)
                        for j in range(numFaces):
                            cmds.select(s+".f["+str(j)+"]")
                            verts = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
                            self.hull["tris"].append(verts)
                        return True
        elif cmds.objExists("*_cvxHull"):
            cmds.select(d = True)
            cmds.select("*_cvxHull")
            for s in cmds.ls(sl = True):
                if cmds.listAttr(s, st='DAVEHULL') != None:
                    if cmds.getAttr(s+".DAVEHULL") == self.transform:
                        self.hull["transform"] = s
                        self.hull["outer"] = []
                        for v in range(cmds.polyEvaluate(s, v = True)):
                            self.hull["outer"].append(s+".vtx["+str(v)+"]")
                        numFaces = cmds.getAttr(s+".face", size=1)
                        for j in range(numFaces):
                            cmds.select(s+".f["+str(j)+"]")
                            verts = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
                            self.hull["tris"].append(verts)
                        return True
        return False

    def genConvexHull(self):
        self.grabVerts()
        if self.hull["tris"] != [] and cmds.objExists(self.hull["transform"]):
            return
        if len(self.topVerts) < 3:
            self.hull["outer"] = []
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
        facetList = []
        self.cvxHVerts = stack
        for i in range(len(stack)):
            pos = self.topVerts[stack[i]]
            facetList.append((pos[0], self.hull["height"], pos[2]))
        if len(facetList) < 3:
            self.hull["outer"] = []
            self.wrongBox = True
            return
        cmds.polyCreateFacet(name = self.transform+"_cvxHull", p = facetList)
        sf = 100
        currentUnit = cmds.currentUnit(q = True, linear = True)
        if currentUnit == "cm" or currentUnit == "centimeter":
            sf = 1
        elif currentUnit == "mm" or currentUnit == "millimeter":
            sf = 0.1
        cmds.scale(sf, sf, sf)
        cmds.polyNormal(nm = 0)
        cmds.setAttr(self.transform+".DAVEHULLFLIPPED", "True", type = "string")
        cmds.polyTriangulate(self.transform+"_cvxHull")
        cmds.select(self.transform+"_cvxHull.vtx[0:]")
        self.hull["outer"] = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
        numFaces = cmds.getAttr(self.transform+"_cvxHull.face", size=1)
        self.hull["tris"] = []
        for j in range(numFaces):
            cmds.select(self.transform+"_cvxHull.f["+str(j)+"]")
            verts = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
            self.hull["tris"].append(verts)
        if len(facetList) == 3:
            print "Hull has only 3 verts, may be incorrect."
            self.wrongBox = True
        elif (max(facetList, key = lambda x: x[0])[0] > max(self.topVerts, key = lambda x: x[0])[0] or
            max(facetList, key = lambda x: x[2])[2] > max(self.topVerts, key = lambda x: x[2])[2] or
            min(facetList, key = lambda x: x[0])[0] < min(self.topVerts, key = lambda x: x[0])[0] or
            max(facetList, key = lambda x: x[2])[2] < min(self.topVerts, key = lambda x: x[2])[2]):
            print "BBOX ERROR!"
            self.wrongBox = True
        else:
            self.wrongBox = False
        self.hull["transform"] = self.transform+"_cvxHull"
        cmds.addAttr(self.hull["transform"], longName = "DAVEHULL", dataType = "string", hidden = False)
        cmds.setAttr(self.hull["transform"]+".DAVEHULL", self.transform, type = "string")

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
        self.roomData = []
        for i in range(100):
            self.buildingStates.append(False)
            self.roomStates.append([])
            self.roomData.append([])
            for j in range(100):
                dictStructure = {
                    "transform": "",
                    "tag": "NONE",
                    "outer": [],
                    "tris": [],
                    "wallVerts": [],
                    "centre": [],
                    "id": [i, j],
                    "processed": False,
                    "upperBound": -sys.maxint,
                    "exclusionVols": [],
                    "walls": [],
                    "doors": [],
                    "spawnKeys": {},
                    "spice": [],
                    "styleNumA": random.randint(1, 4),
                    "styleNumB": random.randint(1, 4),
                    "styleNumC": random.randint(1, 4)
                }
                self.roomStates[i].append(False)
                self.roomData[i].append(dictStructure)
        self.masterSpacingDict = {
            "WALL": 0.5,
            "DININGTABLE": 0.6,
            "TABLE": 0.3,
            "DESK": 0.6,
            "COUNTERTOP": 0.2,
            "DEFAULT": 0.1
        }
        self.kitchenSpiceProps = ["MICROWAVE", "KETTLE", "TOASTER", "SUGAR", "SUGAR", "GLASS", "SPICE4", "SPICE3"]
        self.hullTool = cmds.polyCreateFacetCtx(i1 = self.dbpath+"fetch/hull.png")
        self.delTransforms = []
        self.omDeleteChecks = []
        self.cleanImport()
        '''
        python is simple
        makes programming fast and slick
        but no pointer type
        '''

    def cleanImport(self):
        self.importQueue = {
            "models": [],
            "modelTransforms": {},
            "positions": [],
            "rotations": [],
            "attributes": [],
            "roomIDs": [],
            "tags": []
        }

    def cleanup(self):
        if hasattr(self, "secondaryWindow"):
            if (cmds.window(self.secondaryWindow, exists=True)):
                cmds.deleteUI(self.secondaryWindow)
        for event in self.omDeleteChecks:
            om.MNodeMessage.removeCallback(event)
        print "Exiting DAVE..."
        del self

    def __del__(self):
        pass
        
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
        col = cmds.columnLayout()
        cmds.image(image = self.path+"fetch/header.png")
        cmds.rowLayout(nc = 1)
        cmds.text("Scene setup:")
        cmds.setParent(col)
        cmds.rowLayout(nc = 2)
        cmds.button(label = "Import Selection", width=150, c = lambda x: self.importSelectedObjects())
        cmds.button(label = "Scan Scene", width = 150, c = lambda x: self.scanSceneAndImport())
        cmds.setParent(col)
        cmds.rowLayout(nc = 1)
        cmds.separator(height = 5)
        cmds.setParent(col)
        cmds.rowLayout(nc = 1)
        cmds.text("Decoration:")
        cmds.setParent(col)
        cmds.rowLayout(nc = 2)
        cmds.button(label="Switch Props", width = 150, c = lambda x: self.switchProps())
        cmds.button(label="Decorate Scene", width = 150, c = lambda x: self.runAllDecor())
        cmds.setParent(col)
        cmds.rowLayout(nc = 1)
        cmds.separator(height = 5)
        cmds.setParent(col)
        cmds.rowLayout(nc = 1)
        cmds.text("Remove all attributes associated to the Tool and Exit:")
        cmds.setParent(col)
        cmds.rowLayout(nc = 1)
        cmds.button(label="Eject", c = lambda x: self.eject())
        cmds.setParent(col)
        cmds.showWindow()
        self.mainWindowCloseJob = cmds.scriptJob(uiDeleted = [self.window, self.cleanup], ro = True)

    def checkForDeletions(self, transform):
        if str(cmds.ls(sl = True)) == "[]":
            return
        if cmds.objExists(transform):
            cmds.select(transform)
            node = pm.selected()[0]
            if node in self.delTransforms:
                return
            mObj = node.__apimobject__()
            self.omDeleteChecks.append(om.MNodeMessage.addNodePreRemovalCallback(mObj, self.searchSessionForObject, node))
            self.delTransforms.append(node)

    def searchSessionForObject(self, *args):
        transform = args[1]
        matches = []
        for ob in self.sessionObjects:
            if ob.enabled and ob.transform == transform:
                matches.append(ob.index)
        if len(matches) > 1:
            return
        if not len(matches):
            return
        else:
            self.sessionObjects[matches[0]].enabled = False
            self.delTransforms.remove(args[0])
            if cmds.objExists(args[1]+"_*Hull"):
                cmds.select(args[1]+"_*Hull")
            if cmds.objExists(args[1]+"*flr"):
                cmds.select(args[1]+"*flr", add = True)
            cmds.delete()

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
        geometry = cmds.ls(geometry=True)
        transforms = cmds.listRelatives(geometry, p=True, pa = True)
        cmds.select(transforms)
        self.importSelectedObjects()

    def importSelectedObjects(self):
        if cmds.objExists("*_usrHull"):
            cmds.select("*_usrHull", d = True)
        if cmds.objExists("*_cvxHull"):
            cmds.select("*_cvxHull", d = True)
        if cmds.objExists("*_flr"):
            cmds.select("*_flr", d = True)
        for item in cmds.ls(sl = True):
            if cmds.listAttr(item, st = "DAVEIMPORTED") != None:
                if cmds.getAttr(item+".DAVEIMPORTED") == "True":
                    cmds.select(item, d = True)
        selection = cmds.ls(sl = True)
        if cmds.objExists("*_flr"):
            cmds.select("*_flr")
            for s in cmds.ls(sl = True):
                if cmds.listAttr(s, st = "DAVEPLANBUILDING") and cmds.listAttr(s, st = "DAVEPLANBUILDING"):
                    building = int(cmds.getAttr(s+".DAVEPLANBUILDING"))
                    room = int(cmds.getAttr(s+".DAVEPLANROOM"))
                    cmds.select(s+".vtx[0:]")
                    self.roomData[building][room]["tris"] = []
                    self.roomData[building][room]["outer"] = []
                    for v in range(cmds.polyEvaluate(s, v = True)):
                        self.roomData[building][room]["outer"].append(s+".vtx["+str(v)+"]")
                    self.roomData[building][room]["transform"] = s
                    sigPos = [0, 0, 0]
                    for v in self.roomData[building][room]["outer"]:
                        sigPos = vectorSum(sigPos, cmds.pointPosition(v))
                    numVerts = len(self.roomData[building][room]["outer"])
                    self.roomData[building][room]["centre"] = vectorDivide(sigPos, [numVerts, numVerts, numVerts])
                    self.roomData[building][room]["radius"] = vectorLength(cmds.pointPosition(max([v for v in self.roomData[building][room]["outer"]], key = lambda x: vectorLength(cmds.pointPosition(x)))))
                    cmds.polyTriangulate(s)
                    cmds.select(s+".vtx[0:]")
                    yNormals = cmds.polyNormalPerVertex( query=True, y=True )
                    if cmds.listAttr(self.roomData[building][room]["transform"], st = "DAVEHULLFLIPPED") == None:
                        cmds.addAttr(self.roomData[building][room]["transform"], longName = "DAVEHULLFLIPPED", dataType = "string", hidden = False)
                        cmds.setAttr(self.roomData[building][room]["transform"]+".DAVEHULLFLIPPED", "False", type = "string")
                    if (sum(yNormals)/float(len(yNormals))) < 0:
                        cmds.polyNormal(nm = 0)
                        cmds.setAttr(self.roomData[building][room]["transform"]+".DAVEHULLFLIPPED", "True", type = "string")
                    numFaces = cmds.getAttr(s+".face", size=1)
                    for j in range(numFaces):
                        cmds.select(s+".f["+str(j)+"]")
                        verts = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
                        self.roomData[building][room]["tris"].append(verts)
                    self.roomStates[building][room] = True
                    if cmds.listAttr(s, st = "DAVEROOMTAG") == None:
                        self.roomStates[building][room] = False
                    else:
                        self.roomData[building][room]["tag"] = cmds.getAttr(s+".DAVEROOMTAG")

        for ob in self.sessionObjects:
            if len(ob.hull["outer"]) and not ob.wrongBox and not cmds.objExists(ob.hull["transform"]) and ob.enabled:
                if not ob.searchForHull():
                    ob.genConvexHull()


        toBeImported = []
        self.newObjects = []
        for i in range(len(selection)):
            if cmds.listAttr(selection[i], st='DAVEHULL') != None:
                continue
            currentIndex = len(self.sessionObjects)
            if not any(dObject.transform == selection[i] for dObject in self.sessionObjects if dObject.enabled):
                self.sessionObjects.append(daveObject(selection[i], currentIndex))
                self.newObjects.append(currentIndex)
                self.checkForDeletions(self.sessionObjects[currentIndex].transform)
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
        if hasattr(self, "secondaryWindow"):
            if (cmds.window(self.secondaryWindow, exists=True)):
                cmds.deleteUI(self.secondaryWindow)
        self.secondaryWindow = cmds.window(title="DAVE: Set tags for objects")
        form = cmds.formLayout()
        tabs = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5)
        cmds.formLayout(form, edit=True, attachForm=((tabs, 'top', 0), (tabs, 'left', 0), (tabs, 'bottom', 0), (tabs, 'right', 0)))
        numTabs = math.ceil(float(len(objects)) / 5.0)
        cols = []
        text = []
        focusButtons = []
        opMenus = []
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
            cmds.optionMenu(opMenus[args[0]], e = True, en = args[1])
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
            opMenus.append(cmds.optionMenu())
            cmds.menuItem(label = "Wall")
            cmds.menuItem(label = "Door")
            cmds.menuItem(label = "Dining Table")
            cmds.menuItem(label = "None")
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
                cmds.button(label = label,command = lambda x: self.completeTagging(nameFields, opMenus, userHullTextFields, objects, False), width = 80)
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

    def completeTagging(self, nameFields, opMenus, userHullTextFields, objects, force):
        if not force:
            for hullText in userHullTextFields:
                if cmds.textField(hullText, q = True, en = True):
                    hullName = cmds.textField(hullText, q = True, text = True)
                    if hullName == "" or not cmds.objExists(hullName):
                        errorString = "One or more objects are not selected to auto generate a hull, but no hull has been provided (or the wrong name was given), continue with auto generated hulls for these objects?"
                        if (cmds.confirmDialog(title = "Hull not provided", message = errorString, button=['Yes','No'], defaultButton='Yes', cancelButton='No', dismissString='No' )) == "Yes":
                            self.completeTagging(nameFields, opMenus, userHullTextFields, objects, True)
                            if hasattr(self, "hullJob"):
                                cmds.scriptJob(kill = self.hullJob)
                        return
        anyImported = False
        db = open(self.dbpath, "a+")
        delList = []
        for i in range(len(nameFields)):
            if not cmds.textField(nameFields[i], q = True, en = True):
                delList.append(i)
                continue
            name =  cmds.textField(nameFields[i], q = True, text = True)
            tag = cmds.optionMenu(opMenus[i], q = True, v = True).upper().replace(" ","")
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
            if self.sessionObjects[objects[i]].hull["outer"] == [] and tag != "WALL" and tag != "DOOR":
                if userSpecifiedHull == '':
                    self.sessionObjects[objects[i]].genConvexHull()
                else:
                    hullName = userSpecifiedHull
                    self.sessionObjects[objects[i]].hullTransform = hullName
                    cmds.select(hullName+".vtx[0:]")
                    self.sessionObjects[objects[i]].hull["outer"] = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
                    cmds.polyTriangulate(hullName)
                    cmds.select(hullName+".vtx[0:]")
                    yNormals = cmds.polyNormalPerVertex( query=True, y=True )
                    if cmds.listAttr(hullName, st = "DAVEHULLFLIPPED") == None:
                        cmds.addAttr(hullName, longName = "DAVEHULLFLIPPED", dataType = "string", hidden = False)
                        cmds.setAttr(hullName+".DAVEHULLFLIPPED", "False", type = "string")
                    if (sum(yNormals)/float(len(yNormals))) < 0:
                        cmds.polyNormal(nm = 0)
                        cmds.setAttr(hullName+".DAVEHULLFLIPPED", "True", type = "string")
                    numFaces = cmds.getAttr(hullName+".face", size=1)
                    for j in range(numFaces):
                        cmds.select(hullName+".f["+str(j)+"]")
                        verts = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
                        self.sessionObjects[objects[i]].hull["tris"].append(verts)
            if objectHash in self.db[0]:
                continue
            if not self.checkAgainstDatabase(objects[i]):
                if not anyImported:
                    db.write("\n!\n")
                    anyImported = True
                db.write("$\nNAME=%s\nTAG=%s\nHASH=%s\n$\n" % (name, tag, objectHash))
            self.sessionObjects[objects[i]].imported = True
        for di in range(len(delList)):
            del self.newObjects[delList[di] - di]
        if anyImported:
            db.write("!\n")
        db.close()
        cmds.select(d = True)
        cmds.deleteUI(self.secondaryWindow)
        self.tagWalls()

    def tagWalls(self):
        newWalls = []
        for i in self.newObjects:
            if (self.sessionObjects[i].tag == "WALL" or self.sessionObjects[i].tag == "DOOR") and cmds.listAttr(self.sessionObjects[i].transform, st='DAVEBUILDING') == None:
                self.walls.append(i)
                newWalls.append(i)
        if len(newWalls) != 0:
            numTabs = math.ceil(float(len(newWalls)) / 5.0)
            if hasattr(self, "secondaryWindow"):
                if (cmds.window(self.secondaryWindow, exists=True)):
                    cmds.deleteUI(self.secondaryWindow)
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
            if not (self.walls[i] in self.newObjects) or not (self.sessionObjects[self.walls[i]].enabled):
                continue
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
            if i not in self.newObjects:
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
        if hasattr(self, "secondaryWindow"):
            if (cmds.window(self.secondaryWindow, exists=True)):
                cmds.deleteUI(self.secondaryWindow)
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
            if not len(self.sessionObjects[i].hull["outer"]) and not self.sessionObjects[i].wrongBox and self.sessionObjects[i].tag != "WALL" and self.sessionObjects[i].tag != "DOOR":
                self.sessionObjects[i].genConvexHull()
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
            activeRoom = None
            if not self.sessionObjects[self.walls[i]].enabled:
                continue
            if cmds.listAttr(self.sessionObjects[self.walls[i]].transform, st = "DAVEBUILDING") != None:
                activeBuilding = int(cmds.getAttr(self.sessionObjects[self.walls[i]].transform+".DAVEBUILDING"))
            if cmds.listAttr(self.sessionObjects[self.walls[i]].transform, st = "DAVEROOM") != None:
                activeRoom = int(cmds.getAttr(self.sessionObjects[self.walls[i]].transform+".DAVEROOM"))
            wallTop = cmds.exactWorldBoundingBox(self.sessionObjects[self.walls[i]].transform)[4]
            if wallTop > self.roomData[activeBuilding][activeRoom]["upperBound"]:
                self.roomData[activeBuilding][activeRoom]["upperBound"] = wallTop
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
        if hasattr(self, "secondaryWindow"):
            if (cmds.window(self.secondaryWindow, exists=True)):
                cmds.deleteUI(self.secondaryWindow)
        self.secondaryWindow = cmds.window(title="DAVE: Set room floorplans")
        form = cmds.formLayout()
        tabs = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5)
        cmds.formLayout(form, edit=True, attachForm=((tabs, 'top', 0), (tabs, 'left', 0), (tabs, 'bottom', 0), (tabs, 'right', 0)))
        cols = []
        fields = []
        opMenus = []
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
                opMenus.append(cmds.optionMenu(label = "Room type"))
                cmds.menuItem(label = "Kitchen")
                cmds.menuItem(label = "Lounge")
                cmds.menuItem(label = "Bedroom")
                cmds.menuItem(label = "Hallway")
                cmds.menuItem(label = "Generic")
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
                    cmds.button(label = label, command = lambda x: self.genBuildingHulls(fields, roomsNeeded, opMenus, False), width = 80)
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
        
    def genBuildingHulls(self, fields, rooms, opMenus, force):
        if not force:
            for hullText in fields:
                if cmds.textField(hullText, q = True, en = True):
                    hullName = cmds.textField(hullText, q = True, text = True)
                    if hullName == "" or not cmds.objExists(hullName):
                        errorString = "One or more room hulls have not been provided, or the wrong name was given, please ensure a hull is given."
                        if (cmds.confirmDialog(title = "Floorplan not provided", message = errorString, button=['Ok'], defaultButton='Ok', cancelButton='Ok', dismissString='Ok' )) == "Ok":
                            return
                            if hasattr(self, "hullJob"):
                                cmds.scriptJob(kill = self.hullJob)
                        return
        for room in rooms:
            self.roomStates[room[0]][room[1]] = True
        for i in range(len(fields)):
            hullName = cmds.textField(fields[i], q = True, text = True)
            cmds.select(hullName+".vtx[0:]")
            self.roomData[rooms[i][0]][rooms[i][1]]["tris"] = []
            self.roomData[rooms[i][0]][rooms[i][1]]["outer"] = []
            self.roomData[rooms[i][0]][rooms[i][1]]["tag"] = cmds.optionMenu(opMenus[i], q = True, v = True).upper().replace(" ","")
            if cmds.listAttr(hullName, st = "DAVEROOMTAG") == None:
                cmds.addAttr(hullName, longName = "DAVEROOMTAG", dataType = "string", hidden = False)
            cmds.setAttr(hullName+".DAVEROOMTAG", cmds.optionMenu(opMenus[i], q = True, v = True).upper(), type = "string")
            for v in range(cmds.polyEvaluate(hullName, v = True)):
                self.roomData[rooms[i][0]][rooms[i][1]]["outer"].append(hullName+".vtx["+str(v)+"]")
            self.roomData[rooms[i][0]][rooms[i][1]]["transform"] = hullName
            sigPos = [0, 0, 0]
            for v in self.roomData[rooms[i][0]][rooms[i][1]]["outer"]:
                sigPos = vectorSum(sigPos, cmds.pointPosition(v))
            numVerts = len(self.roomData[rooms[i][0]][rooms[i][1]]["outer"])
            self.roomData[rooms[i][0]][rooms[i][1]]["centre"] = vectorDivide(sigPos, [numVerts, numVerts, numVerts])
            self.roomData[rooms[i][0]][rooms[i][1]]["radius"] = vectorLength(cmds.pointPosition(max([v for v in self.roomData[rooms[i][0]][rooms[i][1]]["outer"]], key = lambda x: vectorLength(cmds.pointPosition(x)))))
            cmds.polyTriangulate(hullName)
            cmds.select(hullName+".vtx[0:]")
            yNormals = cmds.polyNormalPerVertex( query=True, y=True )
            if cmds.listAttr(hullName, st = "DAVEHULLFLIPPED") == None:
                cmds.addAttr(hullName, longName = "DAVEHULLFLIPPED", dataType = "string", hidden = False)
                cmds.setAttr(hullName+".DAVEHULLFLIPPED", "False", type = "string")
            if (sum(yNormals)/float(len(yNormals))) < 0:
                cmds.polyNormal(nm = 0)
                cmds.setAttr(hullName+".DAVEHULLFLIPPED", "True", type = "string")
            numFaces = cmds.getAttr(hullName+".face", size=1)
            for j in range(numFaces):
                cmds.select(hullName+".f["+str(j)+"]")
                verts = cmds.ls(cmds.polyListComponentConversion(tv = True), fl = True)
                self.roomData[rooms[i][0]][rooms[i][1]]["tris"].append(verts)
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
        bx = max(triVerts, key = lambda x: math.fabs(x[0]))[0]
        by = max(triVerts, key = lambda x: math.fabs(x[1]))[1]
        pointSeg = [point[0], point[1], mX * bx * 2, mY * by * 2]
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
            
    def runAllDecor(self):
        self.findRoomShapes()
        self.decorateRooms()
        self.processDAVEQ()
        self.determineRooms()
        self.findHullShapes()
        self.decorateObjects()
        self.processDAVEQ()

    def eject(self):
        errorString = "This will clear all dave attributes, continue?"
        if (cmds.confirmDialog(title = "Clear all DAVE data", message = errorString, button=['Yes','No'], defaultButton='Yes', cancelButton='No', dismissString='No' )) == "Yes":
            execfile(self.path+"src/ejectorSeat.py")
            cmds.deleteUI(self.window)

    def findRoomShapes(self):
        for building in self.roomData:
            if len(building):
                for room in building:
                    oVerts = []
                    if len(room["outer"]):
                        oDist = sys.maxint
                        for i in range(len(room["outer"])):
                            iList = []
                            iVerts = [i]
                            iDist = 0
                            for p in room["outer"][i:]:
                                iList.append(p)
                            for p in room["outer"][:i]:
                                iList.append(p)
                            done = False
                            p = i
                            while not done:
                                cPos = cmds.pointPosition(iList[p])
                                foundP = False
                                t = p
                                while not foundP:
                                    t += 1
                                    if t == len(room["outer"]):
                                        t = 0
                                    if t == i:
                                        foundP = True
                                        done = True
                                        sPos = cmds.pointPosition(iList[i])
                                        iDist += vectorLength(vectorDifference(sPos, cPos))
                                        p = len(iList)
                                        break
                                    tPos = cmds.pointPosition(iList[t])
                                    d = vectorLength(vectorDifference(tPos, cPos))
                                    if d > self.masterSpacingDict["WALL"]:
                                        iVerts.append(t)
                                        iDist += d
                                        foundP = True
                                        p = t
                                        break
                                if p >= len(room["outer"]):
                                    p = 0
                                if p == i:
                                    done = True
                            if len(oVerts) < len(iVerts) and oDist > iDist:
                                oVerts = iVerts
                                oDist = iDist
                    room["wallVerts"] = oVerts

    def findHullShapes(self):
        sTime = time.time()
        for ob in self.sessionObjects:
            if not ob.enabled:
                continue
            if len(ob.hull["outer"]):
                oVerts = []
                oDist = sys.maxint
                spacing = self.masterSpacingDict["DEFAULT"]
                if ob.tag in self.masterSpacingDict:
                    spacing = self.masterSpacingDict[ob.tag]
                for i in range(len(ob.hull["outer"])):
                    iList = []
                    iVerts = [i]
                    iDist = 0
                    for p in ob.hull["outer"][i:]:
                        iList.append(p)
                    for p in ob.hull["outer"][:i]:
                        iList.append(p)
                    done = False
                    p = i
                    while not done:
                        cPos = cmds.pointPosition(iList[p])
                        foundP = False
                        t = p
                        while not foundP:
                            t += 1
                            if t == len(ob.hull["outer"]):
                                t = 0
                            if t == i:
                                foundP = True
                                done = True
                                sPos = cmds.pointPosition(iList[i])
                                iDist += vectorLength(vectorDifference(sPos, cPos))
                                p = len(iList)
                                break
                            tPos = cmds.pointPosition(iList[t])
                            d = vectorLength(vectorDifference(tPos, cPos))
                            if d > spacing:
                                iVerts.append(t)
                                iDist += d
                                foundP = True
                                p = t
                                break
                        if p >= len(ob.hull["outer"]):
                            p = 0
                        if p == i:
                            done = True
                    if len(oVerts) < len(iVerts) and oDist > iDist:
                        oVerts = iVerts
                        oDist = iDist
                ob.hull["placementVerts"] = oVerts

    def processDAVEQ(self):
        files = set(self.importQueue["models"])
        for f in set(self.importQueue["models"]):
            new = cmds.file(self.path+"models/"+f+".obj", rnn = True, i=True)
            cmds.select(new)
            self.importQueue["modelTransforms"][f] = cmds.ls(sl = True, transforms = True)

        for f in range(len(self.importQueue["positions"])):
            imMod = self.importQueue["models"][f]
            model = self.importQueue["modelTransforms"][imMod]
            cmds.select(model)
            pos = self.importQueue["positions"][f]
            rot = self.importQueue["rotations"][f]
            cmds.move(pos[0], pos[1], pos[2])
            cmds.rotate(rot[0], rot[1], rot[2])
            newOb = cmds.duplicate(model, name = imMod)
            if cmds.listAttr(newOb, st = "DAVEIMPORTED") == None:
                cmds.addAttr(newOb, longName = "DAVEIMPORTED", dataType = "string", hidden = False)
                if self.importQueue["tags"][f] != "NONE":
                    index = len(self.sessionObjects)
                    self.sessionObjects.append(daveObject("".join(newOb), index))
                    self.sessionObjects[index].enabled = True
                    self.sessionObjects[index].tag = self.importQueue["tags"][f]
                    self.sessionObjects[index].genConvexHull()
                    self.checkForDeletions(self.sessionObjects[index].transform)
            cmds.setAttr(''.join(newOb)+".DAVEIMPORTED", "True", type = "string")
        for f in set(self.importQueue["models"]):
            cmds.select(self.importQueue["modelTransforms"][f])
            cmds.delete()
        self.cleanImport()

    def determineRooms(self):
        for ob in self.sessionObjects:
            nearestRoom = [101, 101]
            smallestYDiff = sys.maxint
            if not ob.enabled or ob.tag == "WALL" or ob.tag == "DOOR":
                continue
            bbox = cmds.exactWorldBoundingBox(ob.transform)
            centre = vectorDivide(vectorSum([bbox[0], bbox[1], bbox[2]], [bbox[3], bbox[4], bbox[5]]), [2.0, 2.0, 2.0])
            obHeight = bbox[4] - bbox[1]
            for building in self.roomData:
                for room in building:
                    if len(room["outer"]):
                        dist = vectorLength(vectorDifference(centre, room["centre"]))
                        yDiff = math.fabs(bbox[1] - room["centre"][1])
                        if dist > room["radius"]:
                            continue
                        if (self.pointCmplxHullTest([centre[0], centre[2]], room["tris"]) and yDiff < smallestYDiff) and (bbox[1] < room["upperBound"] + 0.5 * obHeight):
                            smallestYDiff = yDiff
                            nearestRoom = room["id"]
            if cmds.listAttr(ob.transform, st = "DAVENEARBUILDING") == None:
                cmds.addAttr(ob.transform, longName = "DAVENEARBUILDING", dataType = "string", hidden = False)
                cmds.addAttr(ob.transform, longName = "DAVENEARROOM", dataType = "string", hidden = False)
            cmds.setAttr(ob.transform+".DAVENEARBUILDING", nearestRoom[0], type = "string")
            cmds.setAttr(ob.transform+".DAVENEARROOM", nearestRoom[1], type = "string")
            if nearestRoom[0] != 101 and nearestRoom[1] != 101 and ob.tag == "EXCLUSION VOLUME":
                self.roomData[nearestRoom[0]][nearestRoom[1]]["exclusionVols"].append(ob.index)

    def sendWallsToRooms(self):
        for building in self.roomData:
            for room in building:
                room["walls"] = []
        for ob in self.sessionObjects:
            if ob.enabled:
                if ob.tag == "WALL":
                    if cmds.listAttr(ob.transform, st = "DAVEBUILDING") != None and cmds.listAttr(ob.transform, st = "DAVEROOM") != None:
                        self.roomData[int(cmds.getAttr(ob.transform+".DAVEBUILDING"))][int(cmds.getAttr(ob.transform+".DAVEROOM"))]["walls"].append(ob.index)
                elif ob.tag == "DOOR":
                    if cmds.listAttr(ob.transform, st = "DAVEBUILDING") != None and cmds.listAttr(ob.transform, st = "DAVEROOM") != None:
                        self.roomData[int(cmds.getAttr(ob.transform+".DAVEBUILDING"))][int(cmds.getAttr(ob.transform+".DAVEROOM"))]["doors"].append(ob.index)
                
    def findRoomArea(self, building, room):
        area = 0.0
        for tri in self.roomData[building][room]["tris"]:
            a = cmds.pointPosition(tri[0])
            b = cmds.pointPosition(tri[1])
            c = cmds.pointPosition(tri[2])
            area += 0.5 * math.fabs(a[0] * (b[2] - c[2]) + b[0] * (c[2] - a[2]) + c[0] * (a[2] - b[2]))
        return area

    def decorateKitchen(self, index):
        print "Decorating Kitchen"
        area = self.findRoomArea(index[0], index[1])
        if area < 4.0:
            print "Kitchen (B"+str(index[0])+"-R"+str(index[1])+") too small ("+str(area)+"m^2), skipping..."
            return
        room = self.roomData[index[0]][index[1]]
        spawnKeys = {}
        spawnKeys["diningTable"] = True if area > 20.0 else False
        spawnKeys["fridge"] = True
        spawnKeys["gasHobOven"] = True if (random.randint(0, 3) / 3) else False
        spawnKeys["electricHobOven"] = True if (not spawnKeys["gasHobOven"]) and (random.randint(0, 2) / 2) else False
        spawnKeys["oven"] = True if not (spawnKeys["gasHobOven"] or spawnKeys["electricHobOven"]) else False
        spawnKeys["gasHobStandalone"] = True if (spawnKeys["oven"] and random.randint(0, 1)) else False
        spawnKeys["electricHobStandalone"] = True if (spawnKeys["oven"] and not spawnKeys["gasHobStandalone"]) else False
        spawnKeys["sink"] = True
        spawnKeys["bin"] = True if random.randint(0, 2) else False
        room["spawnKeys"] = spawnKeys
        room["spice"] = []
        lockedVerts = []
        for door in room["doors"]:
            dName = self.sessionObjects[door].transform
            dBBox = cmds.exactWorldBoundingBox(dName)
            dPos = vectorDivide(vectorSum([dBBox[0], dBBox[1], dBBox[2]], [dBBox[3], dBBox[4], dBBox[5]]), [2.0, 2.0, 2.0])
            dists = []
            for vert in room["wallVerts"]:
                vPos = cmds.pointPosition(room["outer"][vert])
                dists.append(vectorLength(vectorDifference(dPos, vPos)))
            localWV = [x for x in room["wallVerts"]]
            mD1 = min(dists)
            n1 = localWV[dists.index(mD1)]
            dists.remove(mD1)
            localWV.remove(n1)
            mD2 = min(dists)
            n2 = localWV[dists.index(mD2)]
            lockedVerts.append([room["outer"][n1], room["outer"][n2]])
        usableEdges = []
        usableLengths = []
        usableVectors = []
        intoEdges = []
        usableRots = []
        for v in range(len(room["wallVerts"])):
            v1 = room["outer"][room["wallVerts"][v - 1]]
            v2 = room["outer"][room["wallVerts"][v]]
            if [v1, v2] in lockedVerts or [v2, v1] in lockedVerts:
                continue
            diff = vectorDifference(cmds.pointPosition(v1), cmds.pointPosition(v2))
            usableLengths.append(vectorLength(diff))
            usableEdges.append([v1, v2])
            usableVectors.append(diff)
            rot = math.degrees(vectorAngle(diff, [0.0, 0.0, 1.0]))
            if diff[0] < 0:
                rot = 360.0 - rot
            if str(cmds.getAttr(room["transform"]+".DAVEHULLFLIPPED")) == "False":
                rot += 180.0
            usableRots.append(rot)
            intoEdges.append(0.0)
        for i in range(len(usableEdges)):
            if (not random.randint(0, 1)) and i != len(usableEdges) - 1:
                continue
            vP1 = cmds.pointPosition(usableEdges[i][0])
            vP2 = cmds.pointPosition(usableEdges[i][1])
            vUT = vectorUnitize(vectorProduct(usableVectors[i], [-1.0, -1.0, -1.0]))
            vPS = [x for x in vP1]
            f1 = random.uniform(0.1, 1.0)
            vPS = vectorSum(vPS, vectorProduct(vUT, [f1, f1, f1]))
            intoEdges[i] += f1
            done = False
            while not done:
                width = 1.0
                intoEdges[i] += width
                if intoEdges[i] >= usableLengths[i]:
                    done = True
                    break
                vPS = vectorSum(vPS, vectorProduct(vUT, [0.5 * width, 0.5 * width, 0.5 * width]))
                model = "counter1"
                if room["spawnKeys"]["gasHobOven"]:
                    if random.randint(0, 1):
                        model = "ghOven"
                        room["spawnKeys"]["gasHobOven"] = False
                elif room["spawnKeys"]["electricHobOven"]:
                    if random.randint(0, 1):
                        model = "ehOven"
                        room["spawnKeys"]["electricHobOven"] = False
                elif room["spawnKeys"]["oven"]:
                    if random.randint(0, 1):
                        model = "oven"
                        room["spawnKeys"]["oven"] = False
                elif room["spawnKeys"]["gasHobStandalone"]:
                    if random.randint(0, 1):
                        model = "gHob"
                        room["spawnKeys"]["gasHobStandalone"] = False
                elif room["spawnKeys"]["electricHobStandalone"]:
                    if random.randint(0, 1):
                        model = "eHob"
                        room["spawnKeys"]["electricHobStandalone"] = False
                elif room["spawnKeys"]["sink"]:
                    if random.randint(0, 1):
                        model = "sink"
                        room["spawnKeys"]["sink"] = False
                elif room["spawnKeys"]["fridge"]:
                    if random.randint(0, 1):
                        model = "fridge"+str(room["styleNumB"])
                        room["spawnKeys"]["fridge"] = False
                elif room["spawnKeys"]["bin"]:
                    if random.randint(0, 1):
                        model = "bin"+str(room["styleNumB"])
                        room["spawnKeys"]["bin"] = False
                self.importQueue["models"].append(model)
                self.importQueue["rotations"].append([0, usableRots[i], 0])
                self.importQueue["positions"].append([vPS[0], vPS[1], vPS[2]])
                self.importQueue["tags"].append("COUNTERTOP" if model == "counter1" else "NONE")
                vPS = vectorSum(vPS, vectorProduct(vUT, [0.5 * width, 0.5 * width, 0.5 * width]))
        if room["spawnKeys"]["diningTable"]:
            randRot = random.uniform(80.0, 100.0) if random.randint(0, 1) else random.uniform(-10, 10)
            randRot += 180.0 if random.randint(0, 1) else 0
            self.importQueue["models"].append("table"+str(room["styleNumA"]))
            self.importQueue["tags"].append("DININGTABLE")
            self.importQueue["rotations"].append([0, randRot, 0])
            self.importQueue["positions"].append(room["centre"])



    def decorateLounge(self, index):
        print "Decorating Lounge"
        building = index[0]
        room = index[1]
        area = self.findRoomArea(building, room)
        if area < 6.0:
            print "Lounge (B"+str(building)+"-R"+str(room)+") too small ("+str(area)+"m^2), skipping..."
            return

    def decorateBedroom(self, index):
        print "Decorating Bedroom"
        building = index[0]
        room = index[1]
        area = self.findRoomArea(building, room)
        if area < 6.0:
            print "Bedroom (B"+str(building)+"-R"+str(room)+") too small ("+str(area)+"m^2), skipping..."
            return



    def decorateRooms(self):
        self.sendWallsToRooms()
        self.findRoomShapes()
        self.findHullShapes()
        for building in self.roomData:
            for room in building:
                if room["processed"] or room["tag"] == "NONE":
                    continue
                elif room["tag"] == "KITCHEN":
                    self.decorateKitchen(room["id"])
                elif room["tag"] == "LOUNGE":
                    self.decorateLounge(room["id"])
                elif room["tag"] == "BEDROOM":
                    self.decorateBedroom(room["id"])
                elif room["tag"] == "HALLWAY":
                    self.decorateHallway(room["id"])
                else:
                    self.decorateGeneric(room["id"])
                room["processed"] = True

    def d_counterTop(self, index):
        ob = self.sessionObjects[index]
        sigPos = [0, 0, 0]
        for p in ob.hull["placementVerts"]:
            sigPos = vectorSum(sigPos, cmds.pointPosition(ob.hull["outer"][p]))
        numV = len(ob.hull["placementVerts"])
        avgPos = vectorDivide(sigPos, [numV, numV, numV])
        bbox = cmds.exactWorldBoundingBox(ob.transform)
        bbX10 = 0.1 * (bbox[3] - bbox[0])
        bbZ10 = 0.1 * (bbox[5] - bbox[2])
        building = int(cmds.getAttr(ob.transform+".DAVENEARBUILDING"))
        room = int(cmds.getAttr(ob.transform+".DAVENEARROOM"))
        stNumA = 1
        stNumB = 1
        obYRot = float(cmds.getAttr(ob.transform+".ry"))
        if building != 101 and room != 101:
            stNumA = self.roomData[building][room]["styleNumA"]
            stNumB = self.roomData[building][room]["styleNumB"]
        def spice(*args):
            rp = [random.uniform(bbox[0] + bbX10, bbox[3] - bbX10), random.uniform(bbox[2] + bbZ10, bbox[5] - bbZ10)]
            while not self.pointCmplxHullTest(rp, ob.hull["tris"]):
                rp = [random.uniform(bbox[0], bbox[3]), random.uniform(bbox[2], bbox[5])]
            canImport = True
            if building != 101 and room != 101:
                if not self.pointCmplxHullTest(rp, self.roomData[building][room]["tris"]):
                    canImport = False
            if canImport:
                spNum = random.randint(0, len(self.kitchenSpiceProps) - 1)
                if spNum in self.roomData[building][room]["spice"]:
                    spNum = random.randint(0, len(self.kitchenSpiceProps) - 1)
                self.roomData[building][room]["spice"].append(spNum)
                self.importQueue["models"].append(self.kitchenSpiceProps[spNum].lower())
                self.importQueue["tags"].append("NONE")
                self.importQueue["rotations"].append([0, random.uniform(-10, 10) + obYRot, 0])
                self.importQueue["positions"].append([rp[0], ob.hull["height"], rp[1]])
        for r in range(2):
            if random.randint(0, 2) / 2:
                spice()

    def d_diningTable(self, index):
        ob = self.sessionObjects[index]
        sigPos = [0, 0, 0]
        for p in ob.hull["placementVerts"]:
            sigPos = vectorSum(sigPos, cmds.pointPosition(ob.hull["outer"][p]))
        numV = len(ob.hull["placementVerts"])
        avgPos = vectorDivide(sigPos, [numV, numV, numV])
        bbox = cmds.exactWorldBoundingBox(ob.transform)
        bbX10 = 0.1 * (bbox[3] - bbox[0])
        bbZ10 = 0.1 * (bbox[5] - bbox[2])
        building = int(cmds.getAttr(ob.transform+".DAVENEARBUILDING"))
        room = int(cmds.getAttr(ob.transform+".DAVENEARROOM"))
        stNumA = 1
        stNumB = 1
        if building != 101 and room != 101:
            stNumA = self.roomData[building][room]["styleNumA"]
            stNumB = self.roomData[building][room]["styleNumB"]
        for p in range(len(ob.hull["placementVerts"])):
            def plate(*args):
                p1 = cmds.pointPosition(ob.hull["outer"][ob.hull["placementVerts"][p - 1]])
                p2 = cmds.pointPosition(ob.hull["outer"][ob.hull["placementVerts"][p]])
                denom = vectorLength(vectorDifference(p1, p2))
                variance = 0.0
                if denom != 0.0:
                    variance = 0.1 / denom
                if variance > 1.0:
                    variance = 1.0
                mix = random.uniform(0.5 - (variance * 0.5), 0.5 + (variance * 0.5))
                pos = vectorMix(p1, p2, mix)
                denom = vectorLength(vectorDifference(pos, avgPos))
                varianceL = 0.0
                if denom != 0.0:
                    varianceL = 0.15 / denom
                if varianceL > 1.0:
                    varianceL = 1.0
                denom = vectorLength(vectorDifference(pos, avgPos))
                varianceH = 0.0
                if denom != 0.0:
                    varianceH = 0.4 / denom
                if varianceH > 1.0:
                    varianceH = 1.0
                mix = random.uniform(varianceL, varianceH)
                pos = vectorMix(pos, avgPos, mix)
                relPos = vectorDifference(p1, p2)
                ax = [0.0, 0.0, 1.0]
                rot = math.degrees(vectorAngle(relPos, ax))
                if relPos[0] < 0:
                    rot = 360.0 - rot
                if str(cmds.getAttr(ob.transform+".DAVEHULLFLIPPED")) == "False":
                    rot += 180.0
                canImport = True
                if building != 101 and room != 101:
                    if not self.pointCmplxHullTest([pos[0], pos[2]], self.roomData[building][room]["tris"]):
                        canImport = False
                if canImport:
                    self.importQueue["models"].append("plate"+str(stNumA))
                    self.importQueue["rotations"].append([0, rot, 0])
                    self.importQueue["positions"].append([pos[0], pos[1], pos[2]])
                    self.importQueue["tags"].append("NONE")
            if random.randint(0, 1):
                plate()
            def chair(*args):
                p1 = cmds.pointPosition(ob.hull["outer"][ob.hull["placementVerts"][p - 1]])
                p2 = cmds.pointPosition(ob.hull["outer"][ob.hull["placementVerts"][p]])
                denom = vectorLength(vectorDifference(p1, p2))
                variance = 0.0
                if denom != 0.0:
                    variance = 0.25 / denom 
                if variance > 1.0:
                    variance = 1.0
                mix = random.uniform(0.5 - (variance * 0.5), 0.5 + (variance * 0.5))
                pos = vectorMix(p1, p2, mix)
                denom = vectorLength(vectorDifference(pos, avgPos))
                varianceL = 0.0
                if denom != 0.0:
                    varianceL = 0.075 / denom
                if varianceL > 1.0:
                    varianceL = 1.0
                denom = vectorLength(vectorDifference(pos, avgPos))
                varianceH = 0.0
                if denom != 0.0:
                    varianceH = 0.15 / denom
                if varianceH > 1.0:
                    varianceH = 1.0
                mix = random.uniform(-varianceH, varianceL)
                pos = vectorMix(pos, avgPos, mix)
                relPos = vectorDifference(p1, p2)
                ax = [0.0, 0.0, 1.0]
                rot = math.degrees(vectorAngle(relPos, ax))
                if relPos[0] < 0:
                    rot = 360.0 - rot
                if str(cmds.getAttr(ob.transform+".DAVEHULLFLIPPED")) == "False":
                    rot += 180.0
                canImport = True
                if building != 101 and room != 101:
                    if not self.pointCmplxHullTest([pos[0], pos[2]], self.roomData[building][room]["tris"]):
                        canImport = False
                if canImport:
                    self.importQueue["models"].append("chair"+str(stNumB))
                    self.importQueue["tags"].append("NONE")
                    self.importQueue["rotations"].append([0, rot, 0])
                    self.importQueue["positions"].append([pos[0], bbox[1], pos[2]])
            if random.randint(0, 1):
                chair()
        def spice(*args):
            rp = [random.uniform(bbox[0] + bbX10, bbox[3] - bbX10), random.uniform(bbox[2] + bbZ10, bbox[5] - bbZ10)]
            while not self.pointCmplxHullTest(rp, ob.hull["tris"]):
                rp = [random.uniform(bbox[0], bbox[3]), random.uniform(bbox[2], bbox[5])]
            canImport = True
            if building != 101 and room != 101:
                if not self.pointCmplxHullTest(rp, self.roomData[building][room]["tris"]):
                    canImport = False
            if canImport:
                spNum = random.randint(1, 4)
                self.importQueue["models"].append("spice"+str(spNum))
                self.importQueue["tags"].append("NONE")
                self.importQueue["rotations"].append([0, 0, 0])
                self.importQueue["positions"].append([rp[0], ob.hull["height"], rp[1]])
        spiceChance = int(20.0 / (len(ob.hull["placementVerts"]) / 4.0))
        for r in range(spiceChance * 3):
            if (random.randint(0, spiceChance) / spiceChance):
                spice()
        cmds.select(d = True)

    def decorateObjects(self):
        for ob in self.sessionObjects:
            if (not ob.enabled) or ob.processed or (not ob.processable) or (ob.tag == "WALL") or (ob.tag == "DOOR"):
                continue
            if ob.tag == "DININGTABLE":
                self.d_diningTable(ob.index)
            if ob.tag == "COUNTERTOP":
                self.d_counterTop(ob.index)
            ob.processed = True

    def switchProps(self):
        sel = cmds.ls(sl = True, transforms = True)
        if len(sel) < 2 or len(sel) > 2:
            return
        prop1 = sel[0]
        prop2 = sel[1]
        bb1 = cmds.exactWorldBoundingBox(prop1)
        centre1 = vectorProduct([bb1[3] + bb1[0], bb1[4] + bb1[1], bb1[5] + bb1[2]], [0.5, 0.5, 0.5])
        cmds.xform(prop1, sp = centre1, rp = centre1)
        bb2 = cmds.exactWorldBoundingBox(prop2)
        centre2 = vectorProduct([bb2[3] + bb2[0], bb2[4] + bb2[1], bb2[5] + bb2[2]], [0.5, 0.5, 0.5])
        cmds.xform(prop2, sp = centre2, rp = centre2)
        transform1 = cmds.xform(prop2, q = True, sp = True)
        transform2 = cmds.xform(prop1, q = True, sp = True)
        cmds.move(transform1[0], transform1[1], transform1[2], prop1, a = True, ws = True)
        cmds.move(transform2[0], transform2[1], transform2[2], prop2, a = True, ws = True)

def main():
    dave = daveManager("D:/Python/DAVE/DAVE/")
    #dave = daveManager("/home/s4907224/Documents/DAVE/")
    urllib.urlretrieve("https://www.glovefx.com/s/dave.png", dave.path+"fetch/header.png")
    urllib.urlretrieve("https://www.glovefx.com/s/hull.png", dave.path+"fetch/hull.png")
    dave.UI()
    
if __name__== "__main__":
    main()

