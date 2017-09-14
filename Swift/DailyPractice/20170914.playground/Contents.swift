//: Playground - noun: a place where people can play

import UIKit

var str = "2017/09/14 Pattern Matching Again!"

/// Pattern Matching
// 1.Identifier pattern
var a = 10
switch a {
case 1:
  print("1!")
case 10 :
  print("10!")
default:
  print("default!")
}

// 2.Value-binding pattern

let value = (3,2)

switch value {
case (let a, let b) where a == b:
  print("a : \(a), b : \(b)")
case (let x, let y) where x > 10 && y > 10:
  print("a : \(x), b : \(y)")
default:
  print("default!")
}

let c = 10
let d = 11
if case let x = c, x == d {
  print("a is equal to b.")
}


var booleanA = true
var booleanB = false

if booleanA != booleanB, c != d, c > 5, value == (3, 2) {
  print("true!")
} else {
  print("false!")
}
// Value-Binding Pattern
if case booleanA = booleanB, c != d, c > 5, value == (3, 2) {
  print("\(booleanA)")  // false
} else {
  print("false!")
}
booleanA    // true

if case let b = booleanB, c != d, c > 5, value == (3, 2) {
  print("true! : \(b)")
} else {
  print("false!")
}

if case true = booleanA {
  print("true!")
}

if case let true = booleanA {
  print("true!")
}

// does not work.
//if case booleanA != booleanB, c != d, c > 5, value == (3, 2) {
//  print("true!")
//} else {
//  print("false!")
//}
//
//if case booleanA != booleanB, c != d, c > 5, value == (3, 2) {
//  print("true!")
//} else {
//  print("false!")
//}

let tuple = (10, 25)

switch tuple {
case (let a, let b) where a >= 10 && b < 30 && a != b :
  print("a : \(a), b : \(b)")
case let (a, b):
  print("a : \(a), b : \(b)")
default: ()
}

/// Tuple Pattern
let swift = "Swift!"
let price = 10000
let description = (3, 10)
let array = [String]()

let tupleContainingFour = (swift, price, kCFFileDescriptorReadCallBack, array)

switch tupleContainingFour {
// case (_, _, _, /* is NSArray */ is [String]):
//   print("hey!")
case (_, 1...9999, let description, is [String]):
  print("yo! : \(description)")
default: ()
}

/// Enumeration Case Pattern
enum Either {
  case Up(Int, Int)
  case Down(Double, Double)
}

extension Either {
  var selfTitle: String {
    switch self {
    case let .Up(_, _): return "up"
    case .Down(let x, let y): return "down"
    }
  }
}

let up = Either.Up(10, 20)

// does not work.
//if case up = .Up {
//  print("Up")
//}

if case .Up = up {
  print("Up")
}

// does not work.
//if case let up = .Up {
//  print("Up")
//}

if case let .Up = up {
  print("Up")
}

if case .Up(let x, _) = up, x < 100 {
  print("x: \(x)")
}

enum Test {
  case A(Int, Int)
}

let test = Test.A(10, 20)
if case .A(let x, _) = test, x < 5 {
  print("\(test)")
} else {
  print("false! ")
}

// Optional Pattern
let optionalValueTuple: (Int?, Int?) = (100, 200) // (Optional(100), Optional(200))

if case let (x?, y?) = optionalValueTuple  {
  print("x: \(x), y: \(y)")
}


let optionalTupleTest: (Int?, Int) = (100, 1000)

if case let (x?, y) = optionalTupleTest, y == x * 10{
  print("true! : \(x)")
} else {
  print("false!")
}

var optionalString: String? = "??"

if case let o? = optionalString {
  print(o)  // "??"
}

if case let o = optionalString {
  print(o)  // Optional("??")
}






/// Type-Casting Pattern
var typeCastingValue: Any = 100

switch typeCastingValue {
case is Int: print("value is Int")
// case let x as Int: print("value is Int")
case let x as Double: print("\(x) is Double")
default: ()
}

if case is Int = typeCastingValue {
  print("value is Int")
}

typeCastingValue = 100.0

if case let x as Double = typeCastingValue {
  print("\(x) is Double")
}

if typeCastingValue is Double {
  print("\(typeCastingValue) is Double")
}

let typeCastingValue2: Double?
typeCastingValue2 = 1000.0

if let x = typeCastingValue2 {
  if x is Double {
    print("\(x) is Double")
  }
}

/// Expression Pattern
let point2 = (1, 2)

switch point2 {
case (0, 0):
  print("(0, 0) is at the origin.")
case (-2...2, -2...2):
  print("(\(point.0), \(point.1)) is near the origin.")
default:
  print("The point is at (\(point.0), \(point.1)).")
}

