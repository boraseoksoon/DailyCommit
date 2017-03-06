#!/usr/bin/python

# daily practice : python
# => need to "memorize" because python should be your one of primary language from now on.

result = "hello world".startswith("hello")
print(result)

result = "hello world".startswith("world")
print(result)

result = "hello world".endswith("hello")
print(result)

result = "hello world".endswith("o world")
print(result)

count = len("hello")
print count

for i in reversed(range(count)) :
    print(i)
    print("say hello {} times!".format(count))

print("strings")
print("hello"[0:3])

print("hello world"[0:5] + "hello world"[5:])

print("reverse-")
print("hello world"[-1:])

capitalHello = "hello".capitalize()
# abNumber = "abcdababab".count("ab")
# print(abNumber)
number = len("abcdababab")
print(number)

# check if strings consists of alphabet and number only
result = "ios5".isalnum()
print(result)

# only alphabet
result = "hi".isalpha()
# only number
result = "123".isdigit()
print(result)

# islower, isupper

# lstrip, strip, rstrip
lstrip = "   \n\thello\t\n  \n  ".strip()
print("say : {}".format(lstrip))

# split, splittines, join

get = "abc".split('b')
print(get)
get = "?".join(get)
print(get)

get = "abc\ndef".splitlines()
print(get)

get = "".join(['a','b','c'])
print(get)


# list

a = [1,2,3,3,3,4,5]
count = a.count(3)
print(count)

q = []
q.insert(0,0)
q.insert(0,1)
q.insert(0,2)
q.insert(1,3)
q.insert(4,100)
print "last value of list : {}".format(q[-1]) # last value of list
lastIndexOfList= len(q) -1
print "last value of list : {}".format(lastIndexOfList) # last index of list
print q

for i in q :
    print "gogogo : {}".format(i)


# tuple
t = (1,2,3)
t[0]
# t[0] = 100            # tuple cannot be mutated.
print (t)

# dictionary
c = {"KEY1":"A", "KEY2":True, "KEY3":10}
c["KEY4"] = False
print(c["KEY1"])

for k, v in c.items() :
    print("{} : {}".format(k,v))

import time
print(time.strftime("%Y:%D:%H:%M:%S"))

import sys
# print(sys.path)

# for loop
for i in range(0, 100, 50):
    print(i)

print("")
for i in range(5, 10, 2):
    print(i)
    # 5
    # 7
    # 9