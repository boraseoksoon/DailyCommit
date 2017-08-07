//: Playground - noun: a place where people can play

import UIKit

var str = "2017/08/07 : High Order Functions"

let randomArray = Array(0...3).map { _ in arc4random_uniform(1000) + 1 } // an example output [3, 543, 13]
print(randomArray)


// index in map
let numberList = [7, 8, 9, 10]
let indexAndNum: [String] = numberList.enumerated().map { (index, element) in
    return "\(index): \(element)"
}
print(indexAndNum)
// ["0: 7", "1: 8", "2: 9", "3: 10"]


// create example list
/*
var list = [1000, 123, 553, 1,"A", 2, "B", 3, "C", 4, "D", ["Apple", "Juice", "Javascript", 5.0]] as [Any]

for i in 1...100 {
    if i % 2 == 0 {
        list.append(String(arc4random_uniform(1000) + 1))
    } else {
        list.append(Int(arc4random_uniform(1000) + 1))
    }
}
*/

let list: [Any] = Array(0..<1000).enumerated().map { (index, element) in
    if index % 2 == 0 {
        return String(arc4random_uniform(1000) + 1)
    } else {
        return Int(arc4random_uniform(1000) + 1)
    }
}

print("list : \(list)")


// filter
let filterList = list.filter { $0 is Int }
                    .filter { return ($0 as! Int) % 2 == 0 }
                    .sorted { $0 as! Int > $1 as! Int }
print(filterList)

// map
let mapList = filterList.map({
    ($0 as! Int) + 1
})

// reduce
let reduceResult = mapList.reduce(0, { sum, num in
    sum + num
})

// sort
// list = list.sorted(by: { $0 as! Int > $1 as! Int })













// flatmap
// Background : Why use flatmap?
var arrayOfArrays = [ [1, 1], [2, 2], [3, 3] ]

/* there is a challenge about multiplying by 2 its content and the result should look like this:
 // [ [2, 2], [4, 4], [6, 6] ]
 */

var multipliedByTwo = arrayOfArrays.map { array in
    return array.map { integer in
        return integer * 2
    }
}

// result is : [ [2, 2], [4, 4], [6, 6] ]

// Good, then there is a new challenge converting the multiplied array of arrays to only one array like this:
// [ 2, 2, 4, 4, 6, 6 ]

var flattened = Array(multipliedByTwo.joined())
print(flattened)
// outputs : [ 2, 2, 4, 4, 6, 6 ]

// flatmap is elegance rescue to do this.
var flattenedArray = arrayOfArrays.flatMap { array in
    return array.map { integer in
        return integer * 2
    }
}

print(flattenedArray) // outputs: [ 2, 2, 4, 4, 6, 6 ]

// comparing map with flatmap....
let numbers: [Int] = [1, 2, 3]
let numbersMap = numbers.map { return $0 }
print(numbersMap) // [1, 2, 3]
let numbersFlatMap = numbers.flatMap { return $0 }
print(numbersFlatMap) // [1, 2, 3]
// In fact, if we were iterating an array, flatMap and map would behave similarly


// But if we had an array of optionals, there would be a big difference:
let optionalNumbers: [Int?] = [1, nil, 3]
let optionalNumbersMap = optionalNumbers.map { return $0 }
print(optionalNumbersMap) // [Optional(1), nil, Optional(3)]
let optionalNumbersFlatMap = optionalNumbers.flatMap { return $0 }
print(optionalNumbersFlatMap) // [1, 3]

/*
 while map method practically doesn’t change anything on the numbersMap array result, 
 flatMap does two things: 
    1. first convert item’s type from Int? to Int
    2. then, removes the nil items on the resulting conversion numbersFlatMap, pretty neat.
 */

// flatmap other examples
let flatten = ["Cenny", "42", "666", "Seven"].flatMap { Int($0) } // [42, 666]
print(flatten)
