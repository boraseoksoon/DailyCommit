#! /bin/usr/python
# do generator in Python.


'''
def generator(n):
    i = 0
    while i < n:
        yield i
        i += 1

for x in generator(5):
	print x
'''


# 1. still list 
'''
def square_numbers(nums):
    result = []
    for i in nums:
        result.append(i * i)
    return result

my_nums = square_numbers([1, 2, 3, 4, 5])

print my_nums
'''

# 2. generator object created.
def square_numbers(nums):
    for i in nums:
        yield i * i

my_nums = square_numbers([1, 2, 3, 4, 5])  #1

print my_nums

# 3. generator object with using next()

def square_number(nums):
	for i in nums : 
		yield i * i

my_nums = square_number([1,2,3,4,5])


print	next(my_nums)
print	next(my_nums)
print	next(my_nums)
print	next(my_nums)
print	next(my_nums)

