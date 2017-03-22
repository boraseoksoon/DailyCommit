//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, 20170322"

// binary search
class Node {
    let data: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(data: Int, leftChild: Node?, rightChild: Node?) {
        self.data = data
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

// left branch
let fourNode = Node(data:4, leftChild:nil, rightChild:nil)
let sevenNode = Node(data: 7, leftChild: fourNode, rightChild: nil)

// right branch
let elevenNode = Node(data: 11, leftChild:nil, rightChild:nil)
let nineNode = Node(data: 9, leftChild:nil, rightChild:nil)
let fourteenNode = Node(data: 14, leftChild: elevenNode, rightChild: nineNode)

// root
let oneRootNode = Node(data: 1, leftChild:sevenNode, rightChild:fourteenNode)

/*
         1
        / \
       7  14
      /  /  \
     4  11   9
*/

func search(searchValue: Int, node:Node?) -> Bool {
    if node == nil {
        return false
    }
    if node?.data == searchValue {
        return true
    } else {
        // recursion
        return search(searchValue:searchValue, node:node?.leftChild) || search(searchValue:searchValue, node:node?.rightChild)
    }
    
    return false
}

search(searchValue: 4, node:oneRootNode)


// fizz-buzz
var numbers: [Int] = []

for i in 1...100 {
    numbers.append(i)
}

for o in numbers {
    if o % 15 == 0 {
        print("fizbuzz!")
    } else if o % 3 == 0 {
        print("fizz!")
    } else if o % 5 == 0 {
        print("buzz!")
    }  else {
        print(o)
    }
}

