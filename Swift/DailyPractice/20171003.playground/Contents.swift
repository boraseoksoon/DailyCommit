//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Boxing
class Some<Base> {
  var value: Base? = nil
}

// extension Some where Base :
extension Some where Base: Collection {
  var test: String {
    return "test is good"
  }
}

let some = Some<Array<String>>()
print(some.test)
some.value?.append("test")
//some.value?.append(1) // Error
//some.value?.append(2) // Error
//some.value?.append(3) // Error

// Basic Inheritance
class Fruit {
  private (set) lazy var _name: String = "name : \(self)"
  var name: String {
    get {
      return _name
    }
    set {
      _name = "name : \(self)"
    }
  }
}

class Apple: Fruit {
  private (set) lazy var _description: String = "description : \(self)"
  var description: String {
    get {
      return _description
    }
    set {
      _description = "description : \(self)"
    }
  }
}

let apple = Apple()
print(apple.description)
print(apple.name)

// Equatable
struct Country {
  let name: String
  let capital: String
  var visited: Bool
}

let canada = Country(name: "Canada", capital: "Ottawa", visited: true)
let australia = Country(name: "Australia", capital: "Canberra", visited: false)
let korea = Country(name: "Korea", capital: "Seoul", visited: false)
let usa = Country(name: "USA", capital: "Washington", visited: false)
let japan = Country(name: "Japan", capital: "Tokyo", visited: false)
let china = Country(name: "China", capital: "Beijing", visited: false)
let france = Country(name: "France", capital: "Paris", visited: false)
let belgium = Country(name: "Belgium", capital: "Brussels", visited: false)
let brazil = Country(name: "Brazil", capital: "Brasilia", visited: false)
let uk = Country(name: "UK", capital: "London", visited: false)

let bucketList = [australia,canada, korea, usa, japan, china, france, belgium, brazil, uk]

let object = canada
let containsObject = bucketList.contains { (country) -> Bool in
  return country.name == object.name &&
    country.capital == object.capital &&
    country.visited == object.visited
}

print(containsObject)

extension Country: Equatable {
  static func == (lhs: Country, rhs: Country) -> Bool {
    return lhs.name == rhs.name &&
      lhs.capital == rhs.capital &&
      lhs.visited == rhs.visited
  }
}

let visited = Country(name: "Australia", capital: "Canberra", visited: true)
let unvisited = Country(name: "Australia", capital: "Canberra", visited: false)

visited == australia       // false
unvisited == australia     // true

bucketList.contains(canada)

let sortedBucket = bucketList.sorted { $0.name < $1.name }

// let sortedBucket = bucketList.sorted(by: { $0.name < $1.name } )

for (i,c) in sortedBucket.enumerated() {
  print(i, c)
}

// Comparable
extension Country: Comparable {
//  static func == (lhs: Country, rhs: Country) -> Bool {
//    return lhs.name == rhs.name &&
//      lhs.capital == rhs.capital &&
//      lhs.visited == rhs.visited
//  }
  
  static func < (lhs: Country, rhs: Country) -> Bool {
    return lhs.name < rhs.name ||
      (lhs.name == rhs.name && lhs.capital < rhs.capital) ||
      (lhs.name == rhs.name && lhs.capital == rhs.capital && rhs.visited)
  }
}

bucketList.sorted()


// Hashable
extension Country: Hashable {
  var hashValue: Int {
    return name.hashValue ^ capital.hashValue ^ visited.hashValue
  }
}

// Set
let destinations: Set = [belgium,canada,brazil]
let europe: Set = [belgium,france,uk]
destinations.intersection(europe)  // belgium

// Dictionary
let counts = [uk: 1000, france: 2000]
counts[uk]  // 1000



// Currying
func add1(_ x: Int, _ y: Int) -> Int {
  return x + y
}

/// Currying Level 1
func add2(_ x : Int) -> (Int) -> Int {
  return { y in return x + y }
}

add1(1,2)
add2(1)(2)


func multiple(_ x: Int, _ y: Int) -> Int {
  return x * y
}

func multipleCurrying(_ x: Int) -> (Int) -> Int {
  return { y in return x * y }
}

multiple(10, 20)
multipleCurrying(10)(20)
