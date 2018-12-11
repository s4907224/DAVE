import maya.cmds as cmds
import base64
import hashlib
import os

databasePath = "D:/Python/DAVE/DAVE/assets.davedb"

def createUI():
	cmds.window(title='Test Window')
	cmds.rowLayout(nc=3)
	cmds.button(label="Import Selection", width=100, c=importSelectedObjects)
	cmds.button(label="Scan Scene", width = 100, c=scanSceneAndImport)
	cmds.showWindow()

def completeTagging(fields, radioButtons, tagWindow, objects):
	anyImported = False
	global databasePath
	db = open(databasePath, "a+")
	for i in range(len(fields)):
		name =  cmds.textField(fields[i], q = True, text = True)
		activeButton = cmds.radioButtonGrp(radioButtons[i], q = True, sl = True)
		tag = cmds.radioButtonGrp(radioButtons[i], q = True, la2 = True)[activeButton - 1]
		hashstring = name + tag
		print hashstring
		objectHash = createHash(hashstring)
		print objectHash
		if cmds.listAttr(objects[i], st='DAVEHASH') == None:
			cmds.addAttr(longName = "DAVEHASH", dataType = "string")
		cmds.setAttr(objects[i]+".DAVEHASH", objectHash, type = "string")
		if cmds.listAttr(objects[i], st='DAVETAG') == None:
			cmds.addAttr(longName = "DAVETAG", dataType = "string")
		cmds.setAttr(objects[i]+".DAVETAG", tag, type = "string")
		cmds.rename(objects[i], name)
		if not checkAgainstDatabase(objectHash):
			if not anyImported:
				db.write("\n!\n")
				anyImported = True
			db.write("\n$\nNAME=%s\nTAG=%s\nHASH=%s\n$\n" % (name, tag, objectHash))
	if anyImported:
		db.write("\n!\n")
	db.close()
	cmds.deleteUI(tagWindow)


def importSelectedObjects(*args):
	selection = cmds.ls(sl = True)
	print selection
	toBeImported = []
	for i in range(len(selection)):
		compliantObject = checkDAVECompliance(selection[i])
		if compliantObject[0]:
			print "Attribute compliance"
			print 
			if checkAgainstDatabase(cmds.getAttr(compliantObject[1]+'.DAVEHASH')):
				print "obj in database!"
			else:
				print "New obj"
		else:
			toBeImported.append(selection[i])
	if len(toBeImported) != 0:
		print "there were things"
		importSelection(toBeImported)

def checkAgainstDatabase(objectHash):
	global database
	print objectHash
	if objectHash in database[0]:
		return True
	else:
		return False

def scanSceneAndImport(*args):
	geometry = cmds.ls(geometry=True)
	transforms = cmds.listRelatives(geometry, p=True)
	cmds.select(transforms)
	importSelectedObjects()

def importSelection(objects):
	tagWindow = cmds.window(title="Set tags for objects")
	cmds.columnLayout(width = 400)
	fields = []
	radioButtons = []
	for i in range(len(objects)):
		cmds.rowLayout(nc = 4, width = 400)
		cmds.text(label = "Set parameters for "+objects[i]+':', font = "boldLabelFont", width = 200)
		cmds.separator(width = 20, style = "none")
		cmds.button(label = "Focus on object", width = 180)
		cmds.setParent("..")
		cmds.columnLayout(width = 400)
		radioButtons.append(cmds.radioButtonGrp(nrb = 2, la2 = ["NONE", "WALL"]))
		cmds.radioButtonGrp(radioButtons[i], e = True, sl = 1)
		cmds.text(label = "Set object name (optional)", font = "smallBoldLabelFont")
		fields.append(cmds.textField(width = 400, text = objects[i]))
		cmds.separator(height=10)
	cmds.button(label='Done',command=lambda x: completeTagging(fields, radioButtons, tagWindow, objects))
	cmds.showWindow()

def checkDAVECompliance(obj):
	if cmds.listAttr(obj, st = "DAVEHASH"):
		return [True, cmds.ls(obj)[0]]
	elif (len(obj) < 9):
		return [False, obj]
	endIndex = len(obj) - 1
	if obj[0] == 'D' and obj[9] == '_':
		print "Name starts with hash"
		cmds.addAttr(obj, longName = 'DAVEHASH', dataType = "string")
		cmds.setAttr(obj+".DAVEHASH", obj[1:9], type = "string")
		print cmds.getAttr(obj+".DAVEHASH")
		cmds.rename(obj, obj[10:])
		return [True, obj[10:]]
	elif obj[endIndex - 8] == 'D' and obj[endIndex - 9] == '_':
		print "second type compliance"
		return [True, False, False]
	else:
		return [False, obj]

def createHash(string):
	hasher = hashlib.sha1(string)
	return base64.urlsafe_b64encode(hasher.digest()[:6])

def parseDAVEDB(path):
	names = []
	hashes = []
	tags = []
	with open(path) as p:
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
	return [hashes, names, tags]



database = parseDAVEDB(databasePath)
print database
createUI()
