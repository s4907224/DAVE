import maya.cmds as cmds
import base64
import hashlib
import os
import sys
import math
import time
import random
import urllib

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
    print objectName    

class daveObject:
    def __init__(self, transform, id):
        print "Object added to current session"
        self.transform = transform
        self.index = id
        self.imported = False
        self.numVerts = cmds.polyEvaluate(self.transform, v = True)
        self.topVerts = []
        self.topVertsIndex = []
        self.convexhull = None
        self.hash = 0
        self.tag = None
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
            if allVPos[i][1] >= topMargin:
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

    def genConvexHull(self):
        if len(self.topVerts) < 3:
            return
        def ccw(p1, p2, p3):
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
        self.convexhull = stack
        cmds.select(d = True)
        facetList = []
        for i in range(len(stack)):
            cmds.select(self.transform+".vtx["+str(self.topVertsIndex[stack[i]])+"]", add = True)
            pos = self.topVerts[stack[i]]
            facetList.append((pos[0], self.hullHeight, pos[2]))
        if len(facetList) <= 3:
            self.convexhull = None
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

    def determineShape(self):
        if self.convexhull == None:
            return
        hullverts = len(self.convexhull)
        edgeLengths = []
        edgeVectors = []
        for i in range(hullverts - 1):
            edgeVectors.append(vectorDifference(self.topVerts[self.convexhull[i]], self.topVerts[self.convexhull[i + 1]]))
            edgeLengths.append(vectorLength(edgeVectors[i]))
        edgeVectors.append(vectorDifference(self.topVerts[self.convexhull[hullverts - 1]], self.topVerts[self.convexhull[0]]))
        edgeLengths.append(vectorLength(edgeVectors[hullverts - 1]))

        hullPerim = sum(edgeLengths)
        edgeWeights = []
        for i in range(hullverts):
            edgeWeights.append(edgeLengths[i] / hullPerim)

        maxWeight = max(edgeWeights)

        numEdges = 0
        pWeight = edgeLengths[hullverts - 1]
        nWeight = edgeLengths[1]
        diffWeight = abs(pWeight - nWeight)
        if diffWeight <= 0.5 * maxWeight:
            numEdges += 1
        pWeight = edgeLengths[hullverts - 2]
        nWeight = edgeLengths[0]
        diffWeight = abs(pWeight - nWeight)
        if diffWeight <= 0.5 * maxWeight:
            numEdges += 1
        for i in range(1, hullverts - 1):
            pWeight = edgeLengths[i - 1]
            nWeight = edgeLengths[i + 1]
            diffWeight = abs(pWeight - nWeight)
            if diffWeight <= 0.5 * maxWeight:
                numEdges += 1
        print numEdges

