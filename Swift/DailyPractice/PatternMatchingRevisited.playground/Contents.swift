//: Playground - noun: a place where people can play

import UIKit

var introductionStr = "Pattern Matching Revisited, referrence : http://wiki.yainoma.com/doku.php?id=develop:ios:swift:pattern_matching"

/// Wildcard Pattern
var num = 2
for _ in 1...3 {
    num *= 2
}

// for optional check
// let str: String? = nil
let str: String? = "??"

switch str {
    case _? : print("optional")
    case nil: print("nil")
}

//switch str! {
//    case nil: print("nil")
//    default: print("default!")
//}

/// Identifier Pattern

let value = 10

switch value {
    case 1: print("1")
    case 10: print("10")
    default: print("Not matched")
}

/// Value-Binding Pattern
let point = (3, 2)

switch point {
    case let (x, y):
        print("The point is at (\(x), \(y)).")
    case (let x, let y) where x > 10 && y > 10:
        print("The point is at (\(x), \(y)).")
}

let a = 10
let b = 10
if case let x = b, x == a {
    print("a is equal to b.")
}

/// Tuple Pattern
let title = "swift"
let description: String? = "description"
// let description: String! = "description"
let price = 10000
let other: AnyObject? = NSArray()
let book = (title, description, price, other)

switch book {
    case ("swift", _?, let price, is NSArray): print(price)
    default: ()
}

if case ("swift", _?, let price, is NSArray) = book {
    print(price)
} else {
    print("not matched!")
}

/// Enumeration Case Pattern
enum Either {
    case Up(Int, Int)
    case Down(Double, Double)
}

extension Either {
    var eitherTitle: String {
        switch self {
            case let .Up(_, _): return "up"
            case .Down(let x, let y): return "down"
        }
    }
}

let up = Either.Up(10, 100)
print(up.eitherTitle)

if case .Up = up {
    print("Up")
}

if case .Up(let x, _) = up, x < 100 {
    print("x: \(x)")
}


/// Optional Pattern
let optionalValueTuple: (Int?, Int?) = (100, 200) // (Optional(100), Optional(200))

if case let (x?, y?) = optionalValueTuple  {
    print("x: \(x), y: \(y)")
}


let optionalTuple: (Int, Int)? = (100, 200) // Optional((100, 200))

if case let (x, y)? = optionalTuple {
    print("x: \(x), y: \(y)")
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
let point = (1, 2)

switch point {
    case (0, 0):
        print("(0, 0) is at the origin.")
    case (-2...2, -2...2):
        print("(\(point.0), \(point.1)) is near the origin.")
    default:
        print("The point is at (\(point.0), \(point.1)).")
}

