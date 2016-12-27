import mmap
from os.path import expanduser

home = expanduser("~")

PATH = home + '/Desktop/python_test.txt'

with open(PATH) as f:  
    for line in f:
	 if "Swift" in line:
             print line


'''
with open(home + '/Desktop/python_test.txt', 'rb', 0) as file, \
     mmap.mmap(file.fileno(), 0, access=mmap.ACCESS_READ) as s:
    if s.find(b'fuck') != -1:
        print('true')
    else:
        print('false')
'''
