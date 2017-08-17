//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// generic
class Node <T> {
    let value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}

class Stack <T> {
    var head: Node<T>?
    // push
    func push(_ nodeToPush: Node<T>) {
        if head != nil {
            let nodeToRun = self.head
            while nodeToRun?.next != nil {}
            nodeToRun?.next = nodeToPush
            
            // head?.next = nodeToPush
        } else {
            head = nodeToPush
        }
    }
    // pop
    // peek
    // printAll
    func printAll() {
        let nodeToRun = self.head
        while nodeToRun?.next != nil {
            print(nodeToRun?.value ?? "default")
        }
    }
}

print("???")

let stack = Stack<Int>()
stack.push(Node<Int>(value:1))
stack.push(Node<Int>(value:2))
stack.push(Node<Int>(value:3))
stack.printAll()


func printIntElements(_ array: [Int]) {
    array.map { print($0) }
}

func printDoubleElements(_ array: [Double]) {
    array.map { print($0) }
}

func printStringElements(_ array: [String]) {
    array.map { print($0) }
}
printIntElements([1, 2, 3, 4, 5])
printDoubleElements([1.0, 2.0, 3.0, 4.0, 5.0])
printStringElements(["1", "2", "3", "4", "5"])


// rescue to problem
func printWhateverTypeElements<T>(_ array: [T]) {
    array.map { print($0) }
}

printWhateverTypeElements([1,2,3,4,5])
printWhateverTypeElements([1.0,2.0,3.0,4.0,5.0])
printWhateverTypeElements(["1.0","2.0","3.0","4.0","5.0"])


func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var a = 10
var b = 20
swapTwoValues(&a, &b)
