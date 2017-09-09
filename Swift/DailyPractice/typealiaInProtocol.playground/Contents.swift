//: Playground - noun: a place where people can play

import UIKit

var str = "protocol with associative type examples modifed if needed to study."
// reference : https://www.natashatherobot.com/swift-what-are-protocols-with-associated-types/

// Common
protocol Initializable {
  init()
}

// power types
struct 🌧: Initializable {}
struct 🌩: Initializable {}
struct 🔥: Initializable {}

// after  PAT(protocol with associative type)
// No subclassing is needed, therefore, Value type can be used. subclassing problem is no more.

protocol PowerTrait {
  associatedtype Power: Initializable
  func attack() -> Power
}

extension PowerTrait {
  func attack() -> Power {
    return Power()
  }
}

struct Pikachu: PowerTrait {
  typealias Power = 🌩
}

struct Vaporeon: PowerTrait {
  typealias Power = 🌧
  
  func attack() -> 🌧 {
    // custom attack logic
    return 🌧()
  }
}

let vaporeon = Vaporeon()
vaporeon.attack() //🌧

let pikachu = Pikachu()
pikachu.attack() //🌩


// before PAT(protocol with associative type)
/*
// Pokemon subclass
// Each Pokemon has a different Power,
// so Power is a generic
class Pokemon<Power: Initializable> {
  func attack() -> Power {
    return Power()
  }
}

class Pikachu: Pokemon<🌩> {}
class Vaporeon: Pokemon<🌧> {}


let pikachu = Pikachu()
pikachu.attack() // 🌩

let vaporeon = Vaporeon()
vaporeon.attack() // 🌧
*/


// reference : http://minsone.github.io/mac/ios/swift-generics-summary

protocol Container {
  associatedtype ItemType
  mutating func append(item: ItemType)
  var count: Int { get }
  subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container {
  // conformance to the Container protocol
  typealias ItemType = Int
  
  // original IntStack implementation
  var items = [ItemType]()
  mutating func push(item: ItemType) {
    items.append(item)
  }
  mutating func pop() -> ItemType {
    return items.removeLast()
  }
  
  mutating func append(item: ItemType) {
    self.push(item: item)
  }
  var count: ItemType {
    return items.count
  }
  subscript(i: ItemType) -> ItemType {
    return items[i]
  }
}

var intStack = IntStack(items: [1,2,3,4,5])
intStack.append(item: 10)
intStack.pop()
