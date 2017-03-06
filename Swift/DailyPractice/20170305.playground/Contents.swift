//: Playground - noun: a place where people can play

import UIKit

var str = "20170306 Simple Binary Search"

// sorting

// 1. selection sort
/*
 * Worst-case performance : О(n2)
 * Best-case performance : О(n2)
 * Average performance : О(n2)
 * Worst-case space complexity	О(n) total, O(1) auxiliary
 */

var unsortedItem = [Int]()

for i in 0 ..< 100 {
    unsortedItem.append(Int(arc4random_uniform(200)))
}

//for i in unsortedItem {
//    print("i : \(i)")
//}

func swap(inputA: inout Int, inputB: inout Int) -> Void {
    let temp = inputA
    inputA = inputB
    inputB = temp
}

func selectionSort(targetList: [Int]) -> [Int] {
    var localList = targetList  // copy value type by default

    for i in 0 ..< localList.count - 1 {
        var minimum = i
        for j in i + 1 ..< localList.count {
            if localList[minimum] > localList[j] {
                minimum = j
            }
        }
        
        if i != minimum {
            swap(&localList[minimum], &localList[i])
        }
    }
    
    return localList
}

// 2. bubble sort
/*
 Runtime:
 
 Average: O(N^2)
 Worst: O(N^2)
 */

func bubbleSort(targetList: [Int]) -> [Int] {
    var localList = targetList
    
    for i in 0 ..< localList.count - 1 {
        let passes = (localList.count - 1) - i
        for j in 0 ..< passes {
            if localList[j] > localList[j+1] {
                swap(&localList[j], &localList[j+1])
            }
        }
    }
    return localList
}

// 3. insertion sort
/*
 Runtime
 
 Average : О(n^2)
 Worst : O(n^2)
 */
func insertionSort(targetList: [Int]) -> [Int] {
    var localList = targetList
    for i in 1 ..< localList.count {
        var j = i
        let temp = localList[j]
        while j > 0 && temp < localList[j - 1] {
            localList[j] = localList[j - 1]
            j -= 1
        }
        localList[j] = temp
    }
    return localList
}

// 4. shell sort
// 5. quick sort
// 6. merge sort
// 7. heap sort

// let sortedItem = selectionSort(targetList: unsortedItem)
let sortedItem = bubbleSort(targetList: unsortedItem)
// let sortedItem = insertionSort(targetList: unsortedItem)
print(sortedItem)

// already sorted array
let item = [1,2,3,4,10,15,20,33,44,55,67,78,89,100]

enum BinarySearchError : Error {
    case NotFound
}

// using iteration
func binarySearch(input:[Int], whatValue: Int) throws -> (Int, Bool) {
    var leftIndex = 0
    var rightIndex = input.count - 1

    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        
//        print("middleIndex : \(middleIndex), leftIdex : \(leftIndex), rightIndex : \(rightIndex)")
        
        if input[middleIndex] == whatValue {
            return (middleIndex, true)
        }
        
        else if input[middleIndex] < whatValue {
            leftIndex += 1
        }
        
        else if input[middleIndex] > whatValue {
            rightIndex = rightIndex - 1
        }
    }
    
    throw BinarySearchError.NotFound

}

// using recursion

// you don't have to use try catch handling in this case.
do {
    var binarySearchTuple = try binarySearch(input:sortedItem, whatValue:30)
    
//    print(binarySearchTuple.0)         // index
//    print(binarySearchTuple.1)         // result flag : true or not
    
    let searchResult = binarySearchTuple.1
    
    if searchResult {
        let indexFound = binarySearchTuple.0
        print("[binary search] At index[\(indexFound)], value(\(sortedItem[indexFound])) is found!")
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
// print(b)

//for i in b {
//    print("joined(previous:flatten) : \(i)")
//}

