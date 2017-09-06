//: Playground - noun: a place where people can play

import UIKit

var str = "Flatten Array in [Any]"

let givenArray: [Any] = [1,2,[3,4,[5,6,7,[8,9,10]]]]

private struct EmptyGivenArray: Error {}

func flatten(_ givenArray:[Any]) throws -> [Any]{
  guard !givenArray.isEmpty else {
    throw EmptyGivenArray()
  }
  
  var flattenArray = [Any]()
  
  for item in givenArray {
    if item is [Any] {
      if let subArray = try? flatten(item as! [Any])  {
        for subItem in subArray {
          flattenArray.append(subItem)
        }
      }
    } else {
      flattenArray.append(item)
    }
  }

  return flattenArray
}

if let flattenArray = try? flatten(givenArray) {
  print(flattenArray)
}

// using map and flatmap(However, heterogeneous type [Any] is not allowed to do this)
var arrayOfArrays = [ [1, 1], [2, 2], [3, 3] ]
var mappedArray = arrayOfArrays.map { array in
  return array.map { $0 }
}
var flattened = Array(mappedArray.joined())
print(flattened)

var flatmapArray = arrayOfArrays.flatMap { $0 }
print(flatmapArray)