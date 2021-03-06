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
print("factorialLevel(\(factorialLevel)) : \(iterationFactorial(level: factorialLevel))")

// recursion version
func recursiveFactorial(level: Int) -> Int {
    if level == 1 {
        return 1
    } else {
        return level * recursiveFactorial(level: level - 1)
    }
}

print("recursiveFactorial(\(factorialLevel)) : \(recursiveFactorial(level: factorialLevel))")

/// #4: Common name in array :
print("************************************")
print("/****** Common name in array *****/")
print("************************************")
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
print("************************************")
print("/****** Reverse every words *****/")
print("************************************")

// requirement 1. reverse every words.
// requirement 2. reverse every each seconds time words. ex : hello 'dlrow' you 'yam' be 'ecin'.
// requirement 3. remove all vowels in sentences.
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



/// #6: Fibonnaci sequence :
print("************************************")
print("/****** Fibonnaci sequence *****/")
print("************************************")
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
print("************************************")
print("/****** Wrapping an array *****/")
print("************************************")
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

print("************************************")
print("/****** Map, filter, reduce *****/")
print("************************************")

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



print("************************************")
print("/****** Reverse Linked-List *****/")
print("************************************")

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
printLinkedList(headNode: firstNode)    // should be 1,2,3

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
reverseLinkedList(headNode: firstNode)  // it should be 3,2,1

print("*** printLinkedList in reverse : simply put pointer *** ")
// #1. solution 2 : simply put pointer

// before : 1->2->3->4->5->6->7->nil, after : nil(currentNode, next)->7(prev)->6->5->4->3->2->1->nil
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

print("************************************")
print("/****** Swift Retain Cycle *****/")
print("************************************")
/// #11: Swift Retain Cycle :
class Apartment {
    var number: Int?
    var ternant: Ternant?
    
    init(number: Int) {
        self.number = number
    }
    deinit {
        print("Apartment deinit!")
    }
}

class Ternant {
    var name: String?
    weak var apt: Apartment?
    
    init(name: String) {
        self.name = name
    }
    deinit {
        print("Ternant deinit!")
    }
}

var apt0: Apartment? = Apartment(number:0)
var jss: Ternant? = Ternant(name: "JSS")

apt0?.ternant = jss
jss?.apt = apt0


apt0 = nil
jss = nil


print("************************************")
print("/****** Closure Reference Cycle *****/")
print("************************************")

enum ClosureError: Error {
    case closureOptionalFailure()
}
/// #12: Swift Closure Reference Cycle :
class HTMLElement {
    var tagName: String?
    var text: String?
    
    lazy var asHTML: () throws -> String = { [unowned self] in
        if let tagName = self.tagName {
            if let text = self.text {
                return "<\(tagName)>\(text)</\(tagName)>"
            }
        }
        throw ClosureError.closureOptionalFailure()
    }
    
    init(tagName: String, text: String) {
        self.tagName = tagName
        self.text = text
    }
    
    deinit {
        print("HTML Element deinit!")
    }
}

var htmlElement: HTMLElement? = HTMLElement(tagName: "h1", text: "Important Text!")
let elementString = try? htmlElement?.asHTML()
htmlElement = nil

/// #13: Draw circle using math
print("****** Draw circle using math ******")
// do another UI-focused-practice project

/// #14: Social media app :
print("****** Social media app ******")
// do another UI-focused-practice project

/// #15: Counting Palindromes :
print("************************************")
print("/****** Counting Palindromes *****/")
print("************************************")

let givenString = "madam anna kayak evernote anna Civic racecar Civic anna anna anna"

func countingPalindrome(givenString: String) -> [String:Int] {
    var resultDict = [String:Int]()
    
    let separatedString = givenString.components(separatedBy: " ")
    
    separatedString.forEach({word in
        if isPalindrome(word: word) {
            print("Palindrome found : \(word)!")
            
            if resultDict[word] != nil {
                if let count = resultDict[word] {
                    resultDict[word] = count + 1
                }
            } else {
                resultDict[word] = 1
            }
        } else {
            print("Palindrome NOT found! : \(word)")
        }
    })
    
    return resultDict
}

