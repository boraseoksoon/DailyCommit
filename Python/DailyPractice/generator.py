#!/usr/bin/env python
# -*- coding: utf-8 -*-


# iterator
s = "string"
iterator = iter(s)
# print next(iterator)
# print next(iterator)
# print next(iterator)
# print next(iterator)
# print next(iterator)
# print next(iterator)

iterator2 = iter(s)

for s in iterator2:
    print s



''' # chapter 1 '''
print "start"
def generator(n):
    i = 0
    while i < n:
        yield i
        i += 1

for x in generator(5):
    print x

# list comprehension
[ i for i in xrange(10) if i % 2 ]

# generator expression
generator = ( i for i in xrange(10) if i % 2 == 0)

for i in generator:
    print i


''' # chapter 2 '''
print("##### ordinary function")

def ordinary_square_numbers(nums):
    result = []
    for i in nums:
        result.append(i * i)
    return result

my_nums = ordinary_square_numbers([1, 2, 3, 4, 5])

print my_nums


print "##### generator function"
# generator function
def generator_square_numbers(nums):
    for i in nums:
        yield i * i

my_nums = generator_square_numbers([1, 2, 3, 4, 5])

print my_nums

print("##### generator function next")

print next(my_nums)
print next(my_nums)
print next(my_nums)
print next(my_nums)
print next(my_nums)

#print next(my_nums)
'''
 Traceback (most recent call last):
  File "/Users/seoksoonjang/PycharmProjects/train/train.py", line 53, in <module>
    print next(my_nums)
StopIteration

'''

print "##### list comprehension"
# list comprehension
my_nums = [x*x for x in [1, 2, 3, 4, 5]]

print my_nums

for num in my_nums:
    print num

my_nums = (x*x for x in list(range(1, 10)))

print my_nums

for num in my_nums:
    print num
