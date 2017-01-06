#/usr/bin/python

import os

BASE_PATH = os.getcwd()
DEFINE_SWIFT_PATH = BASE_PATH + "/Define.swift"
defineText_IN_DEFINE_SWIFT_PATH = "KB_BASE_URL + "

filedata = None
with open(DEFINE_SWIFT_PATH, 'r') as file :
  filedata = file.read()

# Replace the target string
filedata = filedata.replace(defineText_IN_DEFINE_SWIFT_PATH, "")

# Write the file out again
with open(DEFINE_SWIFT_PATH, 'w') as file:
  file.write(filedata)

