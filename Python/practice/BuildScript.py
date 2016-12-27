from subprocess import call
from os.path import expanduser

home = expanduser("~")

# since this is not a shell script, you shoudn't know the env.variable.
# FRAMEWORK_PATH = $(SRCROOT) + "/Opensources/fmdb/"
# DEFINE_LINE_PATH = $(SRCROOT) + "/KBLauncher/AppDelegate.swift"

FRAMEWORK_PATH = home + "/Desktop/KBLauncher_2.3/Opensources/fmdb/"
DEFINE_LINE_PATH = home + "/Desktop/KBLauncher_2.3/KBLauncher/AppDelegate.swift"

REAL_FRAMEWORK_PATH = FRAMEWORK_PATH + "FMDB_REAL.framework/"
SIMULATOR_FRAMEOWORK_PATH = FRAMEWORK_PATH + "FMDB_SIMUL.framework/"
ORIGINAL_FRAMEWORK_PATH = FRAMEWORK_PATH + "FMDB.framework"

defineText = "iOS_REAL_DEVICE_RUNNING"

continueFlag = False

with open(DEFINE_LINE_PATH) as f:

    for line in f:
        line = line.strip()

        print "line here : " + line

        if continueFlag == True:
            print "continueFlag is True now"
            continue

        if line.endswith('*/') or line == "/*":
            print "not in here"
            continueFlag = False
            continue

        if line.startswith('*/') or line == "/*":
            print "not in here"
            continueFlag = False
            continue

        if line.startswith('/*') or line == "/*":
            print "in here"
            continueFlag = True
            continue

        if line.startswith('//') or line == "//":
            continue

        if line.startswith('*') or line == "*":
            continue


        if defineText in line:

            print defineText
            line = line.strip()
            value = line.split("=")

            dictionary = {}
            dictionary[value[0]] = value[1]

            value = " ".join(dictionary[value[0]].split())

            if value == "true" :
                call(["rm", "-rf", ORIGINAL_FRAMEWORK_PATH])
                call(["cp", "-r", REAL_FRAMEWORK_PATH, ORIGINAL_FRAMEWORK_PATH])
                break
            elif value == "false":
                call(["rm", "-rf", ORIGINAL_FRAMEWORK_PATH])
                call(["cp", "-r", SIMULATOR_FRAMEOWORK_PATH, ORIGINAL_FRAMEWORK_PATH])
                break

