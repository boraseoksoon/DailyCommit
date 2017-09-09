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