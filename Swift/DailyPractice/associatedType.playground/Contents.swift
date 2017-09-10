//: Playground - noun: a place where people can play

import UIKit

var str = "Associatedtype + Iterator"

protocol Container {
  associatedtype ItemType
  mutating func append(item: ItemType)
  var count: Int { get }
  subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container, Sequence {
  typealias ItemType = Int
  // original IntStack implementation
  var items = [Int]()
  mutating func push(item: Int) {
    items.append(item)
  }
  mutating func pop() -> Int {
    return items.removeLast()
  }
  // conformance to the Container protocol
  
  mutating func append(item: Int) {
    self.push(item: item)
  }
  var count: Int {
    return items.count
  }
  subscript(i: Int) -> Int {
    return items[i]
  }
  
  func makeIterator() -> IntStackIterator {
    return IntStackIterator(items: self.items, current: -1)
  }
}

struct IntStackIterator: IteratorProtocol {
  typealias ItemType = Int
  
  var items: [ItemType]
  var current: ItemType

  mutating func next() -> ItemType? {
    guard self.items.count - 1 > self.current else {
      self.current = -1
      return nil
    }
    self.current += 1
    return self.items[self.current]
  }
}

var intStack = IntStack(items: [1,2,3,4,5])
intStack.append(item: 6)
intStack.append(item: 7)

for i in intStack {
  print(i)
}


