//: Playground - noun: a place where people can play

import UIKit

var str = "Swift Fun Algorithms"

print("***********************")
print("/****** FizzBuzz *****/")
print("***********************")

/// #1: FizzBuzz
let list = Array(1...100)

for i in list {
    if i % 15 == 0 {
        print("\(i) : FizzBuzz")
    } else if i % 3 == 0 {
        print("\(i) : Fizz")
    } else if i % 5 == 0 {
        print("\(i) : Buzz")
    }
}

/// #2: Binary Search

print("****************************")
print("/****** Binary Search *****/")
print("****************************")

print("**** creation test list ****")
// creation test list
let randomArray = Array(0...1000).map { _ in Int(arc4random_uniform(1000) + 1) }
let randomSortedArray = randomArray.sorted(by: { $0 < $1 })

// bruteForceSearch(Time Complexity O(n))
func bruteForceSearch(searchValue: Int, inList: [Int]) -> Bool {
    for i in inList {
        if searchValue == i {
            return true
        }
    }
    return false
}

print("**** do brute force search... ****")

if bruteForceSearch(searchValue: 100, inList: randomArray) {
    print("bruteForceSearch : Found!")
} else {
    print("bruteForceSearch : Failure!")
}

//  binarySearch(Time Complexity O(Log(n))), However, before using binary search, it should be sorted.
// v. iteration
func iterationBinarySearch(searchValue: Int, inList: [Int]) -> Bool {
    var beginIndex = 0
    var midIndex = inList.count / 2
    var endIndex = inList.count - 1
    
    while beginIndex <= endIndex {
        if searchValue == inList[midIndex] {
            return true
        } else if searchValue > inList[midIndex] {
            beginIndex = midIndex + 1
            midIndex = (endIndex - beginIndex) / 2 + beginIndex
        } else if searchValue < inList[midIndex] {
            endIndex = midIndex - 1
            midIndex = endIndex / 2
        }
    }
    
    return false
    
}

print("**** do iteration binary search... ****")
if iterationBinarySearch(searchValue: 100, inList: randomSortedArray) {
    print("found!")
} else {
    print("NOT found!")
}

// v. recursion
func recursiveBinarySearch(searchValue: Int,
                           beginIndex: Int,
                           endIndex: Int,
                           inList: [Int]) -> Int {
    let midIndex = (beginIndex + endIndex) / 2
    let midValue = inList[midIndex]
    
    if (beginIndex > endIndex) {
        return -1
    }
    
    if searchValue == midValue {
        return midIndex
    } else if searchValue > midValue {
        return recursiveBinarySearch(searchValue: searchValue,
                                     beginIndex:midIndex + 1,
                                     endIndex: endIndex,
                                     inList: inList)
    } else if searchValue < midValue {
        return recursiveBinarySearch(searchValue: searchValue,
                                     beginIndex:beginIndex,
                                     endIndex: midIndex - 1,
                                     inList: inList)
    }
    
    return -1
}

print("**** do recursive binary search... ****")
let foundMidIndex = recursiveBinarySearch(searchValue: 100,
                                          beginIndex: 0,
                                          endIndex: randomSortedArray.count - 1,
                                          inList: randomSortedArray)

if (foundMidIndex != -1) {
    print("Found!")
    print("\(randomSortedArray[foundMidIndex]) is at \(foundMidIndex) index")
    print("randomSortedArray[\(foundMidIndex)] => \(randomSortedArray[foundMidIndex])")
} else {
    print("Not Found!")
}

/// #3: Factorial + Recursion :
print("************************************")
print("/****** Factorial + Recursion *****/")
print("************************************")

let factorialLevel = 10
// factorial? => 5! => 5 * 4 * 3 * 2 * 1 => 120

// using high order function.
Array(1...factorialLevel).reduce(1, { $0 * $1 })

// iteration version
func iterationFactorial(level: Int) -> Int {
    var sum = 1
    
    for i in 1...level {
        sum *= i
    }

    return sum
}
iterationFactorial(level: factorialLevel)

// recursion version
func recursiveFactorial(level: Int) -> Int {
    if level == 1 {
        return 1
    } else {
        return level * recursiveFactorial(level: level - 1)
    }
}
recursiveFactorial(level: factorialLevel)

