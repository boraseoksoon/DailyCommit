//
//  main.swift
//  LinkedList
//
//  Created by Seoksoon Jang on 2017. 11. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

/**
 function for Unimplement representation
 */
internal func Unimplemented(_ fn: String = #function, file: StaticString = #file, line: UInt = #line) -> Never {
  #if os(Android)
    NSLog("\(fn) is not yet implemented. \(file):\(line)")
  #endif
  fatalError("\(fn) is not yet implemented", file: file, line: line)
}

var str = "Linked List"

class Node <T> {
  var next: Node?
  var value: T
  
  init(value: T, next: Node?) {
    self.value = value
    self.next = next
  }
}

enum error: Error {
  case simpleError
  case indexOutOfBoundError
  case notFound
}

class LinkedList <T: Equatable> {
  fileprivate var rootNode: Node<T>?
  fileprivate var nodeCount: Int
  
  init(rootNode: Node<T>) {
    self.rootNode = rootNode
    self.nodeCount = 1
  }
  
  private func lastNode(rootNode: Node<T>?) throws -> Node<T> {
    var runNode = rootNode
    while runNode != nil {
      if let nextNode = runNode?.next {
        runNode = nextNode
      } else {
        return runNode!
      }
    }
    return runNode!
  }
  
  private func createNode(with value: T) -> Node<T> {
    return Node(value: value, next: nil)
  }
}

extension LinkedList {
  public func add(value: T) -> Void {
    let newNode = self.createNode(with: value)
    
    if let rootNode = self.rootNode {
      let lastNode = try! self.lastNode(rootNode: rootNode)
      lastNode.next = newNode
    } else {
      self.rootNode = newNode
    }
    
    self.nodeCount += 1
  }
  
  public func get(at index: Int) throws -> T {
    guard index <= self.nodeCount - 1 else { throw error.indexOutOfBoundError }
    
    var runNode = self.rootNode
    
    var currentIndex: Int = 0
    while runNode != nil {
      if index == currentIndex {
        if let value = runNode?.value {
          return value
        } else {
          throw error.simpleError
        }
      }
      runNode = runNode?.next
      currentIndex += 1
    }
    
    if let value = runNode?.value {
      return value
    } else {
      throw error.simpleError
    }
  }
  
  public func delete(at index: Int) throws -> Bool {
    guard index <= self.nodeCount - 1 else { throw error.indexOutOfBoundError }
    
    if index == 0 {
      if self.rootNode?.next != nil {
        self.rootNode = self.rootNode?.next
        self.nodeCount -= 1
        return true
      } else {
        self.rootNode = nil
        self.nodeCount -= 1
        return true
      }
    } else if index != 0 {
      var runNode = self.rootNode
      var currentIndex: Int = 0
      
      while runNode != nil {
        if currentIndex == index - 1 {
          if let nodeToNext = runNode?.next?.next {
            runNode?.next = nodeToNext
            self.nodeCount -= 1
            return true
          } else {
            runNode?.next = nil
            self.nodeCount -= 1
            return true
          }
        }
        
        runNode = runNode?.next
        currentIndex += 1
      }
    }
    
    return false
  }
  
  typealias UpdateIndex = Int
  typealias Success = Bool
  public func update(at index: UpdateIndex, value: T) throws -> (T, UpdateIndex, Success)? {
    guard index <= self.nodeCount - 1 else { throw error.indexOutOfBoundError }
    
    var runNode = self.rootNode
    
    var currentIndex: Int = 0
    while runNode != nil {
      if index == currentIndex {
        runNode!.value = value
        return (value, currentIndex, true)
      }
      runNode = runNode?.next
      currentIndex += 1
    }
    
    return nil
  }
  
  typealias FoundIndex = Int
  public func search(forWhat searchValue: T) -> (FoundIndex , Bool) {
    var runNode = self.rootNode
    
    var currentIndex: Int = 0
    while runNode != nil {
      if searchValue == runNode?.value {
        return (currentIndex, true)
      }
      runNode = runNode?.next
      currentIndex += 1
    }
    
    return (-1, false)
  }
  
  public func printAll() -> Void {
    var runNode = rootNode
    while runNode != nil {
      print("runNode.value : ", runNode?.value as Any)
      runNode = runNode?.next
    }
  }
}

let linkedList = LinkedList<Int>(rootNode: Node<Int>(value: 10, next: nil))
linkedList.add(value: 11)
linkedList.add(value: 12)
linkedList.add(value: 13)
linkedList.add(value: 14)

let tuple = linkedList.search(forWhat: 15)
print(tuple.0)
print(tuple.1)

//print("nodeCount : ", linkedList.nodeCount)
//linkedList.printAll()
//if try! linkedList.delete(at: 0) {
//  // linkedList.printAll()
//}
//
//print("****")
//
//print("nodeCount : ", linkedList.nodeCount)
//linkedList.printAll()
//if try! linkedList.delete(at: 1) {
//  // linkedList.printAll()
//}
//
//print("****")
//
//print("nodeCount : ", linkedList.nodeCount)
//linkedList.printAll()
//if try! linkedList.delete(at: 2) {
//   // linkedList.printAll()
//}
//
//print("****")
//
//print("nodeCount : ", linkedList.nodeCount)
//linkedList.printAll()
//if try! linkedList.delete(at: 0) {
//   // linkedList.printAll()
//}
//
//print("****")
//
//print("nodeCout : ", linkedList.nodeCount)
//linkedList.printAll()
//if try! linkedList.delete(at: 0) {
//  linkedList.printAll()
//}

linkedList.printAll()


//if try! linkedList.delete(at: 2) {
//  linkedList.printAll()
//}

//for e in [try! linkedList.get(at: 1),
//          try! linkedList.get(at: 2),
//          try! linkedList.get(at: 3)] {
//  print(e)
//}
//
//print("linkedList.nodeCount : ", linkedList.nodeCount)
//
//let tuple = try! linkedList.update(at: 4, value: 100)
//let replacedValue = tuple?.0
//let index = tuple?.1
//let success = tuple?.2

