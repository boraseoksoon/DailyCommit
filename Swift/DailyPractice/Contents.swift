//: Playground - noun: a place where people can play

import UIKit

var str = "Today's algorithm for fun : merge sort"

// merge sort
func mergeSort (targetArray: [Int]) -> [Int] {
    guard targetArray.count > 1 else {
        return targetArray
    }
    
    let leftArray = Array(targetArray[0..<targetArray.count/2])
    let rightArray = Array(targetArray[targetArray.count/2..<targetArray.count])
    
    return merge(left: mergeSort(targetArray: leftArray), right: mergeSort(targetArray: rightArray))
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var mergedArray = [Int]()
    var mutableLeft = left
    var mutableRight = right
    
    while mutableLeft.count > 0 && mutableRight.count > 0 {
        if mutableLeft.first! > mutableRight.first! {
            mergedArray.append(mutableRight.removeFirst())
        } else {
            mergedArray.append(mutableLeft.removeFirst())
        }
    }
    
    return mergedArray + mutableLeft + mutableRight
}

let arr = Array(0...10).map { _ in Int(arc4random_uniform(10000)) + 1 }
print("merge sort before : \(arr)")
let sortedArr = mergeSort(targetArray: arr)
print("merge sort after : \(sortedArr)")
