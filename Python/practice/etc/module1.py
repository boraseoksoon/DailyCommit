#! path : /usr/bin/python
#! author : jss

def sum(a,b) :
    sum = a + b
    return sum


def safe_sum(a,b) :
    if type(a) != type(b) :
        print("these are not the same data type!")
    else :
        sum = a + b
        return sum

'''
print(safe_sum('a', 1))
print(safe_sum(1, 4))
print(sum(10, 10.4))
'''

if __name__ == "__main__":
    print(safe_sum('a', 1))
    print(safe_sum(1, 4))
    print(sum(10, 10.4))


