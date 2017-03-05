//: Playground - noun: a place where people can play

import UIKit

var str = "20170306 Simple Binary Search"

// already sorted array
let item = [1,2,3,4,10,15,20,33,44,55,67,78,89,100]

enum BinarySearchError : Error {
    case NotFound
}

func binarySearch(input:[Int], whatValue: Int) throws -> (Int, Bool) {
    var leftIndex = 0
    var rightIndex = input.count - 1
    var middleIndex = (leftIndex + rightIndex) / 2
    
    while leftIndex <= rightIndex {
        middleIndex = (leftIndex + rightIndex) / 2
        
        print("middleIndex : \(middleIndex), leftIdex : \(leftIndex), rightIndex : \(rightIndex)")
        
        if input[middleIndex] == whatValue {
            return (middleIndex, true)
        }
        
        else if input[middleIndex] < whatValue {
            leftIndex += 1
        }
        
        else if input[middleIndex] > whatValue {
            rightIndex -= -1
        }
    }
    
    throw BinarySearchError.NotFound
}

// you don't have to use try catch handling in this case.
do {
    var binarySearchTuple = try binarySearch(input: item, whatValue:20)
    
//    print(binarySearchTuple.0)         // index
//    print(binarySearchTuple.1)         // result flag : true or not
    
    let searchResult = binarySearchTuple.1
    
    if searchResult {
        let indexFound = binarySearchTuple.0
        print(item[indexFound])
    } else {
        print("binary search is failed!")
    }
    
} catch (BinarySearchError.NotFound) {
    print("BinarySearchError.NotFound error!")
} catch {
    print("general Error Caught!")
}


// flatmap use

let arrayOne = [0,1,2,3,4]
let arrayTwo = [5,6,7,8,9]
let arrayThree = [arrayOne, arrayTwo]

let flatMap = arrayThree.flatMap { array -> [Int] in
    return array.map({ (number) -> Int in
        return number * number // number
    })
}

print(flatMap)

let inputList: [[Int]] = [[1,2,3,4,5,6], [7,8,9,10,11,12]]
let flatmapResultList = inputList.flatMap({$0})
print(flatmapResultList)

for i in flatmapResultList {
    print(i)
}

// High-Order Function's Fun is Flatmap implementation!

// using for

var targetList = [Int]()
for i in inputList {
    for j in i {
        targetList.append(j)
    }
}

print(targetList)

// flatten function
let a = [[1,2,3],[4,5,6],[7,8,9]]
let b = a.joined()
print(b)

for i in b {
    print("joined(previous:flatten) : \(i)")
}

