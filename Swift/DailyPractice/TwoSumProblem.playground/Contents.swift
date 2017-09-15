//: Playground - noun: a place where people can play

import UIKit

var str = "2017/09/15 Two sum Problem"

//The Two-Sum problem asks you to find all the pair of two integers in an unsorted array that sums up to a given n. So let’s look at the following array as an example:
//
//[4, 2, 5, 2, 9, -3]
//
//Let’s say the sum we’re looking for is 6. Well the program should return [4, 2] [9, -3] because each pair adds to 6.

// * Let's say duplication two sum pair elements are not allowed as answer.

// let's say two-sum value we're looking for is 4.

// O(N^2) complexity prototype.
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

if case let outputList? = twoSum(3, inputList: [4,2,-5,2,9,-3,3,1]) {
  outputList.forEach { answer in print(answer) }
} else {
  print("There is No Answer.") // it should be [[4,2], [-5,9]]
}