class daveManager:
    def __init__(self, path):
        print "Dave is starting..."
        self.path = path
        self.dbpath = path + "assets.davedb"
        self.parseDAVEDB()
        self.sessionObjects = []
        self.hash = None
        self.walls = []
        self.buildingStates = []
        self.roomStates = []
        for i in range(100):
            self.buildingStates.append(False)
            self.roomStates.append([])
            for j in range(100):
                self.roomStates[i].append(False)

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
        cmds.image(image = self.path+"header.png")
        cmds.rowLayout(nc=3)
        cmds.button(label="Import Selection", width=150, c = lambda x : self.importSelectedObjects())
        cmds.button(label="Scan Scene", width = 150, c = lambda x: self.scanSceneAndImport())
        cmds.setParent(col)
        cmds.showWindow()

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
        selection = cmds.ls(sl = True)
        print selection
        toBeImported = []
        for i in range(len(selection)):
            currentIndex = len(self.sessionObjects)
            if not any(dObject.transform == selection[i] for dObject in self.sessionObjects):
                self.sessionObjects.append(daveObject(selection[i], currentIndex))
                if cmds.listAttr(self.sessionObjects[currentIndex].transform, st='DAVEBUILDING') != None:
                    self.walls.append(currentIndex)
            else:
                continue
            compliantObject = self.checkDAVECompliance(currentIndex)
            inDB = self.checkAgainstDatabase(currentIndex)
            if (not compliantObject) or (not inDB):
                toBeImported.append(currentIndex)
        if len(toBeImported) != 0:
            self.importSelection(toBeImported)
        elif len(self.sessionObjects) != 0:
            self.tagWalls()

    def importSelection(self, objects):
        self.tagWindow = cmds.window(title="DAVE: Set tags for objects")
        form = cmds.formLayout()
        tabs = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5)
        cmds.formLayout(form, edit=True, attachForm=((tabs, 'top', 0), (tabs, 'left', 0), (tabs, 'bottom', 0), (tabs, 'right', 0)))
        numTabs = math.ceil(float(len(objects)) / 5.0)
        cols = []
        radioButtons = []
        fields = []
        for i in range(int(numTabs)):
            cols.append(cmds.columnLayout())
            cmds.setParent(tabs)
            cmds.tabLayout(tabs, e=True, tabLabel=((cols[i], str(i + 1))))
        for i in range(len(objects)):
            cmds.setParent(cols[i / 5])
            cmds.text(label = "Set parameters for "+self.sessionObjects[objects[i]].transform+':', font = "boldLabelFont", width = 200)
            cmds.separator(width = 20, style = "none")
            cmds.button(label = "Focus on object", width = 180, command = lambda x: selectAndViewObject(self.sessionObjects[objects[i]].transform))
            cmds.columnLayout(width = 400)
            radioButtons.append(cmds.radioButtonGrp(nrb = 2, la2 = ["NONE", "WALL"]))
            cmds.radioButtonGrp(radioButtons[i], e = True, sl = 1)
            cmds.text(label = "Set object name (optional)", font = "smallBoldLabelFont")
            fields.append(cmds.textField(width = 400, text = self.sessionObjects[objects[i]].transform))
            cmds.separator(height=10)
            if i == len(objects) - 1:
                if i >= 5:
                    label = "Previous"
                    cmds.button(label=label,command=lambda x: cmds.tabLayout(tabs, e = True, st = cols[(i / 5) - 1]))
                label = "Done"
                cmds.button(label=label,command=lambda x: self.completeTagging(fields, radioButtons, objects))
                continue
            if i % 5 == 4:
                if i >= 5:
                    label = "Previous"
                    cmds.button(label=label,command=lambda x: cmds.tabLayout(tabs, e = True, st = cols[(i / 5) - 1]))
                label = "Next"
                cmds.button(label=label,command=lambda x: cmds.tabLayout(tabs, e = True, st = cols[i / 5]))
        cmds.showWindow()

    def completeTagging(self, fields, radioButtons, objects):
        anyImported = False
        db = open(self.dbpath, "a+")
        for i in range(len(fields)):
            name =  cmds.textField(fields[i], q = True, text = True)
            activeButton = cmds.radioButtonGrp(radioButtons[i], q = True, sl = True)
            tag = cmds.radioButtonGrp(radioButtons[i], q = True, la2 = True)[activeButton - 1]
            self.sessionObjects[objects[i]].tag = tag
            hashstring = name + tag
            objectHash = self.createHash(hashstring)
            if cmds.listAttr(self.sessionObjects[objects[i]].transform, st='DAVEHASH') == None:
                cmds.addAttr(self.sessionObjects[objects[i]].transform, longName = "DAVEHASH", dataType = "string", hidden = False)
            cmds.setAttr(self.sessionObjects[objects[i]].transform+".DAVEHASH", objectHash, type = "string")
            if cmds.listAttr(self.sessionObjects[objects[i]].transform, st='DAVETAG') == None:
                cmds.addAttr(self.sessionObjects[objects[i]].transform, longName = "DAVETAG", dataType = "string", hidden = False)
            if objectHash in self.db[0]:
                continue
            cmds.setAttr(self.sessionObjects[objects[i]].transform+".DAVETAG", tag, type = "string")
            if self.sessionObjects[objects[i]].convexhull == None and tag != "WALL":
                self.sessionObjects[objects[i]].genConvexHull()
                self.sessionObjects[objects[i]].determineShape()
            cmds.rename(self.sessionObjects[objects[i]].transform, name)
            self.sessionObjects[objects[i]].transform = name
            if not self.checkAgainstDatabase(objects[i]):
                if not anyImported:
                    db.write("\n!\n")
                    anyImported = True
                db.write("$\nNAME=%s\nTAG=%s\nHASH=%s\n$\n" % (name, tag, objectHash))
            self.sessionObjects[objects[i]].imported = True
        if anyImported:
            db.write("!\n")
        db.close()
        cmds.deleteUI(self.tagWindow)
        self.tagWalls()

    def tagWalls(self):
        localWalls = []
        newWalls = False
        for i in range(len(self.sessionObjects)):
            if self.sessionObjects[i].tag == "WALL" and cmds.listAttr(self.sessionObjects[i].transform, st='DAVEBUILDING') == None:
                self.walls.append(i)
                localWalls.append(i)
                newWalls = True
        if newWalls:
            print "New walls = " + str(localWalls)
            numTabs = math.ceil(float(len(localWalls)) / 5.0)
            self.wallWindow = cmds.window(title="DAVE: Set buildings")
            form = cmds.formLayout()
            tabs = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5)
            cmds.formLayout(form, edit=True, attachForm=((tabs, 'top', 0), (tabs, 'left', 0), (tabs, 'bottom', 0), (tabs, 'right', 0)))
            cols = []
            fields = []
            for i in range(int(numTabs)):
                cols.append(cmds.columnLayout())
                cmds.setParent(tabs)
                cmds.tabLayout(tabs, e=True, tabLabel=((cols[i], str(i + 1))))
            for i in range(len(localWalls)):
                cmds.setParent(cols[i / 5])
                cmds.text(label = "Set building identifier for "+self.sessionObjects[localWalls[i]].transform+':', font = "boldLabelFont", width = 200)
                cmds.separator(width = 20, style = "none")
                cmds.button(label = "Focus on object", width = 180, command = lambda x: selectAndViewObject(self.sessionObjects[localWalls[i]].transform))
                cmds.columnLayout(width = 400)
                fields.append(cmds.optionMenu(label='Building Identifier'))
                for j in range(100):
                    cmds.menuItem(label=str(j + 1))
                cmds.separator(height=10)
                if i == len(localWalls) - 1:
                    if i >= 5:
                        label = "Previous"
                        cmds.button(label=label,command=lambda x: cmds.tabLayout(tabs, e = True, st = cols[(i - 1) - 1]))
                    label = "Done"
                    cmds.button(label=label,command=lambda x: self.processWalls(fields, localWalls))
                    continue
                if i % 5 == 4:
                    if i >= 5:
                        label = "Previous"
                        cmds.button(label=label,command=lambda x: cmds.tabLayout(tabs, e = True, st = cols[(i - 1) - 1]))
                    label = "Next"
                    cmds.button(label=label,command=lambda x: cmds.tabLayout(tabs, e = True, st = cols[i + 1]))
            cmds.showWindow()
        else:
            self.processWalls([], [])

    def processWalls(self, fields, localWalls):
        self.wallCollections = []
        for i in range(100):
            self.wallCollections.append([])
        if len(fields) != 0:
            for i in range(len(fields)):
                activeBuilding = int(cmds.optionMenu(fields[i], q = True, v = True)) - 1
                wallNo = localWalls[i]
                self.buildingStates[activeBuilding] = False
                if cmds.listAttr(self.sessionObjects[wallNo].transform, st='DAVEBUILDING') == None:
                    cmds.addAttr(self.sessionObjects[wallNo].transform, longName = "DAVEBUILDING", dataType = "string", hidden = False)
                cmds.setAttr(self.sessionObjects[wallNo].transform+".DAVEBUILDING", activeBuilding, type = "string")
            cmds.deleteUI(self.wallWindow)
        for i in range(len(self.walls)):
            activeBuilding = None
            if cmds.listAttr(self.sessionObjects[self.walls[i]].transform, st = "DAVEBUILDING") != None:
                activeBuilding = int(cmds.getAttr(self.sessionObjects[self.walls[i]].transform+".DAVEBUILDING"))
            wallNo = self.walls[i]
            self.wallCollections[activeBuilding].append(wallNo)
        self.tagRooms()

    def tagRooms(self):
        numTabs = 0
        buildingNos = []
        localWalls = []
        wallsPerRoom = []
        for i in range(len(self.wallCollections)):
            if len(self.wallCollections[i]) != 0:
                tagCheck = False
                counter = 0
                for j in range(len(self.wallCollections[i])):
                    if cmds.listAttr(self.sessionObjects[self.wallCollections[i][j]].transform, st = "DAVEROOM") == None:
                        tagCheck = True
                        counter += 1
                if tagCheck:
                    numTabs += 1
                    buildingNos.append(i)
                    wallsPerRoom.append(counter)
                
        if numTabs != 0:
            self.wallWindow = cmds.window(title="DAVE: Set rooms")
            form = cmds.formLayout()
            tabs = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5)
            cmds.formLayout(form, edit=True, attachForm=((tabs, 'top', 0), (tabs, 'left', 0), (tabs, 'bottom', 0), (tabs, 'right', 0)))
            cols = []
            fields = []
            for i in range(numTabs):
                cols.append(cmds.scrollLayout(verticalScrollBarThickness=16, width = 450, height = 800))
                cmds.setParent(tabs)
                cmds.tabLayout(tabs, e=True, tabLabel=((cols[i], "Building "+str(buildingNos[i]))))
            for i in range(numTabs):
                for j in range(len(self.wallCollections[buildingNos[i]])):
                    if cmds.listAttr(self.sessionObjects[self.wallCollections[buildingNos[i]][j]].transform, st = "DAVEROOM") != None:
                        continue
                    cmds.setParent(cols[i])
                    cmds.text(label = "Set building identifier for "+self.sessionObjects[self.wallCollections[buildingNos[i]][j]].transform+':', font = "boldLabelFont", width = 200)
                    cmds.separator(width = 20, style = "none")
                    cmds.button(label = "Focus on object", width = 180, command = "selectAndViewObject('"+self.sessionObjects[self.wallCollections[buildingNos[i]][j]].transform+"')")
                    cmds.columnLayout(width = 400)
                    fields.append(cmds.optionMenu(label='Building Identifier'))
                    localWalls.append(self.wallCollections[buildingNos[i]][j])
                    for k in range(100):
                        cmds.menuItem(label=str(k + 1))
                    cmds.separator(height=10)
                    if i == numTabs - 1 and j == wallsPerRoom[len(wallsPerRoom) - 1] - 1:
                        if i >= 1:
                            label = "Previous"
                            cmds.button(label=label,command=lambda x: cmds.tabLayout(tabs, e = True, st = cols[(i / 5) - 1]))
                        label = "Done"
                        cmds.button(label=label,command=lambda x: self.processRooms(fields, localWalls))
                        continue
                    if j == wallsPerRoom[i] - 1:
                        if i >= 1:
                            label = "Previous"
                            cmds.button(label=label,command=lambda x: cmds.tabLayout(tabs, e = True, st = cols[(i - 1) - 1]))
                        label = "Next"
                        cmds.button(label=label,command=lambda x: cmds.tabLayout(tabs, e = True, st = cols[i + 1]))
            cmds.showWindow()
        else:
            self.processRooms([], [])

    def processRooms(self, fields, localWalls):
        self.roomCollections = []
        for i in range(100):
            self.roomCollections.append([])
            for j in range(100):
                self.roomCollections[i].append([])
        if len(fields) != 0:
            for i in range(len(fields)):
                activeRoom = int(cmds.optionMenu(fields[i], q = True, v = True)) - 1
                activeBuilding = int(cmds.getAttr(self.sessionObjects[localWalls[i]].transform+".DAVEBUILDING"))
                wallNo = localWalls[i]
                print "wallNo = "+str(wallNo)
                self.roomStates[activeBuilding][activeRoom] = False
                if cmds.listAttr(self.sessionObjects[wallNo].transform, st='DAVEROOM') == None:
                    cmds.addAttr(self.sessionObjects[wallNo].transform, longName = "DAVEROOM", dataType = "string", hidden = False)
                cmds.setAttr(self.sessionObjects[wallNo].transform+".DAVEROOM", activeRoom, type = "string")
            cmds.deleteUI(self.wallWindow)
        for i in range(len(self.walls)):
            activeBuilding = None
            print "transform = " + self.sessionObjects[self.walls[i]].transform
            if cmds.listAttr(self.sessionObjects[self.walls[i]].transform, st = "DAVEBUILDING") != None:
                activeBuilding = int(cmds.getAttr(self.sessionObjects[self.walls[i]].transform+".DAVEBUILDING"))
            if cmds.listAttr(self.sessionObjects[self.walls[i]].transform, st = "DAVEROOM") != None:
                activeRoom = int(cmds.getAttr(self.sessionObjects[self.walls[i]].transform+".DAVEROOM"))
            wallNo = self.walls[i]
            self.roomCollections[activeBuilding][activeRoom].append(wallNo)
        self.checkBuildingHullStates()

    def checkBuildingHullStates(self):
        print len(self.walls)
        print self.buildingStates
        print len(self.roomCollections[0])
        print len(self.roomStates[0])
        for i in range(len(self.wallCollections)):
            self.genBuildingHull(i)
            self.buildingStates[i] = True
        print self.buildingStates
        print self.roomStates
        
    def genBuildingHull(self, buildingNo):
        for j in range(len(self.roomCollections[buildingNo])):
            self.genRoomHull(buildingNo, j)
            self.roomStates[buildingNo][j] = True

    def genRoomHull(self, buildingNo, roomNo):
        xInfo = []
        zInfo = []
        if len(self.roomCollections[buildingNo][roomNo]) == 0:
            return
        firstInnerX = sys.maxint
        lastInnerX = -sys.maxint
        firstInnerZ = sys.maxint
        lastInnerZ = -sys.maxint
        bbs = []
        for i in range(len(self.roomCollections[buildingNo][roomNo])):
            bbs.append(cmds.exactWorldBoundingBox(self.sessionObjects[self.roomCollections[buildingNo][roomNo][i]].transform))
            xInfo.extend((bbs[i][0], bbs[i][3]))
            zInfo.extend((bbs[i][2], bbs[i][5]))
            firstInnerX = min(bbs[i][3], firstInnerX)
            lastInnerX = max(bbs[i][0], lastInnerX)
            firstInnerZ = min(bbs[i][5], firstInnerZ)
            lastInnerZ = max(bbs[i][2], lastInnerZ)

        verts = []
        for i in range(len(bbs)):
            minXIn = False
            maxXIn = False
            minZIn = False
            maxZIn = False
            if bbs[i][0] > firstInnerX:
                minXIn = True
            if bbs[i][2] > firstInnerZ:
                minZIn = True
            if bbs[i][3] < lastInnerX:
                maxXIn = True
            if bbs[i][5] < lastInnerZ:
                maxZIn = True
            if minXIn and minZIn:
                verts.append([bbs[i][0], 0, bbs[i][2]])
            if minXIn and maxZIn:
                verts.append([bbs[i][0], 0, bbs[i][5]])
            if maxXIn and maxZIn:
                verts.append([bbs[i][3], 0, bbs[i][5]])
            if maxXIn and minZIn:
                verts.append([bbs[i][3], 0, bbs[i][2]])

        for i in range(len(verts)):
            verts[i][0] = round(verts[i][0], 2)
            verts[i][2] = round(verts[i][2], 2)
        
        vertSet = set(tuple(x) for x in verts)
        vertSetList = [list(x) for x in set(tuple(y) for y in vertSet)]
        print vertSetList
        for i in range(len(vertSetList)):
            cmds.polyCube(name = 'test', w = 0.1, d = 0.1, h = 0.1)
            cmds.move(vertSetList[i][0], vertSetList[i][1], vertSetList[i][2], a = True)

def main():
    dave = daveManager("D:/Python/DAVE/DAVE/")
    urllib.urlretrieve("https://www.glovefx.com/s/dave.png", dave.path+"header.png")
    dave.UI()
    
if __name__== "__main__":
  main()

