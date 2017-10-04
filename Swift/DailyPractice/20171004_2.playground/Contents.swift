//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "20171004"

// Swift KVO
class User: NSObject {
  @objc dynamic var name: String?
}

class Observer: NSObject {
  var user: User
  
  init(user: User) {
    self.user = user
    super.init()
    self.user.addObserver(self, forKeyPath: "name", options:.new, context: nil)
  }
  
  override func observeValue(forKeyPath keyPath: String?,
                             of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if let newValue = change?[.newKey] {
      print("[KVO] Name changed: \(newValue)")
    } else {
      super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
    }
  }
  
  deinit {
    self.user.removeObserver(self, forKeyPath: "name")
  }
}

var user = User()
user.name = "Test"

var observer = Observer(user: user)
user.name = "Test 2"  // [KVO] Name changed: Test 2
user.name = "Test 3"  // [KVO] Name changed: Test 3
user.name = "Test 4"  // [KVO] Name changed: Test 4




// 카레 깊은 맛
func curryDeep<X,Y,Z>(implement: @escaping (X,Y) -> Z) -> (X) -> (Y) -> (Z) {
  return { x in { y in implement(x,y) } }
}

let multiply10 = curryDeep { (x, y) -> Int in return x * y } (10)
let res = multiply10(20)
print("res : ", res)

// 카레 더 찐한 맛
func curryDeepMore<X,Y,Z,A>(implement: @escaping (X,Y,Z) -> A) -> (X) -> (Y) -> (Z) -> (A) {
  return {x in { y in { z in implement(x,y,z) } } }
}

let x = curryDeepMore{ (x, y, z) -> Int in
  return x * y * z
}

let y = x(10)
let z = y(20)
let A = z(30)

print("A : ", A)

