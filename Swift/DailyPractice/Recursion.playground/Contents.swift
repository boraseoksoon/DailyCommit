//
//  main.swift
//  Recursion
//
//  Created by Seoksoon Jang on 2017. 9. 9..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

print("Hello, World!")

/// factorial
func factorial(count: Int) -> Int {
  if count == 1 {
    return count
  }
  return count * factorial(count: count - 1)
}

let result = factorial(count: 5)
print(result)

// TCO
func tailFactorial(initValue: Int, count: Int) -> Int {
  if count == 1 {
    return initValue
  }
  return tailFactorial(initValue: initValue * count, count: count - 1)
}

let result2 = tailFactorial(initValue: 1, count: 5)
print(result2)



/// summation

// usual
func summation(_ n: Int) -> Int {
  if n < 1 {
    return 0
  }
  return n + summation(n - 1)
}

let result3 = summation(100)
print(result3)

// tail call
func tailSummation(number: Int, initValue: Int = 0) -> Int {
  if number < 1 {
    return initValue
  }
  return tailSummation(number: number-1,
                       initValue: initValue + number)
}

let result4 = tailSummation(number: 100, initValue: 0)
print(result4)


/// fibonnaci
let fiboLevel = 5
// 1,1,2,3,5,8,13,21.....
func fibo(level: Int) -> Int {
  guard level > 1 else { return level }
  return fibo(level: level-1) + fibo(level: level-2)
}

let result6 = fibo(level: fiboLevel)
print("result6 :", result6)

func tailFibo(level: Int, previous: (Int, Int) = (0,1)) -> Int {
  guard level > 0 else { return 0 }
  if level == 1 {
    return previous.1
  }
  return tailFibo(level: level - 1,
                  previous: (previous.1, previous.0 + previous.1))
}

let result7 = tailFibo(level: fiboLevel)
print("result7 :", result7)

/// trampoline
enum Result<T> {
  case Done(T)
  case Call(() -> Result<T>)
}

func sum3(n: Int, acc: Int = 0) -> Int {
  func helper(_ n: Int, acc: Int) -> Result<Int> {
    if n < 1 {
      return .Done(acc)
    }
    return .Call({ helper(n-1, acc: n + acc) })
  }
  
  var res = helper(n, acc: acc)
  repeat {
    switch res {
      case let .Done(r): return r
      case let .Call(f): res = f()
    }
  } while true
}

let result5 = sum3(n: 100)
print("result5 :", result5)

/// recursive closure
///
func recursiveClosure(_ closure: @escaping (()->Void)->Void) -> ()->Void {
  return { closure(recursiveClosure(closure)) }
}

var testVar = 5
let block = recursiveClosure { recursive in
  if testVar > 0 {
    print (testVar-=1)
    recursive()
  }
  else {
    print("done!")
  }
}

block()  // prints 5 4 3 2 1 done!