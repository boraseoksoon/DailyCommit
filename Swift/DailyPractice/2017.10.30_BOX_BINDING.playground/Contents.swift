//: Playground - noun: a place where people can play

import UIKit

var str = "2017/10/30 Data Binding Technique using Box."

class Box<T> {
  typealias Listener = ((T) -> Void)
  var listener: Listener?
  
  var value: T {
    didSet {
      listener?(value)
    }
  }
  
  init(_ value: T) {
    self.value = value
  }
  
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}

let boxInt = Box(42)
boxInt.bind {
  print("[BIND]value changeed: \($0)")
}

boxInt.value = 100
boxInt.value = 200
boxInt.value = 1
