//: Playground - noun: a place where people can play

import UIKit

var str = "O(N^2) Sorting Algorithm Series for fun based on OOP Strategy Pattern!"

protocol Sortable {
  func sort(inputArray: [Int]) throws -> [Int]
}

extension Sortable {
  func swap<T>(target: inout T, source: inout T) -> Void {
    let temp = target
    target = source
    source = temp
  }
}

class SelectionSort: Sortable {
  typealias T = Int
  
  func sort(inputArray: [T]) throws -> [T] {
    guard !inputArray.isEmpty else {
      throw SortError.EmptyInputArray(msg: "input array is empty!")
    }
    
    var arrayToSort = inputArray
    
    for (index, _) in arrayToSort.enumerated() {
      for subIndex in index+1 ..< arrayToSort.count {
        if arrayToSort[subIndex] <= arrayToSort[index] {
          self.swap(target: &arrayToSort[index], source: &arrayToSort[subIndex])
        }
      }
    }
    
    let sortedArray = arrayToSort
    return sortedArray
  }
}

class BubbleSort: Sortable {
  typealias T = Int
  
  func sort(inputArray: [T]) throws -> [T] {
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
          self.swap(target: &arrayToSort[subIndex+1], source: &arrayToSort[subIndex])
        }
      }
    }
    let sortedArray = arrayToSort
    return sortedArray
  }
}

class InsertionSort: Sortable {
  typealias T = Int
  
  func sort(inputArray: [T]) throws -> [T] {
    guard !inputArray.isEmpty else {
      throw SortError.EmptyInputArray(msg: "input array is empty!")
    }
    
    var arrayToSort = inputArray
    
    for (index, _) in inputArray.enumerated() {
      for subIndex in stride(from: index+1, to: 0, by: -1) {
        guard subIndex < arrayToSort.count else {
          continue
        }
        
        if arrayToSort[subIndex] < arrayToSort[subIndex-1] {
          swap(target: &arrayToSort[subIndex], source: &arrayToSort[subIndex-1])
        } else {
          continue
        }
      }
    }
    
    let sortedArray = arrayToSort
    return sortedArray
  }
}

enum SortError: Error {
  case EmptyInputArray(msg: String)
}

class SortMachine <T>{
  typealias T = Int
  
  let arrayCountNumber: Int = 5
  
  private lazy var arrayToSort:[Int] = Array(0 ..< self.arrayCountNumber).map({ transform  in
    return Int(arc4random_uniform(1000 + 1))
  })
  
  var sortStrategy: Sortable? {
    willSet{
      print("\(sortStrategy) is gonna changed by \(newValue)")
    }
    didSet{
      // print("\(oldValue) is gonna changed by \(sortStrategy)")
    }
  }
  
  func printArrayToSort() {
    print(arrayToSort)
  }
  
  func doSort() -> [T] {
    guard sortStrategy != nil else {
      print("I do not arm sorting strategy!, so I'll return the array not sorted.")
      return arrayToSort
    }
    
    return try! sortStrategy!.sort(inputArray: arrayToSort)
  }
}

print("default sort try with no strategy!")
let sortMachine = SortMachine<Int>()
sortMachine.printArrayToSort()
let sortedArray = sortMachine.doSort()
print(sortedArray)

print("selection sort!")
let selectionSortStrategy = SelectionSort()
sortMachine.sortStrategy = selectionSortStrategy
let sortedArray2 = sortMachine.doSort()
print(sortedArray2)


print("bubble sort!")
let bubbleSortStrategy = BubbleSort()
sortMachine.sortStrategy = bubbleSortStrategy
let sortedArray3 = sortMachine.doSort()
print(sortedArray3)

print("Insertion sort!")
let insertionSortStrategy = InsertionSort()
sortMachine.sortStrategy = insertionSortStrategy
let sortedArray4 = sortMachine.doSort()
print(sortedArray4)