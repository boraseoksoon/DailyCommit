//: Playground - noun: a place where people can play

import UIKit

var str = "Swift Fun Algorithms"

print("***********************")
print("/****** FizzBuzz *****/")
print("***********************")

/// #1: FizzBuzz
let list = Array(1...100)

for i in list {
    if i % 15 == 0 {
        print("\(i) : FizzBuzz")
    } else if i % 3 == 0 {
        print("\(i) : Fizz")
    } else if i % 5 == 0 {
        print("\(i) : Buzz")
    }
}

/// #2: Binary Search

print("****************************")
print("/****** Binary Search *****/")
print("****************************")

print("**** creation test list ****")
// creation test list
let randomArray = Array(0...1000).map { _ in Int(arc4random_uniform(1000) + 1) }
let randomSortedArray = randomArray.sorted(by: { $0 < $1 })

// bruteForceSearch(Time Complexity O(n))
func bruteForceSearch(searchValue: Int, inList: [Int]) -> Bool {
    for i in inList {
        if searchValue == i {
            return true
        }
    }
    return false
}

print("**** do brute force search... ****")

if bruteForceSearch(searchValue: 100, inList: randomArray) {
    print("bruteForceSearch : Found!")
} else {
    print("bruteForceSearch : Failure!")
}

//  binarySearch(Time Complexity O(Log(n))), However, before using binary search, it should be sorted.
// v. iteration
func iterationBinarySearch(searchValue: Int, inList: [Int]) -> Bool {
    var beginIndex = 0
    var midIndex = inList.count / 2
    var endIndex = inList.count - 1
    
    while beginIndex <= endIndex {
        if searchValue == inList[midIndex] {
            return true
        } else if searchValue > inList[midIndex] {
            beginIndex = midIndex + 1
            midIndex = (endIndex - beginIndex) / 2 + beginIndex
        } else if searchValue < inList[midIndex] {
            endIndex = midIndex - 1
            midIndex = endIndex / 2
        }
    }
    
    return false
    
}

print("**** do iteration binary search... ****")
if iterationBinarySearch(searchValue: 100, inList: randomSortedArray) {
    print("found!")
} else {
    print("NOT found!")
}

// v. recursion
func recursiveBinarySearch(searchValue: Int,
                           beginIndex: Int,
                           endIndex: Int,
                           inList: [Int]) -> Int {
    let midIndex = (beginIndex + endIndex) / 2
    let midValue = inList[midIndex]
    
    if (beginIndex > endIndex) {
        return -1
    }
    
    if searchValue == midValue {
        return midIndex
    } else if searchValue > midValue {
        return recursiveBinarySearch(searchValue: searchValue,
                                     beginIndex:midIndex + 1,
                                     endIndex: endIndex,
                                     inList: inList)
    } else if searchValue < midValue {
        return recursiveBinarySearch(searchValue: searchValue,
                                     beginIndex:beginIndex,
                                     endIndex: midIndex - 1,
                                     inList: inList)
    }
    
    return -1
}

print("**** do recursive binary search... ****")
let foundMidIndex = recursiveBinarySearch(searchValue: 100,
                                          beginIndex: 0,
                                          endIndex: randomSortedArray.count - 1,
                                          inList: randomSortedArray)

if (foundMidIndex != -1) {
    print("Found!")
    print("\(randomSortedArray[foundMidIndex]) is at \(foundMidIndex) index")
    print("randomSortedArray[\(foundMidIndex)] => \(randomSortedArray[foundMidIndex])")
} else {
    print("Not Found!")
}

/// #3: Factorial + Recursion :
print("************************************")
print("/****** Factorial + Recursion *****/")
print("************************************")

let factorialLevel = 10
// factorial? => 5! => 5 * 4 * 3 * 2 * 1 => 120

// using high order function.
Array(1...factorialLevel).reduce(1, { $0 * $1 })

// iteration version
func iterationFactorial(level: Int) -> Int {
    var sum = 1
    
    for i in 1...level {
        sum *= i
    }

    return sum
}
iterationFactorial(level: factorialLevel)

// recursion version
func recursiveFactorial(level: Int) -> Int {
    if level == 1 {
        return 1
    } else {
        return level * recursiveFactorial(level: level - 1)
    }
}
recursiveFactorial(level: factorialLevel)

/// #4: Common name in array :


/// #5: Reverse every words :


/// #6: Fibonnaci sequence :


/// #7: Wrapping an array :


/// #8: Map, filter, reduce(it is done) :


/// #9: Recursive search through binary tree :


/// #10: Reverse Linked-List :


/// #11: Swift Retain Cycle :


/// #12: Swift Closure Reference Cycle :


/// #13: Draw circle using math


/// #14: Social media app :

/// #15: Counting Palindromes :




