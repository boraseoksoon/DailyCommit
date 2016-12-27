import mmap
from os.path import expanduser

# get home directory
home = expanduser("~")

import sys
arg1 = sys.argv[1]
arg2 = sys.argv[2]

print arg1, arg2 

PATH = arg1

if len(sys.argv) < 2:
    print "You must set destination directory and string you wanna search!!"

# search and print the text line if "Swift" is inserted in the middle of the text
'''
with open(PATH) as f:  
    for line in f:
	 if "Swift" in line:
             print line
''' 
import os
# search traversing and find specific extension of file and do your job you need..

DIRECTORY_PATH = sys.argv[1]
count = 0

with open(DIRECTORY_PATH, 'r') as searchfile:
    for line in searchfile:
        if  "OTHER_SWIFT_FLAGS" in line:
           line = line.strip()
           value = line.split("=") 
           print value
           count+=1
	   print value[0], value[1]    
           dictionary = {}
           dictionary[value[0]] = value[1]
           print dictionary

           print dictionary[value[0]]

           if dictionary[value[0]] == "-DREAL_DEVICE":
		print "if this is"                
           elif dictionary[value[0]] == "-DSIMULATOR_DEVICE":
		print "elif"
           if count == 1:
		break


'''
with open(home + '/Desktop/python_test.txt', 'rb', 0) as file, \
     mmap.mmap(file.fileno(), 0, access=mmap.ACCESS_READ) as s:
    if s.find(b'fuck') != -1:
        print('true')
    else:
        print('false')
'''
