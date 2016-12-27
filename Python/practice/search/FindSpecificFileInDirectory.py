import glob, os
from os.path import expanduser
from shutil import copyfile
import shutil

home = expanduser("~")

destinationPath = home + "/Desktop/KBLauncher_2.3/"

os.chdir(home + "/practice")

def copytree(src, dst, symlinks=False, ignore=None):
    for item in os.listdir(src):
        s = os.path.join(src, item)
        d = os.path.join(dst, item)
        if os.path.isdir(s):
            shutil.copytree(s, d, symlinks, ignore)
        else:
            shutil.copy2(s, d)


# search specific directory
for file in glob.glob("*"):
    print(file)

# search traversing through...
for root, dirs, files in os.walk(destinationPath):

    print root
    MODE = ""
    ACTUAL_FRAMEWORK_NAME = root + "FMDB.framework"
    REAL_DEVICE_FRAMEWORK_NAME = root + "FMDB_REAL_DEVICE.framework"
    SIMULATOR_DEVICE_FRAMEWORK_NAME = root +  "FMDB_SIMULATE_DEIVCE.framework"

    for file in files:

        if file.endswith(".pbxproj"):

             DIRECTORY_PATH = os.path.join(root, file)

             with open(DIRECTORY_PATH, 'r') as searchfile:
                 for line in searchfile:
                     if "OTHER_SWIFT_FLAGS" in line:
                         line = line.strip()
                         value = line.split("=")
                         print value
                         value[1] = value[1].replace(";", "")
                         value[1] = value[1].replace("\"", "")
                         value[1] = value[1].replace(" ", "")

                 print value[0], value[1]

                 dictionary = {}
                 dictionary[value[0]] = value[1]
                 print dictionary

                 print dictionary[value[0]]


                 if dictionary[value[0]] == "-DREAL_DEVICE" :
                     if os.path.exists(ACTUAL_FRAMEWORK_NAME):
                         # os.remove(ACTUAL_FRAMEWORK_NAME)
                         print "got removed " + ACTUAL_FRAMEWORK_NAME
                     # shutil.copytree(REAL_DEVICE_FRAMEWORK_NAME, ACTUAL_FRAMEWORK_NAME)

                    # copytree(REAL_DEVICE_FRAMEWORK_NAME, ACTUAL_FRAMEWORK_NAME)

                 elif dictionary[value[0]] == "-DSIMULATOR_DEVICE" :
                     if os.path.exists(ACTUAL_FRAMEWORK_NAME):
                         # os.remove(ACTUAL_FRAMEWORK_NAME)
                         print "got removed " + ACTUAL_FRAMEWORK_NAME
                     # shutil.copytree(SIMULATOR_DEVICE_FRAMEWORK_NAME, ACTUAL_FRAMEWORK_NAME)

                 # copytree(SIMULATOR_DEVICE_FRAMEWORK_NAME, ACTUAL_FRAMEWORK_NAME)
