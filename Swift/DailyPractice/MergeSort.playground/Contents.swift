//: Playground - noun: a place where people can play

import UIKit

var str = "Today's algorithm for fun : merge sort"

// merge sort
func mergeSort<T: Comparable>(targetArray: [T]) -> [T] {
    guard targetArray.count > 1 else {
        return targetArray
    }
    
    let leftArray = Array<T>(targetArray[0..<targetArray.count/2])
    let rightArray = Array<T>(targetArray[targetArray.count/2..<targetArray.count])
    
    return merge(leftArray: mergeSort(targetArray: leftArray), rightArray: mergeSort(targetArray: rightArray))
}

// sub-merge in.
func merge<T: Comparable>(leftArray: [T], rightArray: [T]) -> [T] {
    var mergedArray = [T]()
    var mutableLeftArray = leftArray
    var mutableRightArray = rightArray
    
    while mutableLeftArray.count > 0 && mutableRightArray.count > 0 {
        if mutableLeftArray.first! > mutableRightArray.first! {
            mergedArray.append(mutableRightArray.removeFirst())
        } else {
            mergedArray.append(mutableLeftArray.removeFirst())
        }
    }
    
    return mergedArray + mutableLeftArray + mutableRightArray
}

let arr = Array(0...10).map { _ in UInt(arc4random_uniform(10000)) + 1 }
print("merge sort before : \(arr)")
let sortedArr = mergeSort(targetArray: arr)
print("merge sort after : \(sortedArr)")