#!/usr/bin/python

# Q1. anagram : a word, phrase, or name formed by rearranging the letters of another, such as cinema, formed from iceman.
    # Write a method to decide if two strings are anagram or not. if a one string is a permutation of another string.
Qstring1 = "LIsTEn"
Qstring2 = "sLienT"

def anagram(str1, str2):
    if ''.join(sorted(str1.lower())).strip() == ''.join(sorted(str2.lower())).strip():
        return True
    else:
        return False

result = anagram(Qstring1, Qstring2)
print(result)       # True

### Python Join API
list = "!".join(["a", "b", "c"])
print(list)     # a!b!c

# Q2. duplicated linked list node : Write a method to remove duplicated node from the given unsorted linked list.

# from LinkedList import VerySimpleLinkedList, Node, prepareLinkedList
# verySimpleLinkedList = prepareLinkedList()
# verySimpleLinkedList.printAll()


class Node:
    next = None
    data = None
    def __init__(self, data):
        self.data = data

class VerySimpleLinkedList:
    # ADT
        # find
        # getSize
        # printAll
        # add
        # remove
    headNode = None
    totalSize = 0

    def __init__(self, node):
        self.headNode = node
        self.totalSize = 1

    def prepareToGo(self):
        node = self.headNode
        count = 0
        return node, count

    def find(self, data):
        tuple = self.prepareToGo()
        node = tuple[0]
        count = tuple[1]
        while node is not None:
            if node.data == data:
                print("found out at index {}".format(count))
                return True

            node = node.next
            count+=1
        print("Not found out through entire list!")
        return False

    def getSize(self):
        tuple = self.prepareToGo()
        node = tuple[0]
        count = tuple[1]

        while node is not None:
            node = node.next
            count+=1

        return count

    def printAll(self):
        tuple = self.prepareToGo()
        node = tuple[0]
        count = tuple[1]

        while node is not None:
            print("list[{0}]:{1}".format(count, node.data))
            node = node.next
            count+=1
    def add(self, node):
        node.next = self.headNode
        self.headNode = node
        self.totalSize+=1

    def deleted_duplicated(self):
        cur = self.headNode
        dict = {}
        prev = None

        while cur is not None:
            if cur.data in dict:
                prev.next = cur.next
            else:
                dict[cur.data] = True
                prev = cur
            cur = cur.next

    def remove(self, index):
        if (index > self.totalSize -1):
            print("index overflow on list!!")
            return False
        else:
            tuple = self.prepareToGo()
            node = tuple[0]         # self.headNode
            count = tuple[1]        # 0
            prevNode = node
            while node is not None:

                if index == 0:
                    self.headNode = node.next
                    return True
                elif node.next == None:
                    prevNode.next = None
                    return True

                prevNode = node
                node = node.next
                count += 1

                if index == count:
                    prevNode.next = node.next
                    node.next = None

                    return True

            return False

def prepareLinkedList():
    linkedList = VerySimpleLinkedList(Node(1))
    size = linkedList.getSize()
    # print("Linked list size : {}".format(size))
    # result = linkedList.find(10)
    # print(result)

    linkedList.add(Node(2))
    linkedList.add(Node(2))
    linkedList.add(Node(2))
    linkedList.add(Node(2))
    linkedList.add(Node(2))
    linkedList.add(Node(3))
    linkedList.add(Node(4))
    linkedList.add(Node(5))
    linkedList.add(Node(6))
    linkedList.add(Node(7))
    linkedList.add(Node(7))
    linkedList.add(Node(1))
    linkedList.add(Node(1))

    print("before removed duplicates!")
    linkedList.printAll()
    print("after removed duplicates!")
    linkedList.deleted_duplicated()
    linkedList.printAll()
    print("DONE")

    # print("total size of list : {}".format(linkedList.totalSize))

    # result = linkedList.find(3)
    # print(result)

    # result = linkedList.find(7)
    # print(result)

    # result = linkedList.find(8)
    # print(result)

    # linkedList.printAll()
    # print("")
    # linkedList.remove(6)
    # linkedList.printAll()
    # print("")

    return linkedList

verySimpleLinkedList = prepareLinkedList()
verySimpleLinkedList.printAll()

'''
list[0]:1
list[1]:1
list[2]:7
list[3]:7
list[4]:6
list[5]:5
list[6]:4
list[7]:3
list[8]:2
list[9]:1
list[10]:15
'''
print("")
# Plus, solve the problem for Python Native list Type.
print("Plus, solve the problem for Python Native list Type.")
list = [1,1,7,7,6,5,5,4,4,3,10,10,9,9,1,2,3,4,5,6,7,2,1,15]
list.append(100)

