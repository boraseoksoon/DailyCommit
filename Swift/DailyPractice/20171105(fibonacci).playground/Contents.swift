//: Playground - noun: a place where people can play

import UIKit

var str = "fun coding for 2017/11/05"

/// closure basic
func makeIncrementor(forIncrement amount: Int) -> ( () -> Int ) {
  /// this is free variable.
  var runningTotal = 0
  func incrementor() -> Int {
    // free variable captured.
    runningTotal += amount
    return runningTotal
  }
  return incrementor
}

let incrementorBy2 = makeIncrementor(forIncrement: 2)
incrementorBy2()
incrementorBy2()
incrementorBy2()

let incrementorBy7 = makeIncrementor(forIncrement: 7)
incrementorBy7()
incrementorBy7()
incrementorBy7()

incrementorBy2()

incrementorBy7()

func factorial(level: Int) -> Int {
  if level == 1 {
    return 1
  } else {
    return level * factorial(level: level - 1)
  }
}

factorial(level: 5)

/// 1*2*3*4*5 => 120

enum FibonacciError: Error { case outOfBounds }
func fibonacci(depth: Int) -> Int {
  if depth == 1 {
    return 1
  } else if depth == 2 {
    return 1
  } else {
    return fibonacci(depth: depth - 1) + fibonacci(depth: depth - 2)
  }
}

let result = fibonacci(depth: 6)


func fibonacci(level: Int,
               first: Int? = 0,
               second: Int? = 1) -> [Int] {
  if level == 0 { return [] }
  return [first! + second!] + fibonacci(level: level - 1, first: second!, second: first! + second!)
}

let fiboList = [0,1] + fibonacci(level: 7)

/// Fibonacci sequnce using iteration.
func fibonacci(n: Int) -> [Int] {
  assert(n > 1)
  
  var array = [0, 1]
  
  while array.count < n {
    array.append(array[array.count - 1] + array[array.count - 2])
  }
  return array
}

let fiboList0 = fibonacci(level: 5)
fiboList0

func fibonacciIteration(level: Int) throws -> [Int] {
  guard level > 0 else { throw FibonacciError.outOfBounds }
  
  var fiboList = [Int]()
  var initialValue = 1
  fiboList.append(initialValue)

  if level <= 1 { return fiboList }

  var sum = 0

  // 1,1,2,3,5,8,13....
  for index in 0 ... level - 2 {
    if index > 2 {
      initialValue += fiboList[fiboList.count - 4]
    }
    sum += initialValue
    fiboList.append(sum)
  }

  return fiboList
}

func fibonacciIteration2(level: Int) throws -> [Int] {
  guard level > 0 else { throw FibonacciError.outOfBounds }
  var fiboList = [Int]()
  var num1 = 0, num2 = 1
  
  fiboList.append(num1)
  if level == 1 { return fiboList }
  fiboList.append(num2)
  if level == 2 { return fiboList }
  
  for _ in 2 ..< level {
    let num = num1 + num2
    num1 = num2
    num2 = num
    fiboList.append(num2)
  }
  return fiboList
}

let fibolist = try! fibonacciIteration(level: 6)
fibolist

let fibolist2 = try! fibonacciIteration2(level: 5)
print("fibolist2 : ", fibolist2)

class FibIterator : IteratorProtocol {
  var (a, b) = (0, 1)
  
  func next() -> Int? {
    (a, b) = (b, a + b)
    return a
  }
}

let fibs = AnySequence{ FibIterator() }
let fibs2 = AnySequence({
  FibIterator()
})

let iterator = fibs.makeIterator()
//iterator.next()
//iterator.next()
//iterator.next()
//iterator.next()
//iterator.next()

print(Array(fibs2.prefix(10)))
print(Array(fibs2.lazy.filter{$0 % 2 == 0}.prefix(5)) )


var wholeArray = [1, 2, 3, 4, 5, 6]
var n = 5

var firstFive = wholeArray[0..<n] // 1,2,3,4,5
let firstFive2 = wholeArray.prefix(5)   // 1,2,3,4,5
print("firstFive2 : ", firstFive2)

let lastThree = wholeArray.suffix(3)  // 4,5,6
print("lastThree : ", lastThree)




