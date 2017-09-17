//
//  main.swift
//  TwoSum
//
//  Created by Seoksoon Jang on 2017. 9. 17..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

let twoSumValue = 4
let inputList = [4,2,-5,2,9,-3,3,1,-9]

var str = "Solving TwoSum Problem in Total"

// Brute Force Way for O(N^2) complexity prototype.
func twoSum(_ twoSum: Int, inputList: [Int]) -> [[Int]]? {
  var outputList: [[Int]]? = [[Int]]()
  
  for index in 0..<inputList.count {
    guard index < inputList.count else { continue }
    for subIndex in index+1..<inputList.count {
      guard subIndex < inputList.count else { continue }
      if inputList[index] + inputList[subIndex] == twoSum {
        outputList?.append([inputList[index], inputList[subIndex]])
      }
    }
  }
  
  // return outputList
  var previous: [Int]?
  return outputList?.filter{
    if previous != nil {
      if previous! == $0 {
        return false
      }
    }
    previous = $0
    return true
  }
}

print("****** brute force *******")
if case let outputList? = twoSum(twoSumValue, inputList: inputList) {
  outputList.forEach { answer in print(answer) }
} else {
  print("There is No Answer.")
}


func binarySearch(_ searchValue: Int,
                  inList: [Int],
                  startIndex: Int,
                  endIndex: Int,
                  excludeIndex: Int? = nil) -> (Int, Bool) {
  let middleIndex = (startIndex + endIndex) / 2
  if startIndex > endIndex { return (-1, false) }                 // condition to terminate recursion.
  guard excludeIndex != middleIndex else { return (-1, false) }   // exclude self index.
  
  if searchValue > inList[middleIndex] {
    return binarySearch(searchValue,
                        inList: inList,
                        startIndex:middleIndex + 1,
                        endIndex: endIndex,
                        excludeIndex: excludeIndex)
  } else if searchValue < inList[middleIndex] {
    return binarySearch(searchValue,
                        inList: inList,
                        startIndex:startIndex,
                        endIndex: middleIndex - 1,
                        excludeIndex: excludeIndex)
  } else {
    return (middleIndex, true)
  }
}

let sortedList = inputList.sorted()
let result = binarySearch(4,
                          inList: sortedList,
                          startIndex:inputList.startIndex,
                          endIndex: inputList.count - 1)

func twoSum_BinarySearch(_ twoSum: Int, inputList: [Int]) -> [[Int]]? {
  var outputList: [[Int]]? = [[Int]]()
  var mutableInputList = inputList
  
  for index in 0..<mutableInputList.count {
    guard index < mutableInputList.count else { return outputList }
    let compliment = twoSum - mutableInputList[index]
    
    let tuple = binarySearch(compliment,
                             inList:mutableInputList,
                             startIndex: mutableInputList.startIndex,
                             endIndex: mutableInputList.count - 1,
                             excludeIndex: index)
    
    if (tuple.1) {
      outputList?.append([mutableInputList[index], mutableInputList[tuple.0]])
      mutableInputList.remove(at: index)
      if tuple.0 < index {
        mutableInputList.remove(at: tuple.0)
      } else {
        mutableInputList.remove(at: tuple.0 - 1)
      }
    }
  }
  return outputList
}

print("**** binary search ****")
if case let outputList? = twoSum_BinarySearch(twoSumValue, inputList: inputList.sorted()) {
  outputList.forEach { answer in print(answer) }
} else {
  print("There is No Answer.")
}


// Pointing Way for Time Complexity O(N)
func twoSum_Pointer(_ twoSum: Int, inputList: [Int]) -> [[Int]]? {
  var outputList: [[Int]]? = [[Int]]()
  var mutableInputList = inputList
  
  for _ in 0..<mutableInputList.count {
    var startIndex = mutableInputList.startIndex
    var endIndex = mutableInputList.count - 1
    
    while startIndex < endIndex {
      if mutableInputList[startIndex] + mutableInputList[endIndex] > twoSum {
        endIndex -= 1
      } else if mutableInputList[startIndex] + mutableInputList[endIndex] < twoSum {
        startIndex += 1
      } else {
        outputList?.append([mutableInputList[startIndex], mutableInputList[endIndex]])
        mutableInputList.remove(at: endIndex)
        mutableInputList.remove(at: startIndex)
        break
      }
    }
  }
  
  return outputList
}

print("******* pointer *******")
if case let outputList? = twoSum_Pointer(twoSumValue, inputList: inputList.sorted()) {
  outputList.forEach { answer in print(answer) }
} else {
  print("There is No Answer.")
}

