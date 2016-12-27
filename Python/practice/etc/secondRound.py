# filter
def filter_positive(list) :
    localList = []
    for l in list :
        if l > 0 :
            localList.append(l)

    return localList

test_list = [-1,-2,-3,-4,-5,1,2,3,4,5]
test_list.sort()
print test_list

result = filter_positive(test_list)
print   "result1 is : " + str(result)

def positive(i) :
    return i < 0

result = filter(positive, test_list)
print   "result2 is : " + str(result)

# it takes runtime error because of syntax 'return' error =>
# result = filter(lambda x : return x < 0, test_list)

result = filter(lambda x : x < 0, test_list)
print   "result3 is : " + str(result)

filterArg = lambda a : a % 2 == 0

result = filter(filterArg, test_list)
print   "result4 is : " + str(result)

# map
def three_times(list) :
    localList = []
    for number in list :
        localList.append(number * 3)
    return localList

list = three_times([1,2,3,4])
print "list : " + str(list)

def two_times(x) :
    return x * 3

result = map(two_times, [1,2,3,4])
print   "result is " + str(result)

result = map(lambda  a : a * 2, [1,2,3,4])
print   "result is " + str(result)

# reduce



# how to get total sum on 3 and 5 of multiple
def getMultipleSumWithThreeAndFive(x):
    sum = 0

    for l in x :
        if l % 3 == 0 or l % 5 == 0:
            sum += l
    return sum

result = getMultipleSumWithThreeAndFive(range(1,11))
print   "result is " + str(result)




