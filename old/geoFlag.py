import maya.cmds as cmds
import pprint
pp = pprint.PrettyPrinter(depth = 10, width = 40)

'''
DAVE Naming protocol - BUILDINGTAG_ROOMTAG1-ROOMTAG2_TAG_PROPNAME_MESHNAME_ID_HIGH/LOW
For an object comprised of only one mesh, it will have all these attributes,
e.g WALL_church_1_low, but in the case of objects comprised of several meshes,
the parent group holds the tag while the children have the tag "CHILD"
e.g WALL_castle_1_low (group)
	CHILD_bricks_1_low
	CHILD_door_1_low
'''

def parseObjectTags(object):
	building = ''
	rooms = ['']
	tag = ''
	name = ''
	meshname = ''
	ID = ''
	hilo = ''
	numRooms = 1
	maxTagCategory = 6
	activeTag = 0
	stringLength = len(object)
	for i in range(stringLength):
		if activeTag > maxTagCategory:
			break
		if object[i] != '_':
			if activeTag == 0:
				building += object[i]
			if activeTag == 1:
				rooms[numRooms - 1] += object[i]
			if activeTag == 2:
				tag += object[i]
			if activeTag == 3:
				name += object[i]
			if activeTag == 4:
				meshname += object[i]
			if activeTag == 5:
				ID += object[i]
			if activeTag == 6:
				hilo += object[i]
		elif i != 0:
			if object[i - 1] != '_':
				if i < stringLength:
					if object[i + 1] == '_':
						activeTag += 1
						continue
					else:
						rooms.append('')
						numRooms += 1
						continue
	integerID = None
	if ID != '':
		integerID = int(ID)
	parsedDict = {
		"building" : building,
		"rooms" : rooms,
		"tag" : tag,
		"propname" : name,
		"meshname" : meshname,
		"ID" : integerID,
		"high/low" : hilo
	}
	return parsedDict

def setHeirarchy(object):
	if not object["isChild"]:
		allChildren = cmds.listRelatives(object["objectname"], children = True)
		shapeChildren = cmds.listRelatives(object["objectname"], children = True, shapes = True)
		if shapeChildren != None:
			object["children"] = [x for x in allChildren if x not in shapeChildren]
		else:
			object["children"] = allChildren
	else:
		object["parent"] = cmds.listRelatives(object["objectname"], parent = True)[0]

def readSceneObjects():
	transforms = cmds.ls(tr = True)
	tags = ["WALL", "CHILD"]
	recognisedObjects = []
	tagType = ["BUILDING", "ROOM", "TAG"]
	for i in range(len(transforms)):
		parsedDict = parseObjectTags(transforms[i])
		if parsedDict["tag"] in tags:
			isChild = False
			if parsedDict["tag"] == "CHILD":
				isChild = True
			objectDict = {
			"objectname" : transforms[i],
			"building" : parsedDict["building"],
			"rooms" : parsedDict["rooms"],
			"tag" : parsedDict["tag"],
			"propname" : parsedDict["propname"],
			"meshname" : parsedDict["meshname"],
			"ID" : parsedDict["ID"],
			"high/low" : parsedDict["high/low"],
			"isChild" : isChild,
			"children" : [],
			"parent" : 'None'
			}
			recognisedObjects.append(objectDict)
		
	parentObjects = []
	for i in range(len(recognisedObjects)):
		setHeirarchy(recognisedObjects[i])
	return recognisedObjects

DAVEObjects = readSceneObjects()
for i in range(len(DAVEObjects)):
	print "Object " + DAVEObjects[i]["objectname"]
	print "       human readable: " + DAVEObjects[i]["propname"] + " " + DAVEObjects[i]["meshname"] + " " +str(DAVEObjects[i]["ID"])
	print "       is " + DAVEObjects[i]["high/low"] + " poly."
	print "       is part of these rooms: " + str(DAVEObjects[i]["rooms"])
	print "       is part of the building: " + DAVEObjects[i]["building"]
	print "       is tagged as: " + DAVEObjects[i]["tag"]
	if DAVEObjects[i]["isChild"]:
		print "       is a child of " + str(DAVEObjects[i]["parent"])
	else:
		print "       is not a child"
	if DAVEObjects[i]["children"] != []:
		print "       and has children " + str(DAVEObjects[i]["children"])
	else:
		print "       and has no children."
	print ""

'''
name protocol check
prop id hash
human readable
database
'''