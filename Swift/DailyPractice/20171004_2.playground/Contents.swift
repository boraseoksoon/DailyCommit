//: Playground - noun: a place where people can play

import UIKit

var str = "20171004"

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
