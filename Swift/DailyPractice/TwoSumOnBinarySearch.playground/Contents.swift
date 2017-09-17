//: Playground - noun: a place where people can play

import UIKit

var str = "Solving TwoSum Problem in Binary Search and Hashmap"

//+//The Two-Sum problem asks you to find all the pair of two integers in an unsorted array that sums up to a given n. So let’s look at the following array as an example:
//+//
//+//[4, 2, 5, 2, 9, -3]
//+//
//+//Let’s say the sum we’re looking for is 6. Well the program should return [4, 2] [9, -3] because each pair adds to 6.
//+
//+// * Let's say duplication two sum pair elements are not allowed as answer.
//+
//+// let's say two-sum value we're looking for is 4.

let inputList = [4,2,-5,2,9,-3,3,1]

//for i in 0..<inputList.count {
//  for j in 0..<inputList.count where i != j {
//    print("i : \(i), j : \(j)")
//  }
//}

// Brute Force Way for O(N^2) complexity prototype.
func twoSum(_ twoSum: Int, inputList: [Int]) -> [[Int]]? {
  var inputListMutable = inputList
  var outputList: [[Int]]? = [[Int]]()
  for index in stride(from: 0, to: inputListMutable.count, by: 1) {
    for subIndex in stride(from: index+1, to: inputListMutable.count, by: 1) {
      if inputListMutable[index] + inputListMutable[subIndex] == twoSum {
        outputList?.append([inputListMutable[index], inputListMutable[subIndex]])
        inputListMutable.remove(at: index)
        inputListMutable.remove(at: subIndex - 1)
        break
      }
    }
  }
  return outputList
}

//if case let outputList? = twoSum(7, inputList: inputList) {
//  outputList.forEach { answer in print(answer) }
//} else {
//  print("There is No Answer.")
//}

// TODO: Remove Duplication value, Duplication value is still found.
// Binary Search Way for Time Complexity O(nLog(n))

// let inputList = [4,2,-5,2,9,-3,3,1]
func binarySearch(_ searchValue: Int,
                  inList: [Int],
                  startIndex: Int,
                  endIndex: Int) -> (Int, Bool) {
  let middleIndex = (startIndex + endIndex) / 2
  if startIndex > endIndex { return (-1, false) }
  
  if searchValue > inList[middleIndex] {
    return binarySearch(searchValue, inList: inList, startIndex:middleIndex + 1 , endIndex: endIndex)
  } else if searchValue < inList[middleIndex] {
    return binarySearch(searchValue, inList: inList, startIndex:startIndex, endIndex: middleIndex - 1)
  } else {
    return (middleIndex, true)
  }
}
let sortedList = inputList.sorted()
let result = binarySearch(-5,
                          inList: sortedList,
                          startIndex:inputList.startIndex,
                          endIndex: inputList.count - 1)
// print(result)


func twoSum_BinarySearch(_ twoSum: Int, inputList: [Int]) -> [[Int]]? {
  var outputList: [[Int]]? = [[Int]]()

  for index in 0..<inputList.count {
    let compliment = twoSum - inputList [index]
    var mutableInputList = inputList
    mutableInputList.remove(at: index)
    
    let tuple = binarySearch(compliment,
                             inList:mutableInputList,
                             startIndex: mutableInputList.startIndex,
                             endIndex: mutableInputList.count - 1)
    
    if (tuple.1) {
      mutableInputList.remove(at:tuple.0)
      outputList?.append([inputList[index], inputList[tuple.0]])
    }
  }

  return outputList
}

// let inputList = [4,2,-5,2,9,-3,3,1]
//if case let outputList? = twoSum_BinarySearch(4, inputList: inputList) {
//  outputList.forEach { answer in print(answer) }
//} else {
//  print("There is No Answer.")
//}

// Pointing Way for Time Complexity O(N)
func twoSum_Pointer(_ twoSum: Int, inputList: [Int]) -> [[Int]]? {
  var outputList: [[Int]]? = [[Int]]()
  
  var startIndex = inputList.startIndex
  var endIndex = inputList.count - 1
  
  while startIndex > endIndex {
    if inputList[startIndex] + inputList[endIndex] > twoSum {
      endIndex -= 1
    } else if inputList[startIndex] + inputList[endIndex] < twoSum {
      startIndex += 1
    } else {
      print(inputList[startIndex], inputList[endIndex])
      outputList?.append([inputList[startIndex], inputList[endIndex]])
    }
  }
  
  return outputList
}

// let inputList = [4,2,-5,2,9,-3,3,1]
if case let outputList? = twoSum_Pointer(4, inputList: inputList.sorted()) {
  outputList.forEach { answer in print(answer) }
} else {
  print("There is No Answer.")
}

// HashMap Way for Time Complexity O(1)
func twoSum_Hash(_ twoSum: Int, inputList: [Int]) -> [[Int]]? {
  return [[2,3]]
}
