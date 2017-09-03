//: Playground - noun: a place where people can play

import UIKit

var str = "O(N^2) Sorting Algorithm Series for fun"

enum SortError: Error {
  case EmptyInputArray(msg: String)
}

func swap<T>(target: inout T, source: inout T) -> Void {
  let temp = target
  target = source
  source = temp
}

var inputArray = Array(0..<30).map({ transform  in return Int(arc4random_uniform(1000 + 1)) })

// insertion sort

// bubble sort
func bubbleSort<T: Comparable>(inputArray: [T]) throws -> [T] {
  guard !inputArray.isEmpty else {
    throw SortError.EmptyInputArray(msg: "input array is empty!")
  }
  
  var arrayToSort = inputArray
  for (index, _) in arrayToSort.enumerated() {
    for subIndex in 0 ..< arrayToSort.count - index {
      guard subIndex < arrayToSort.count - 1 else {
        continue
      }
      if arrayToSort[subIndex] > arrayToSort[subIndex+1] {
        swap(target: &arrayToSort[subIndex+1], source: &arrayToSort[subIndex])
      }
    }
  }
  let sortedArray = arrayToSort
  return sortedArray
}

// selection sort
func selectionSort<T: Comparable>(inputArray: [T]) throws -> [T] {
  guard !inputArray.isEmpty else {
    throw SortError.EmptyInputArray(msg: "input array is empty!")
  }
  
  var arrayToSort = inputArray
  
  for (index, _) in arrayToSort.enumerated() {
    for subIndex in index+1 ..< arrayToSort.count {
      if arrayToSort[subIndex] <= arrayToSort[index] {
        swap(target: &arrayToSort[index], source: &arrayToSort[subIndex])
      }
    }
  }
  
  let sortedArray = arrayToSort
  return sortedArray
}

let sortedArray = try! selectionSort(inputArray: inputArray)
let sortedArray2 = try! bubbleSort(inputArray: inputArray)