print("original list value : ")
print("["),
for i in list:
    print("{},".format(i)),
print("]")

# using dictionary
def removeDuplicatedNode(list):
    dict = {}; localList = []
    for o in list:
        dict[o] = o

    for k, v in dict.iteritems():
        localList.append(v)

    return localList

print("")
print("remove duplicated version of Python list : ")
print("["),
notRepeatedList = removeDuplicatedNode(list)
for i in notRepeatedList:
    print("{},".format(i)),
print("]")
print("")


# Q3. reverse String
orderedString = "ABCDEFG"
# the first way : using Python Native API.
def reverseString(str):
    return str[::-1]
reverseString = reverseString(orderedString)
print(reverseString)

# the second way
# implement stack first to use stack.

class VerySimpleStack:
    # ADT
        # Push
        # Pop
        # Peek
        # PopAll
        # PrintAll

    currentNode = None
    totalStackIndexNumber = 0
    def __init__(self, newNode):
        self.currentNode = newNode
        self.totalStackIndexNumber = 0

    def push(self, newNode):
        prevNode = self.currentNode
        self.currentNode = newNode
        self.currentNode.next = prevNode

        self.totalStackIndexNumber += 1

    def pop(self):
        targetNode = self.currentNode
        self.currentNode = self.currentNode.next
        return targetNode

    def peek(self):
        return self.currentNode.data

    def popAll(self):
        while self.currentNode is not None:
            self.pop()

    def printAll(self):
        driveNode = self.currentNode

        while driveNode is not None:
            print (driveNode.data)
            driveNode = driveNode.next

s = VerySimpleStack(Node(0))
# s.push(Node(1))
# s.push(Node(2))
# s.push(Node(3))
# s.push(Node(4))
# print("peek : {}".format(s.peek()))
# print("print all stack : ")
# s.printAll()
# print("pop once!")
# s.pop()
# print("peek : {}".format(s.peek()))
# print("print all stack : ")
# s.printAll()
# print("pop once!")
# s.pop()
# print("peek : {}".format(s.peek()))
# print("print all stack : ")
# s.printAll()
# print("pop two times!")
# s.pop()
# s.pop()
# print("print all stack : ")
# s.printAll()
#
# s.push(Node(1))
# s.push(Node(2))
# s.push(Node(3))
# s.push(Node(4))
# s.push(Node(1))
# s.push(Node(2))
# s.push(Node(3))
# s.push(Node(4))
# print("print all stack after pushing a lot : ")
# s.printAll()
# print("print all stack after pop all : ")
# s.popAll()
# s.printAll()
# print("push three times!")
# s.push(Node(100))
# s.push(Node(1000))
# s.push(Node(10000))
# s.printAll()
# print("print all stack after pop all : ")
# s.popAll()
# s.printAll()
#

# orderedString = "ABCDEFG"
print("orderedString : {}".format(orderedString))

list = []
for i in orderedString:
    list.append(i)
print("list : {}".format(list))

# for i in orderedString:
for i in list:
    s.push(Node(i))

reverseString = []
while s.currentNode is not None:
    node = s.pop()
    reverseString.append(node.data)
print("reverseString : {}".format(reverseString))

# Q4. replace space with 20%
# Write a method to replace all whitespace in string with %20
# input "Mr John Smith   "
# Output "Mr%20John%20Smith"

whitespaceString = "Mr John Smith   "
answerString = whitespaceString.strip().replace(" ", "%20")
print(answerString)

# Q5. string compression
'''
Write a method to perform basic string compression using counts of repeated Characters.
If the compression string would not become smaller than the original string,
then return original string.

Input:aabccccaa
Output:a2b1c4a2
'''
# inputString = "aabccccaacccccddddddddddddddddddzzefffffaaasss"
inputString = "aabccccaa"
print("string before being compressed : {}".format(inputString))

# test
# repeat = 4
# c = "c"
# list = "ab"
# for _ in range(repeat):
#     list += c
# print("List : {}".format(list))

def compressString(string):
    finalOutput = ""
    buffer = ""
    repeatCount = 1

    for character in string:
        if finalOutput == "":
            finalOutput += character
            buffer += character
            print("final : {}".format(finalOutput))
            # it begins with 'a'
        else:
            # when continuous characters pattern is changed
            if buffer != character:
                finalOutput += str(repeatCount)
                buffer = character
                finalOutput += buffer
                repeatCount = 1
            # when characters pattern is keeping being continued
            else:
                repeatCount += 1
                buffer = character
    if repeatCount >= 1:
        finalOutput += str(repeatCount)

    return finalOutput

output = compressString(inputString)
print(output)






