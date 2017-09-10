//: Playground - noun: a place where people can play

import UIKit

var switchStatement = "Switch more"

//if case let x = c as! Double {
//  print("test proceeds2!")
//}

// FizzBuzz solved by switch in Swift.

for i in 1 ... 100 {
  switch (i % 3, i % 5) {
  case (0, 0):
    print("Fizz Buzz")
  case (0, _):
    print("Fizz")
  case (_, 0):
    print("Buzz")
  default:
    print(i)
  }
}

for i in 1...100 {
  switch i {
    case let val where val % 3 == 0 && val % 5 == 0:
      print("FizzBuzz")
    case let val where val % 3 == 0:
      print("Fizz")
    case let val where val % 5 == 0:
      print("Buzz")
    case let val:
      print("value : \(val)")
      // it will stop fall through to default.
    default:
      print(i)
  }
}

let switchTest = 10

switch switchTest {
  case 1,2,3,4:
    print("in 1 section")
  case 5,6,7,8:
    print("in 2 section")
  case 9,10:
    print("in 3 section")
  default:
    print("in 4 section")
}

let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
  possibleIntegerValue = 1
case "2", "٢", "二", "๒":
  possibleIntegerValue = 2
case "3", "٣", "三", "๓":
  possibleIntegerValue = 3
case "4", "٤", "四", "๔":
  possibleIntegerValue = 4
default:
  break
}

if let integerValue = possibleIntegerValue {
  print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
  print("An integer value could not be found for \(numberSymbol).")
}

enum Result<T> {
  case success(T)
  case failure(Error)
}

var testVar = "hot cold warm"

// binding value in switch
switch testVar {
  case let value where value.hasPrefix("hot") && value.hasSuffix("cold"):
    print("got'cha! = \(value)")
  default:
    print("wrong?")
}

// enum
enum XYZ {
  case X
  case Y
  case Z
}

let x = XYZ.Z

switch x {
case .X, .Y where false:
  print("x or y")
case .Z:
  print("z")
default:
  print("default")
}