/// #4: Common name in array :
func mostCommonName(inList: [String]) -> (String, Int) {
    var nameDictionary = [String: Int]()
    for name in inList {
        if nameDictionary[name] == nil {
            nameDictionary[name] = 1
        } else {
            nameDictionary[name] = nameDictionary[name]! + 1
        }
    }
    
    for (k,v) in nameDictionary {
        print("\(k) : \(v)")
    }

    // #solution 1.
    var mostCommonName = ""
    for key in nameDictionary.keys {
        if mostCommonName == "" {
            mostCommonName = key
        } else {
            let count = nameDictionary[key]!
            
            if count > nameDictionary[mostCommonName]! {
                mostCommonName = key
            }
        }
    }
    return (mostCommonName, nameDictionary[mostCommonName]!)
}


let nameList = ["Swift","Swift","Scala","Javascript","Swift", "Java","Python","Ruby", "C", "C++",
                "Swift", "Javascript", "Python", "C", "C++", "Scala", "Javascript", "Javascript",
                "Javascript", "Javascript", "Javascript", "Javascript", "Python", "Python", "Python", "Python",
                "Python", "Python", "Javascript"]

let mostCommonNameTuple = mostCommonName(inList: nameList)
print("mostCommonName : \(mostCommonNameTuple.0)")
print("Count of mostCommonName : \(mostCommonNameTuple.1)")

/// #5: Reverse every words :
// requirement 1. reverse every words.
// requirement 2. reverse every each seconds time words. ex : hello 'dlrow' you 'yam' be 'ecin'.
// requirement 3. remove all vowels in sentences.

let givenSentence = "Hello you guys let me introduce to myself I am seoksoon jang I am so glad to meet you"
func reverseSentence(_ sentence: String) -> String {
    let words = sentence.components(separatedBy: " ")
    
    /// requirement 1. reverse every words.
    var completedWords = ""
    for (index, word) in words.enumerated() {
        
        /// requirement 2. reverse every each seconds time words. ex : hello 'dlrow' you 'yam' be 'ecin'.
        if (index % 2 != 0) {
            let reverseWord = String(word.characters.reversed()) + " "
            completedWords += reverseWord.removeVowels()
        } else {
            completedWords += word.removeVowels() + " "
        }
    }
    return completedWords
}
print(reverseSentence(givenSentence))

/// requirement 3. remove all vowels in sentences.
extension String {
    func removeVowels() -> String {
        let vowelList = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        
        var string = self
        for vowel in vowelList {
            string = string.replacingOccurrences(of: vowel, with: "")
        }
        return string
    }
}

/// #6: Fibonnaci sequence :
// requirement 1 : you know, fibonacci. 1, 1, 2, 3, 5, 8, 13, 21, 34......
//                just get list of fibonacci number when fibonacci level input is given.

// fibonaaci
// get fibonacci list

let fiboLavel = 2

// # solution1 : using recursive
func recursiveFibo(level: Int, first: Int, second: Int) -> [Int] {
    if level == 0 {
        return []
    }
    let returnValue = recursiveFibo(level: level - 1, first:second, second: first + second)
    return [first + second] + returnValue
}


let fiboList = [0, 1] + recursiveFibo(level:fiboLavel - 1, first: 0, second: 1)
print(fiboList)

// # solution2 : using iteration
func iterationFibo(level: Int) -> [Int] {
    var sequence = [0,1]
    let initialSequnece = sequence  // to use initial sequnce count
    
    if level <= 1 {
        return sequence
    }
    
    for _ in 0...level - initialSequnece.count {
        let first = sequence[sequence.count - initialSequnece.count]
        let second = sequence.last!
        sequence.append(first + second)
    }
    return sequence
}

let fiboList2 = iterationFibo(level: fiboLavel)
print(fiboList2)


/// #7: Wrapping an array :
// requirements 1. if track is selected, starting from selected track, wrapping array, all prior track with selected track, should move to top of list.
//                 then, other remaining array section should be moved into after above wrapping array.

let tracks = ["a", "b", "c", "d", "e", "f", "g"]
let selectedTrack = "f"

// # solution 1.
var priorTracks = [String]()
var selectedTracks = [String]()

for track in tracks {
    if selectedTrack == track || selectedTracks.count > 0 {
        selectedTracks.append(track)
    } else {
        priorTracks.append(track)
    }
}

