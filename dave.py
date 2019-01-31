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

        print stack
        self.convexhull = stack
        cmds.select(d = True)
        facetList = []
        for i in range(len(stack)):
            cmds.select(self.transform+".vtx["+str(self.topVertsIndex[stack[i]])+"]", add = True)
            pos = self.topVerts[stack[i]]
            facetList.append((pos[0], self.hullHeight, pos[2]))
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
        self.UI()
        self.hash = None

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
        transforms = cmds.listRelatives(geometry, p=True)
        cmds.select(transforms)
        self.importSelectedObjects()

    def importSelectedObjects(self):
        selection = cmds.ls(sl = True)
        toBeImported = []
        for i in range(len(selection)):
            currentIndex = len(self.sessionObjects)
            if not any(dObject.transform == selection[i] for dObject in self.sessionObjects):
                self.sessionObjects.append(daveObject(selection[i], currentIndex))
                print len(self.sessionObjects)
            else:
                continue
            compliantObject = self.checkDAVECompliance(currentIndex)
            inDB = self.checkAgainstDatabase(currentIndex)
            if (not compliantObject) or (not inDB):
                toBeImported.append(currentIndex)
        if len(toBeImported) != 0:
            self.importSelection(toBeImported)

    def importSelection(self, objects):
        self.tagWindow = cmds.window(title="DAVE: Set tags for objects")
        cmds.columnLayout(width = 400)
        fields = []
        radioButtons = []
        done = False
        objDone = 0
        while not done:
            for i in range(objDone, objDone + 5):
                cmds.rowLayout(nc = 4, width = 400)
                cmds.text(label = "Set parameters for "+self.sessionObjects[objects[i]].transform+':', font = "boldLabelFont", width = 200)
                cmds.separator(width = 20, style = "none")
                cmds.button(label = "Focus on object", width = 180)
                cmds.setParent("..")
                cmds.columnLayout(width = 400)
                radioButtons.append(cmds.radioButtonGrp(nrb = 2, la2 = ["NONE", "WALL"]))
                cmds.radioButtonGrp(radioButtons[i], e = True, sl = 1)
                cmds.text(label = "Set object name (optional)", font = "smallBoldLabelFont")
                fields.append(cmds.textField(width = 400, text = self.sessionObjects[objects[i]].transform))
                cmds.separator(height=10)
                objDone += 1
                if objDone == len(objects):
                    done = True
                    break
            labelString = "Next"
            if done:
                labelString = "Done"
            cmds.button(label=labelString,command=lambda x: self.completeTagging(fields, radioButtons, objects, done))
            
        cmds.showWindow()

    def completeTagging(self, fields, radioButtons, objects):
        anyImported = False
        db = open(self.dbpath, "a+")
        for i in range(len(fields)):
            name =  cmds.textField(fields[i], q = True, text = True)
            activeButton = cmds.radioButtonGrp(radioButtons[i], q = True, sl = True)
            tag = cmds.radioButtonGrp(radioButtons[i], q = True, la2 = True)[activeButton - 1]
            hashstring = name + tag
            objectHash = self.createHash(hashstring)
            if objectHash in self.db[0]:
                continue
            if cmds.listAttr(self.sessionObjects[objects[i]].transform, st='DAVEHASH') == None:
                cmds.addAttr(self.sessionObjects[objects[i]].transform, longName = "DAVEHASH", dataType = "string", hidden = False)
            cmds.setAttr(self.sessionObjects[objects[i]].transform+".DAVEHASH", objectHash, type = "string")
            if cmds.listAttr(self.sessionObjects[objects[i]].transform, st='DAVETAG') == None:
                cmds.addAttr(self.sessionObjects[objects[i]].transform, longName = "DAVETAG", dataType = "string", hidden = False)
            cmds.setAttr(self.sessionObjects[objects[i]].transform+".DAVETAG", tag, type = "string")
            cmds.rename(self.sessionObjects[objects[i]].transform, name)
            self.sessionObjects[objects[i]].transform = name
            if not self.checkAgainstDatabase(objects[i]):
                if not anyImported:
                    db.write("\n!\n")
                    anyImported = True
                db.write("$\nNAME=%s\nTAG=%s\nHASH=%s\n$\n" % (name, tag, objectHash))
            self.sessionObjects[objects[i]].imported = True
            self.sessionObjects[objects[i]].genConvexHull()
            self.sessionObjects[objects[i]].determineShape()
        if anyImported:
            db.write("!\n")
        db.close()
        cmds.deleteUI(self.tagWindow)


def main():
    dave = daveManager("D:/Python/DAVE/DAVE/")
    urllib.urlretrieve("https://www.glovefx.com/s/dave.png", dave.path+"header.png")

if __name__== "__main__":
  main()


