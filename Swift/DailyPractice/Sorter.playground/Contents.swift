//: Playground - noun: a place where people can play

import UIKit

var str = "OOP Sort Machine for fun"

typealias SortAlgorithmType = (([Int]) -> ([Int]))?

protocol Sortable {
    func sort(input: [Int]) -> [Int]
    var input: [Int]? { get set }
    var algorithm: (([Int]) -> [Int])? { get set }
}

extension Sortable {
    func sort(input: [Int]) -> [Int] {
        return []
    }
}

protocol Talkable {
    func sayMessageWhileSorting()
}

extension Talkable {
    func sayMessageWhileSorting() {
        print("by default, I am going to tell you this.")
    }
}

class Speaker: Talkable {
    func sayMessageWhileSorting() {
        print("Speaker!")
    }
}

class Speaker2: Talkable {
    func sayMessageWhileSorting() {
        print("Speaker2!")
    }
}

class Speaker3 { /**/ }
extension Speaker3: Talkable {
    func sayMessageWhileSorting() {
        print("by default, I am going to tell you this.")
    }
}

class SortMachine: Sortable {
    private var _speaker: Talkable?
    public var speaker: Talkable? {
        get {
            return _speaker
        }
        
        set {
            _speaker = newValue
        }
    }
    
    public func testSpeaker() {
        speaker?.sayMessageWhileSorting()
    }
    
    var input: [Int]?
    private var _algorithm: (([Int]) -> [Int])?
    public var algorithm: (([Int]) -> [Int])? {
        get {
            return _algorithm
        }
        set {
            _algorithm = newValue
        }
    }
    
    public func sort(input: [Int]) -> [Int] {
        speaker?.sayMessageWhileSorting()
        return algorithm?(input) ?? []
    }
}

var input = [11, 53, 328, 32, 528, 1, 10,5,4,7,3,2,11]
func bubbleSort(input: [Int]) -> [Int] {
    var mInput = input
    
    var padding = 0
    let bound = (mInput.count - 1)
    for i1 in 0...bound - padding {
        for i2 in 0...bound - padding {
            guard case let i3 = i2 + 1,
                  bound - padding >= i3 else {
                break
            }

            if mInput[i3] > mInput[i2] {
                mInput.swapAt(i2, i3)
            }
        }
        
        padding += 1
    }

    return mInput
}

func selectionSort(input: [Int]) -> [Int] {
    var mInput = input
    
    var tempBig: Int = 0
    var indexAtBiggest: Int = 0
    for i1 in 0...mInput.count - 1 {
        indexAtBiggest = i1
        tempBig = mInput[i1]
        
        for i2 in i1...mInput.count-1 {
            guard mInput.count - 1 >= i2 + 1 else {
                mInput.swapAt(indexAtBiggest, i1)
                break
            }
            
            if tempBig < mInput[i2 + 1] {
                tempBig = mInput[i2 + 1]
                indexAtBiggest = i2 + 1
            }
        }
    }
    
    return mInput
}

// let output = selectionSort(input: input)
// let output = bubbleSort(input: input)

let sortingStrategy = selectionSort
let machineA = SortMachine()

machineA.speaker = Speaker()

// machineA.algorithm = selectionSort
machineA.algorithm = bubbleSort

var output = machineA.sort(input: input)
output
machineA.speaker = Speaker2()

output = machineA.sort(input: input)
output

machineA.speaker = Speaker3()
output = machineA.sort(input: input)
output