let completedTrack = selectedTracks + priorTracks
print(completedTrack)

// # solution 2.
let index = tracks.index { return $0 == selectedTrack }
let prefixTracks = tracks.prefix(upTo: index!)
let suffixTracks = tracks.suffix(from: index!)
let solvedTrack = suffixTracks + prefixTracks
print(solvedTrack)


/// #8: Map, filter, reduce(it is done) :

/*********
 //
 //
 //
 //  forEach
 //
 //
 *********/

let nums = [1,2,3,4]
nums.forEach { print($0) }
Array(0..<99).forEach{ print($0) }

// filter
let digits = [1,4,10,15]
let even = digits.filter { $0 % 2 == 0 }
print(even)


/*********
 //
 //
 //
 //  filter
 //
 //
 *********/

// filter
let filterList = list.filter { $0 is Int }
    .filter { return ($0 as! Int) % 2 == 0 }
    .sorted { $0 as! Int > $1 as! Int }
print(filterList)

/*********
 //
 //
 //
 //  map
 //
 //
 *********/

// map
let mapList = filterList.map({
    ($0 as! Int) + 1
})

/*********
 //
 //
 //
 //  reduce
 //
 //
 *********/


// reduce
let reduceResult = mapList.reduce(0, { sum, num in
    sum + num
})


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

let mixlist: [Any] = Array(0..<1000).enumerated().map { (index, element) in
    if index % 2 == 0 {
        return String(arc4random_uniform(1000) + 1)
    } else {
        return Int(arc4random_uniform(1000) + 1)
    }
}

print("mixlist : \(mixlist)")

/*********
 //
 //
 //
 //  flatmap
 //
 //
 *********/

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

/// #9: Recursive search through binary tree :

/// #10: Reverse Linked-List :
class Node {
    let value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
    
    init(node: Node) {
        self.value = node.value
        self.next = node.next
    }
}

let seventhNode = Node(value: 7, next: nil)
let sixthNode = Node(value: 6, next: seventhNode)
let fifthNode = Node(value: 5, next: sixthNode)
let forthNode = Node(value: 4, next: fifthNode)
let thirdNode = Node(value: 3, next: forthNode)
let secondNode = Node(value: 2, next: thirdNode)
let firstNode = Node(value: 1, next: secondNode)

func printLinkedList(headNode: Node?) -> Void {
    var currentNode = headNode
    while currentNode != nil {
        print(currentNode?.value ?? "default")
        currentNode = currentNode?.next
    }
}

print("*** printLinkedList in order *** ")
// should be 1,2,3
printLinkedList(headNode: firstNode)

// #1. solution 1 : reconstruction
func reverseLinkedList(headNode: Node?) -> Void {
    var currentNode = headNode
    var copyNode: Node?
    
    while currentNode != nil {
        if copyNode == nil {
            if let nodeValue = currentNode?.value {
                copyNode = Node(value:nodeValue, next: nil)
            }
        } else {
            if let nodeValue = currentNode?.value {
                copyNode = Node(value: nodeValue, next: copyNode)
            }
        }
        currentNode = currentNode?.next
    }
    
    printLinkedList(headNode: copyNode)
}

print("*** printLinkedList in reverse : reconstruction *** ")
// it should be 3,2,1
reverseLinkedList(headNode: firstNode)


print("*** printLinkedList in reverse : simply put pointer *** ")
// #1. solution 2 : simply put pointer

// before : 1->2->3->4->5->6->7->nil
// after : nil(currentNode, next)->7(prev)->6->5->4->3->2->1->nil
func getHeadNodeOfReverseLinkedList(head: Node?) -> Node {
    var currentNode = head
    var prev: Node?
    var next: Node?
    
    while currentNode != nil {
        next = currentNode?.next
        currentNode?.next = prev
        prev = currentNode
        currentNode = next
    }
    return prev!
}

printLinkedList(headNode: getHeadNodeOfReverseLinkedList(head: firstNode))

/// #11: Swift Retain Cycle :

/// #12: Swift Closure Reference Cycle :

/// #13: Draw circle using math

/// #14: Social media app :

/// #15: Counting Palindromes :

/// #16: Abstract Syntax Tree (Warning: Somewhat Difficult Recursion)
/// #17: Generic Stack

print("end of the program!")
