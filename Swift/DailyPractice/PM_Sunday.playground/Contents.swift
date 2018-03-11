//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// identifier pattern
let f1 = 10
let f2 = 10
if case f1 = f2 {
  print("f1 : \(f1)")
}

// optional binding pattern
let opt_f1: Int? = 200
if case let f1? = opt_f1 {
  print("f1 : ", f1)
}

if let f1 = opt_f1 as? Int, 0...300 ~= f1 {
  print("if let f1 = opt_f1 as? Int, 0...300 ~= f1 condition is true")
}

let opt_f2: Int? = 200
if case let opt_f2? = opt_f1 {
  print("binded away!")
}

// value binding pattern
if case let x = f1, x > 5 {
  print("x : \(x)")
}

// tuple pattenr
let t1 = (10, 20)
if case (_, 25...30) = t1 {
  print("true!")
}

if case (let x, let y) = t1, x + x == y {
  print("\(x) : \(y)")
}

if case let(x, y) = t1, x + x == y {
  print("\(x) : \(y)")
}

// enum-case pattern
enum Either {
  case Left(Int, Int)
  case Right(Double, Double)
}

let left = Either.Left(10, 20)

if case .Left = left {
  print("left is rigiht")
}

if case .Left(let x, let y) = left {
  print("\(x) : \(y)")
}

enum Direction {
  case east
  case west
  case north
  case south
  
  func description() -> String {
    switch self {
    case .east:
      return "east"
    case .west:
      return "west"
    case .north:
      return "north"
    case .south:
      return "south"
    }
  }
}

let east = Direction.east
east.description()

if case .east = east {
  print("east!")
}

//if case f1 = east {
//  print("east! : \(type(of: east))")
//}


// expression pattern
if 1...100 ~= f1 {
  print("f1 is in 1...100 range")
}

let f3 = -1
let range = 0...100

if case range = f1 {
  print("f1 is in 1...100 range 2")
}

// where with for
let list = [1,2,3,4,5,6,7,8]

for l in list where l % 2 == 0 {
  print("l : \(l)")
}

print("****************************************")

func fizzbuzzOutputer(givenNumber: Int) -> String {
  switch (givenNumber % 3 == 0, givenNumber % 5 == 0) {
  case (true, true):
    return "FizzBuzz!"
  case (true, false):
    return "Fizz!"
  case (false, true):
    return "Buzz!"
  default:
    return ""
  }
}

// fizzbuzz in switch
let fizzbuzzOutputList = (1...100).map { fizzbuzzOutputer(givenNumber: $0) }

fizzbuzzOutputList


//let result = (1 ... 100).map { i -> String in
//  switch (i % 3 == 0, i % 5 == 0) {
//  case (true, true):
//    return "FizzBuzz"
//  case (true, false):
//    return "Fizz"
//  case (false, true):
//    return "Buzz"
//  default:
//    return "\(i)"
//  }
//}

let result = (1 ... 100).map { i -> String in
  switch (i % 3 == 0, i % 5 == 0) {
  case (true, true):
    return "FizzBuzz"
  case (true, false):
    return "Fizz"
  case (false, true):
    return "Buzz"
  default:
    return "\(i)"
  }
}

print(">>>>>>>>>>>>>>>> fizzbuzz result!")
for (index, string) in result.enumerated() {
  print("[\(index)]\(string)")
}