func isPalindrome(word: String) -> Bool {
    let stringArray = Array(word.lowercased().characters)
    var currentIndex = 0
    
    while currentIndex < stringArray.count / 2 {
        if stringArray[currentIndex] != stringArray[stringArray.count - currentIndex - 1] {
            return false
        }
        currentIndex += 1
    }
    
    return true
}

let result = countingPalindrome(givenString:givenString)
print(result)


/// #16: Abstract Syntax Tree (Warning: Somewhat Difficult Recursion)
print("************************************")
print("/****** Abstract Syntax Tree *****/")
print("************************************")

// Q1. represent the equation above in a tree
// (25 * 6) + 5
//
//          '+'
//          /  \
//        '*'  5
//       /  \ 
//      25   6
// all terminal node is value-node.

// Q2.represent the equation above in a tree
// ((500 - 258) * 6) + (100 / 15)
//           '+'
//         /     \
//       '*'     '/'
//       /  \    / \
//      '-'   6 100 15
//     / \
//   500 258
// all terminal node is value-node.

// Node that represnet value or opeator in abstract syntax tree
class ASTNode {
    var value: Double?
    var operation: String?
    var leftNode: ASTNode?
    var rightNode: ASTNode?
    
    init(value: Double?, operation: String?, leftNode: ASTNode?, rightNode: ASTNode?) {
        self.value = value
        self.operation = operation
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

// Q1.
let fiveNode = ASTNode(value: 5, operation: nil, leftNode: nil, rightNode: nil)

let sixNode = ASTNode(value: 6, operation:nil, leftNode:nil, rightNode:nil)
let twentyFiveNode = ASTNode(value: 25, operation:nil, leftNode:nil, rightNode:nil)
let multiply25_6Node = ASTNode(value: nil, operation:"*", leftNode:twentyFiveNode, rightNode:sixNode)

let rootNode = ASTNode(value: nil, operation:"+", leftNode:multiply25_6Node, rightNode:fiveNode)

// Q2. 
let node100 = ASTNode(value: 100, operation: nil, leftNode: nil, rightNode: nil)
let node15 = ASTNode(value: 15, operation: nil, leftNode: nil, rightNode: nil)
let node258 = ASTNode(value: 258, operation: nil, leftNode: nil, rightNode: nil)
let node500 = ASTNode(value: 500, operation: nil, leftNode: nil, rightNode: nil)
let node6 = ASTNode(value: 6, operation: nil, leftNode: nil, rightNode: nil)

let subtract500_258Node = ASTNode(value: nil, operation: "-", leftNode: node500, rightNode: node258)
let multiplySubtract_6Node = ASTNode(value: nil, operation: "*", leftNode: subtract500_258Node, rightNode: node6)
let divide100_15Node = ASTNode(value: nil, operation: "/", leftNode:node100, rightNode:node15)
// root-node in Q2.
let plusMultiply_diviceNode = ASTNode(value: nil, operation: "+", leftNode: multiplySubtract_6Node, rightNode:divide100_15Node)

func evaluate(node: ASTNode) -> Double {
    if node.value != nil {
        return node.value!
    }
    
    if node.operation == "+" {
        return evaluate(node: node.leftNode!) + evaluate(node: node.rightNode!)
    } else if node.operation == "*" {
        return evaluate(node: node.leftNode!) * evaluate(node: node.rightNode!)
    } else if node.operation == "-" {
        return evaluate(node: node.leftNode!) - evaluate(node: node.rightNode!)
    } else if node.operation == "/" {
        return evaluate(node: node.leftNode!) / evaluate(node: node.rightNode!)
    }
    
    return 0
}

let q1result = evaluate(node: rootNode)
print("result : \(q1result)")

let q2result = evaluate(node: plusMultiply_diviceNode)
print("result : \(q2result)")


/// #17: Generic Stack
print("****************************")
print("/****** Generic Stack *****/")
print("****************************")

class StackNode <T> {
    var value: T
    var next: StackNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

class Stack <T> {
    var topNode: StackNode <T>?
    var count: Int = 0
    
    init(node: StackNode<T>) {
        self.topNode = node
    }
    // ADT
    // pop
    func pop() -> Void {
        if count <= 0 {
            print("stack underflow!")
        }
        var currentNode = self.topNode?.next
        self.topNode = currentNode
        count -= 1
    }
    // push
    func push(nodeToPush: StackNode<T>) -> Void {
        nodeToPush.next = self.topNode
        self.topNode = nodeToPush
        count += 1
    }
    
    // peek
    func peek() -> T {
        return self.topNode?.value as! T
    }
    func printAllInStackOrder() -> Void {
        var currentNode = self.topNode
        while currentNode != nil {
            print(currentNode?.value as! T)
            currentNode = currentNode?.next
        }
    }
    
    // count
    func countStack() -> Int {
        return self.count
    }
}


let stack = Stack(node: StackNode<Int>(value: 0))
stack.push(nodeToPush: StackNode<Int>(value: 1))
stack.push(nodeToPush: StackNode<Int>(value: 2))
stack.push(nodeToPush: StackNode<Int>(value: 3))
stack.push(nodeToPush: StackNode<Int>(value: 4))

print("stack.printAllInStackOrder()")
stack.printAllInStackOrder()

print("stack pop!")
stack.pop()
print("stack pop!")
stack.pop()

print("stack peek!")
print(stack.peek())

print("stack current count : \(stack.count)")

print("stack pop!")
stack.pop()
print("stack peek!")
print(stack.peek())

print("stack pop!")
stack.pop()

print("stack peek!")
print(stack.peek())
print("stack pop!")
stack.pop()
stack.push(nodeToPush: StackNode<Int>(value: 100))
print(stack.peek())
stack.push(nodeToPush: StackNode<Int>(value: 200))
print(stack.peek())
stack.push(nodeToPush: StackNode<Int>(value: 300))
stack.push(nodeToPush: StackNode<Int>(value: 400))
stack.push(nodeToPush: StackNode<Int>(value: 500))

print("stack.printAllInStackOrder()")
stack.printAllInStackOrder()

/// #18: Generic Queue
print("****************************")
print("/****** Generic Queue *****/")
print("****************************")

enum QueueError : Error {
    case peekFailure()
    case queueUnderFlow()
}

class QueueNode <T>{
    var value: T
    var next: QueueNode <T>?
    
    init(value: T) {
        self.value = value
    }
}

class Queue <T>{
    var count: Int
    var headNode: QueueNode<T>?
    
    init(headNode: QueueNode<T>) {
        self.headNode = headNode
        self.count = 1
    }
    // ADT
    /*
     * 1. enqueue
     * 2. dequeue
     * 3. printAll
     * 4. countQueueNode
     * 5. peek
     */
    func enQueue(nodeToEnqueue:QueueNode<T>) -> Void {
        if self.headNode != nil {
            var currentNode = self.headNode
            
            while currentNode?.next != nil {
                currentNode = currentNode?.next
            }
            currentNode?.next = nodeToEnqueue
            
        } else if self.headNode == nil {
            self.headNode = nodeToEnqueue
        }
        
        self.count += 1
    }
    
    func deQueue() throws -> Void {
        guard self.count >= 1 else {
            throw QueueError.queueUnderFlow()
        }
        
        self.headNode = self.headNode?.next
        
        self.count -= 1
    }
    
    func printAll() {
        var currrentNode = self.headNode
        
        while currrentNode != nil {
            currrentNode = currrentNode?.next
        }
    }
    
    func countQueueNode() -> Int {
        return self.count
    }
    
    func peek() throws -> T {
        if let value = self.headNode?.value {
            return value
        } else {
            throw QueueError.peekFailure()
        }
    }
}


let headQueueNode = QueueNode(value: 0)
let queue = Queue(headNode: headQueueNode)
queue.enQueue(nodeToEnqueue: QueueNode(value: 1))
queue.enQueue(nodeToEnqueue: QueueNode(value: 2))
queue.enQueue(nodeToEnqueue: QueueNode(value: 3))
queue.enQueue(nodeToEnqueue: QueueNode(value: 4))
queue.enQueue(nodeToEnqueue: QueueNode(value: 5))
queue.enQueue(nodeToEnqueue: QueueNode(value: 6))

let count = queue.countQueueNode()
print(count)
queue.printAll()
print("dequeue!")
try? queue.deQueue()
print("dequeue!")
try? queue.deQueue()
print("dequeue!")
try? queue.deQueue()
print("dequeue!")
try? queue.deQueue()
queue.printAll()

if let peek = try? queue.peek() {
    print("peek : \(peek)")
}


print("enqueue 100!")
queue.enQueue(nodeToEnqueue: QueueNode(value: 100))
print("enqueue 200!")
queue.enQueue(nodeToEnqueue: QueueNode(value: 200))

// since this is guaranteed,
print("peek : \(try! queue.peek())")
print("print all! ")
queue.printAll()



/// #19: Recursive search through binary tree :
print("**************************************************")
print("/****** Recursive search through binary tree *****/")
print("**************************************************")

//             100
//             /  \
//            /    \
//           /      \
//          /        \
//        83           300
//       /  \        /    \
//      20    95   105     999
//     / \   / \   / \     /  \
//    1  23 84 99 104 200 998 1001

let searchValue = 1001
let sameValueList = [100, 300, 83, 20, 95, 105, 999, 1, 23, 84, 99, 104, 200, 998, 1001]
var searchCount = 0

//print("/***** linear brute force searching... ***/")
//let index = sameValueList.index{
//    searchCount += 1
//    print("\(searchCount) times search executed!");
//    return $0 == searchValue
//}

class TreeNode {
    let value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int, left: TreeNode?, right: TreeNode?) {
        self.value = value
        self.left = left
        self.right = right
    }
}
/* tree construction */
// leaf node
let node1 = TreeNode(value: 1, left:nil , right: nil)
let node23 = TreeNode(value: 23, left:nil , right: nil)
let node84 = TreeNode(value: 84, left:nil , right: nil)
let node99 = TreeNode(value: 99, left:nil , right: nil)
let node104 = TreeNode(value: 104, left:nil , right: nil)
let node200 = TreeNode(value: 200, left:nil , right: nil)
let node998 = TreeNode(value: 998, left:nil , right: nil)
let node1001 = TreeNode(value: 1001, left:nil , right: nil)

// left tree construction
let node20 = TreeNode(value: 20, left:node1 , right: node23)
let node95 = TreeNode(value: 95, left:node84, right: node99)
let node83 = TreeNode(value: 83, left:node20, right: node95)

// right tree construnction
let node105 = TreeNode(value: 105, left:node104, right: node200)
let node999 = TreeNode(value: 999, left:node998, right: node1001)
let node300 = TreeNode(value: 300, left:node105, right: node999)

// root node
let rootNode100 = TreeNode(value: 100, left:node83, right: node300)

func searchBinaryTree(for searchValue : Int, rootNode: TreeNode?) -> Bool {
    searchCount += 1
    print("\(searchCount) times search executed!")
    if rootNode == nil {
        return false
    }
    
    if (searchValue == rootNode?.value) {
        return true
    } else {
        if searchValue > (rootNode?.value)! {
            return searchBinaryTree(for: searchValue, rootNode: rootNode?.right)
        } else if searchValue < (rootNode?.value)! {
            return searchBinaryTree(for: searchValue, rootNode: rootNode?.left)
        }
    }
    return false
}

print("/***** BST searching... ***/")
searchCount = 0
let isFound = searchBinaryTree(for: searchValue, rootNode: rootNode100)
print(isFound)


print("end of the program!")
