#An example of how .davedb files are parsed
import os

path = "D:/Python/DAVE/DAVE/assets.davedb"

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

for i in range(len(names)):
	print "Asset identified with hash " + hashes[i]
	print "Human readable name:       " + names[i]
	print "It is of type              " + tags[i]
	print