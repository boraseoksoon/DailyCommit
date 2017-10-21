//: Playground - noun: a place where people can play

import UIKit

var str = "find the most + least common name"

let list = ["blue", "yellow", "green", "blue","grey",
            "red","yellow", "red", "red", "red", "grey", "red", "red", "yellow", "blue", "green", "black", "red", "red", "red",
            "purple", "yellow", "blue","yellow", "blue", "green", "yellow", "green",
            "blue", "green", "red", "blue", "blue", "blue","green" ,"blue", "green", "grey", "grey",
            "alloe","alloe","alloe","alloe","alloe","alloe","alloe","alloe","alloe","alloe","alloe","alloe","alloe","alloe","alloe","alloe","alloe","alloe"]

func findElement(in targetList: [String],
                 compareCondition : () -> Bool,
                 closureTest: ((_ num1: Int, _ num2: Int) -> Bool)? = nil) -> [String] {
    if let closureTest = closureTest {
        if closureTest(1,2) {
            print("closure true!")
        } else {
            print("closure false!")
        }
    }
    
    
    var returnList: [String]  = []
    var checkDictionary = [String: Int]()
    
    for element in targetList {
        if checkDictionary[element] == nil {
            checkDictionary[element] = 1
        } else {
            if let count = checkDictionary[element] {
                checkDictionary[element] = count+1
            }
        }
    }
    
    if compareCondition() {
        let mostCommonNumber = checkDictionary.values.max()
        for (k,v) in checkDictionary {
            print("\(k) : \(v)")
            if mostCommonNumber == v {
                for _ in 0..<v {
                    returnList.append(k)
                }
            }
        }
        
        let shouldUniqueElement = makeUniqueElement(targetList: returnList)
        
        return returnList.filter { element in
            return element == shouldUniqueElement
        }
    } else {
        let leastCommonNumber = checkDictionary.values.min()
        for (k,v) in checkDictionary {
            print("\(k) : \(v)")
            if leastCommonNumber == v {
                for _ in 0..<v {
                    returnList.append(k)
                }
            }
        }

        let shouldUniqueElement = makeUniqueElement(targetList: returnList)
        
        return returnList.filter { element in
            return element == shouldUniqueElement
        }
    }
}

func makeUniqueElement(targetList: [String]) -> String {
    var checkDictionary: [String: Int] = [:]
    for element in targetList {
        checkDictionary[element] = 0
    }
    
    var checkList = [String]()
    for (k,v) in checkDictionary {
        checkList.append(k)
    }
    
    let orderedCheckList = checkList.sorted()
    return orderedCheckList.first!
}

let what = findElement(in: list,
                       compareCondition: { () -> Bool in return true },
                       closureTest: { (n1, n2) -> Bool in  n1 > n2} )
print(what)


