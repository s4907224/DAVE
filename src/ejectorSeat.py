import maya.cmds as cmds

def main():
    cmds.select(all = True)
    for s in cmds.ls(sl = True):
        if cmds.listAttr(s, st = "*DAVE*") != None:
            for a in cmds.listAttr(s, st = "*DAVE*"):
                cmds.deleteAttr(s+"."+a)
    if cmds.objExists("*_D*"):
        cmds.select("*_D*")
        transforms = cmds.listRelatives(cmds.ls(sl = True, geometry=True), p=True, pa = True)
        cmds.select(transforms)
        for match in cmds.ls(sl = True):
            if match[len(match) - 9] == "D" and match[len(match) - 10] == "_":
                cmds.rename(match, match[:len(match) - 10])
    if cmds.objExists("*D*_*"):
        cmds.select("*D*_*")
        transforms = cmds.listRelatives(cmds.ls(sl = True, geometry=True), p=True, pa = True)
        cmds.select(transforms)
        for match in cmds.ls(sl = True):
            if match[0] == "D" and match[9] == "_":
                cmds.rename(match, match[10:])
    dave = daveManager("D:/Python/DAVE/DAVE/")
    urllib.urlretrieve("https://www.glovefx.com/s/dave.png", dave.path+"fetch/header.png")
    urllib.urlretrieve("https://www.glovefx.com/s/hull.png", dave.path+"fetch/hull.png")
    dave.UI()
    
if __name__== "__main__":
    main()