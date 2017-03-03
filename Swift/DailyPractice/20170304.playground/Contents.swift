//: Playground - noun: a place where people can play

import UIKit

var str = "Daily Coding : 20170303,\nToday, I am gonna repeat High-Order functions like map, flatmap, filter, reduce"

let numberList : [Int] = [1,2,3,4,5]

var integerList : [Int] = [Int]()
var stringList : [String] = [String]()

// map
// for
for i in numberList {
    integerList.append(i * 2)
    stringList.append("\(i * 2)")
}

print(integerList)
print(stringList)

// using map
integerList = numberList.map({(number : Int) -> Int in
    return number * 2
})

print(integerList)
// using map simplyfied
integerList = numberList.map({ $0 * 2 })
print(integerList)

// how to implement map
func ownMap<T>(sourceList : [T], expression : (T) -> T) -> [T] {
    var localList = [T]()
    
    for i in sourceList {
        localList.append(expression(i))
    }
    
    return localList
}

var testInputList = [1,2,3,4,5]
let answerList = ownMap(sourceList:testInputList, expression: { return $0 * 10 })
print(answerList)

// flatmap
var numberListssss = [[1,2,3],[4,5,6]]
let flattendList = numberListssss.flatMap({$0})
print(flattendList)

// filter

// using for
integerList = [Int]()

for i in numberList {
    if i % 2 == 0 {
        integerList.append(i)
    }
}

print(integerList)

// using filter
integerList = numberList.filter({ (number : Int) -> Bool in
    return number % 2 == 0
})
print(integerList)

// using filter simplyfied
integerList = numberList.filter({ $0 % 2 == 0 })
print(integerList)

// how to implement filter
func ownFilter<T>(list : [T], expression : (T) -> Bool) -> [T] {
    var localList = [T]()
    
    for i in list {
        if expression(i) {
            localList.append(i)
        }
    }
    
    return localList
}

var testList = [1,2,3,4,5]
var resultList = ownFilter(list:testList, expression:{ (number : Int) -> Bool in
    return number % 2 == 0
})

print(resultList)

resultList = ownFilter(list:testList, expression:{ $0 % 2 == 0 })

print(resultList)

// reduce

// for
integerList = [Int]()
for i in numberList {
    if i % 2 == 0 {
        integerList.append(i)
    }
}

var evenSum = 0
for i in integerList {
    evenSum += i
}

print(evenSum)

// using reduce
var sum = 0

// sum = numberList.reduce(sum, { sum, number -> Int in sum + number })
// sum = numberList.reduce(sum, { $0 + $1 })
sum = numberList.reduce(sum, +)     // final guy
print(sum)

// sum = Array([1,2,3,4,5]).reduce(0, { $0 + $1 })
// print(sum)

// how to implement reduce

func ownReduce<T,U>(result : U, sourceList:[T], expression : (U,T) -> U) -> U {
    var mutableResult = result
    
    for i in sourceList {
        mutableResult = expression(mutableResult, i)
    }
    
    return mutableResult
}

var reduceSum = 0
var reduceInputList = [1,2,3,4,5]
reduceSum = ownReduce(result:reduceSum,
                      sourceList:reduceInputList,
                      expression:{ (eachNumber : Int, sum : Int) -> Int
                        in return sum + eachNumber // (sum + eachNumber) * 2
})

reduceSum = 1
reduceSum = ownReduce(result:reduceSum,
                      sourceList:reduceInputList,
                      expression:*)
print(reduceSum)


extension Array {
    func ownReduce<T,U>(_ result: U, _ expression:(U,T) -> U ) -> U {
        var mutableResult = result
        
        for i in self {
            // since this is used as extension, need to type casting
            mutableResult = expression(mutableResult, i as! T)
        }
        
        return mutableResult
    }
}

reduceSum = 1
reduceSum = reduceInputList.ownReduce(reduceSum, *)
print(reduceSum)


// let's burn practice!

// high-order function chain.
let stringWords = ["10.12345", "456.7", "nine", "15", "300", "fifteen"]
let result = stringWords.map{ Int($0) }.filter{ $0 != nil }.map{ $0! }.reduce(0, { $0 + $1 })
print(result)


// flatmap will release optional
let items: [Int?] = [1, 2, nil, 4, 5, nil, 7]
let mapItems = items.map { $0 } // flatMap will release Optional in the list.
print(mapItems)


