#! path : /usr/bin/python
#! author : jss

'''
import module1

s = module1.safe_sum(10,20)
print(s)
s = module1.safe_sum('a', 20)
print(s)

s = module1.sum(1,2)
print(s)
s = module1.sum(10,100)
print(s)
'''

# from module1 import sum, safe_sum
from module1 import *
from test import *

space = "*" * 200
print(space)
print()
s = safe_sum(10,20)
print(s)
s = safe_sum('a', 20)
print(s)

s = sum(1,2)
print(s)
s = sum(10,100)
print(s)
print(space)

try:
    4 / 0
except ZeroDivisionError as e:
    print(e)

try:
    # f = open('foo.txt', 'r')
    f = open(homeuser, 'r')
    print("read successfully")
# except FileNotFoundError as e:
except IOError as e:
    print(str(e))
else:
    data = f.read()
    f.close()

print("again ")
try:
    f = open('foo2.txt', 'w')
    print("read again2")
except IOError as e:
    print(str(e))
finally:
    print("it must fire!")
    f.close()

try:
    a = [1,2]
    print(a[3])
    4/0
# except (ZeroDivisionError, IndexError) as e:
except ZeroDivisionError as e :
    print(e)
except IndexError as e :
    print(e)
finally:
    print('finally fires all the time')

try:
    f=open("fuck.txt", 'r')
except IOError as e:
    pass
    # print(str(e))

print("it can be reached!")

class Bird :
    def fly(self):
        raise NotImplementedError

class Swift(Bird):
    age = 10
    def __init__(self):
        self.age = 100

    def fly(self):
        print("your age is %s and fly high and fast!" %(self.age))
        # print("fly high and fast!")

b = Bird()
# b.fly()
s = Swift()
s.fly()

class MyError(Exception) :
    def __init__(self, msg):
        self.msg = msg
    def __str__(self):
        return self.msg

def sayHello(name):
    if name == 'tom':
        raise MyError('tom is not allowed.')
    elif name == 'john':
        print('hello john!')

try :
    sayHello('tom')
    sayHello('john')
except MyError as e :
    print(str(e))
finally:
    print('finally is always fired!')



# reduce

# map
def two_times(x) :
    return x * 2

list(map(two_times, [1,2,3,4]))

def two_times(numberList) :
    result = []
    for number in numberList :
        result.append(number * 2)
    return result

result = two_times([1,2,3,4])
print "result : " + result


# filter