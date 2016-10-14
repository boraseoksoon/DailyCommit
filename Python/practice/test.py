#! /bin/usr/python
#! author : jss
#! purpose : practice for fun

from pprint import pprint

if 4 in [1,2,3,4]:print("4 is in here!")

my_favorite_language = ['c','c++','objective-c','swift','skavenger']
your_favorite_langauge = ['java','scala','haskell','c++', 'c']
my_friend_favorite_langauge = ['swift','ruby','python']

for l in my_favorite_language  :
    if l in your_favorite_langauge :
        print("your_favorite_langauge  has the same favorite thing which is " + l)
    if l in my_friend_favorite_langauge :
        print "my_friend_favorite_langauge has the same favorite PL which is " + l

a = ' hello '
print a.lstrip().rstrip()

a = "Life is too short"

print   a.replace("Life", "Your legs")
print   a

b = a.replace("Life", "Your legs")
print b

a = "Life is too short. Use python."

c = a.split()
print c

print


if 4 in [1,2,3,4] :
    print "True"
else :
    print "False"


treeHit = 0
treeCutCount = 0

while treeHit <= 50:
    treeHit+=1
    print "We treeHit!"

    if treeHit % 10 == 0 :
        treeCutCount+=1
        # print treeCutCount
        # print "Tree is going to down. the tree order going down now is now %d" %treeCutCount
        print "Tree is going to down. the tree order going down now is now " + str(treeCutCount)
    else:
        print "else"

prompt = '''
1. Add
2. Del
3. List
4. Quit

Enter number : '''

number = 0

choseNumber = 10

while number != 4:
    print(prompt)
    number = int(input())
    choseNumber-=1

    if number == 1 :
        print "you chose Add"
    elif number == 2 :
        print "you chose Del"
    elif number == 3:
        print "you chose List"
    else :
        print "you chose Quit"

    if not choseNumber :
        print "you've chose too many. so I'll quit"
        break



a = [(1,2),(3,4), (5,6)]


for e in a :
    print e


r = range(100)
print r

num = [1,2,3]
list = []

for n in num :
    list.append(n * 3)
print(list)

space = "*" * 100
print space

a = [1,2,3,4]
result = []
for num in a:
    result.append(num*3)
print(result)

result = [num * 3 for num in a]
print(result)

result = [num * 3 for num in a if num % 2 == 0]
print result



testList = [1,2,3,4,5,6,7,8,9,10]
result = [a * 10 for a in testList if a % 2 == 0]
print(result)

result.pop()
result.pop()
result.pop()
result.pop()
print(result)

result = [x * y for x in (range(1,10)) for y in (range(1,10))]
print(result)


def many_arg(*args) :
    sum = 0
    for arg in args :
       sum += arg
    return sum

a = many_arg(1,2,3,4,5,6,7,8,9,10)
print(a)

def sum_many(*args):
     sum = 0
     for i in args:
         sum = sum + i
     return sum

result = sum_many(1,2,3)
print(result)


def say_yourName(name, age, woman=False):
    if woman :
        print(name + " is your name and age is " + str(age))
    else :
        print("you're not woman so I do not say something for you.")


say_yourName("taehee", 35, True)
say_yourName("taehee2", 35)

''' reason why it was not doing properly is "global"'''
sum2 = 0
def many2(*args) :
    for arg in args :
        global sum2
        sum2 += arg
    print(sum2)

many2(1,2,3,4,5,6,7,8,9,10)

# it seems that it was deprecated or broken.
'''
for i in range(10):
    print(i, end=' ')
'''

# it works like charm. :)
for i in range(100):
    print i,



f = open("newfile3.txt", 'w')

for i in range(1,11):
    data = "%d row is here\n" % i
    # print i,
    # f.write(data)
    f.write("this is the row number : " + str(i) + "\n")

f.close()

import os
homeuser = os.path.expanduser("~/Desktop/somefile.txt")
f = open(homeuser , 'w')

dictionary = {'key1' : '1','key2': "2", 'key3': "3", 'key4':"4", 'key5':"5"}

# important to remember when iterating over dictionary type data.
for k,v in dictionary.iteritems() :
    data = k + " has the value : " + v + " with the fuck\n"
    f.write(data)

f.close()

r = open(homeuser, 'r')

# lines = r.readline()
entireMsg = r.read()
print(entireMsg)

print("output completed.")
print("")
r.close()

pf = open(homeuser, 'a')
data = "this is appended data2!\n"
pf.write(data)
pf.close()

r = open(homeuser, 'r')
entireMsg2 = r.read()
print entireMsg2
r.close()

with open(homeuser, 'r') as f :
    entireMsg = f.read()
    print("entireMsg is that... " + entireMsg)


# line = r.readline()
# print(line)


'''
while True:
    line = r.readline()
    if not line:
        break
    print(line)
'''

'''
while True :
     line = r.readline()
     if line is None:
        break
     else:
         print(line)

r.close()
'''

print("")

'''
while 1 :
    data = input("input your msg : ")
    if not data :
            break
    else:
        print(data)
'''

class Service :
    secret = "shit!"
    name = "my_name"

    def __init__(self):
        self.secret = "default_shit"
        self.name = "default_name"

    def setName(self, _name):
        # name = _name ==> it should be...
        self.name = _name

    def sayName(self):
        print "Hello " + self.name + " we welcome you! and your secret is " + self.secret

    def sum(self, a,b) :
        sum = a + b
        return sum


s = Service()
print(s.secret)
# sum = s.sum(10,100)

# s.setName("jss")
s.sayName()
type(a)


