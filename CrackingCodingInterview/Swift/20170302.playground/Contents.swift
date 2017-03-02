//: Playground - noun: a place where people can play

import UIKit

var str = "Cracking coding interview Questions Practice using Swift3.0!"

// Q1. Anagram : word, phrase, or name formed by rearranging the letters of another, such as cinema, formed from iceman.
/*
 * Write a method to decide if two strings are anagram or not.
 * if a one string is a permutation of another string.
 */

let qstring1 = " \nLIsTEn\t\t\n "
let qstring2 = "  sLienT\t  \n"

func isAnagram(givenString: String, givenString2: String) -> Bool {
    // step 1. remove white-space and trim
    var trimmed1 = givenString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    var trimmed2 = givenString2.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    // step 2. change all given strings to same lower case
    trimmed1 = trimmed1.lowercased()
    trimmed2 = trimmed2.lowercased()
    
    // step 3. to sort, make string to array
    let trimmedArray1 = Array(trimmed1.characters)
    let trimmedArray2 = Array(trimmed2.characters)
    
    // step 4. sort arrays
    let completedStringArray1 = trimmedArray1.sorted()
    let completedStringArray2 = trimmedArray2.sorted()

    // step 5. make arrays strings
    let readyToCompareString1 = String(completedStringArray1)
    let readyToCompareString2 = String(completedStringArray2)
    
    // step 6. let's compare values.(== is used because Swift string is VALUE type, not reference type)
    if readyToCompareString1 != readyToCompareString2 {
        return false
    }
    
    return true
}

let result = isAnagram(givenString:qstring1, givenString2:qstring2)

if result {
    print("given strings are anagram!")
} else {
    print("given strings are NOT anagram!")
}

/*
 * need to effectively reduce lines meaning 
 * more functional way optimization should be DONE when optimizating.
 */

// Q2. Remove duplicated nodes from Linked List
/*
 * Write a method to remove duplicated node from the given unsorted linked list.
 */

// Create Very Simple Linked List first
class Node <T> {
    var next:Node?
    var data:T
    
    init(data:T) {
        self.data = data
        self.next = nil
    }
}

enum LinkedListError : Error {
    case IndexOverflowError
    case NilError
    case RootNodeNilError
}

class VerySimpleLinkedList <T> {
    // ADT
    /*  Add
     *  Remove
     *  PrintAll
     */
    private var rootNode: Node<T>?
    var nodeTotalIndex: Int = 0
    
    init(rootNodeData: T) {
        rootNode = Node(data:rootNodeData)
        rootNode?.next = nil
        nodeTotalIndex = 0  // initial index, root index is 0.
    }
    func addNodeAtFirst(inputData: T) -> Node<T> {
        let newNode = Node(data:inputData)
        newNode.next = self.rootNode
        self.rootNode = newNode
        nodeTotalIndex += 1
        
        return self.rootNode!
    }
    
    func removeAtIndex(_ removeNodeIndex: Int) throws -> Node<T>? {
        // if the indexNode to remove is overflow beyond linked-list bounds.
        if removeNodeIndex > nodeTotalIndex {
            throw LinkedListError.IndexOverflowError
        }
        
        // if index is headNode.
        if (removeNodeIndex == 0) {
            if self.nodeTotalIndex == 0 {
                // only headNode exists in the linked-list.
                self.rootNode = nil
                self.rootNode?.next = nil                
            } else {
                // otherwise,
                self.rootNode = self.rootNode?.next
            }
        }
        
        // if index is tailNode.
        else if nodeTotalIndex == removeNodeIndex {
            var iterateNode = self.rootNode
            var indexIterated: Int = 0
            var prevNode: Node<T> = self.rootNode!
            
            while iterateNode != nil {
                if iterateNode?.next == nil {
                    // found out tailNode.
                    prevNode.next = nil
                    iterateNode = nil
                    
                    break
                    
                } else {
                    prevNode = iterateNode!
                    iterateNode = iterateNode?.next
                    indexIterated += 1
                }
            }
        }
        
        // other cases : index in the middle of linked list.
        else {
            var prevNode: Node<T> = self.rootNode!
            var iterateNode = rootNode
            var iteratedNodeIndex: Int = 0

            while iterateNode != nil {
                
                if removeNodeIndex == iteratedNodeIndex {
                    // let's remove the target node.
                    prevNode.next = iterateNode?.next
                    iterateNode?.next = nil
                    iterateNode = prevNode
                }
                
                if let safetyIteratedNode = iterateNode {
                    prevNode = safetyIteratedNode
                } else {
                    throw LinkedListError.NilError
                }
                
                iterateNode = iterateNode?.next
                iteratedNodeIndex += 1
            }
        }
        
        nodeTotalIndex -= 1
        return self.rootNode
    }
    
    func getTotalNumberOfNode() -> Int {
        return self.nodeTotalIndex + 1
    }
    
    func printAll() -> Void {
        guard self.rootNode != nil else {
            print("self.rootNode in the list is nil!")

            return
        }
        
        var iterateNode = self.rootNode
        var indexIterated: Int = 0
        
        while iterateNode != nil {
            print("linked-list[\(indexIterated)] : \(iterateNode?.data)")
            iterateNode = iterateNode?.next
            indexIterated += 1
        }
    }
    
    // the function for anwser to question
    func removeDuplicatedNodes() throws -> Node <T>? {
        guard self.rootNode != nil else {
            print("self.rootNode is nil!")
            
            throw LinkedListError.RootNodeNilError
        }
        
        var dict = [String:Bool]()
        
        var prevNode = self.rootNode
        var iteratedNode = self.rootNode
        var indexIterated: Int = 0
        
        while iteratedNode != nil {
            if let safetyNodeData = iteratedNode?.data {
                let key = String(describing:safetyNodeData)

                // if list contains any duplicated nodes
                if  dict[key] == true {
                    prevNode?.next = iteratedNode?.next
                    iteratedNode = iteratedNode?.next
                    self.nodeTotalIndex -= 1
                } else {
                    // if list does NOT contains any duplicated node.
                    prevNode = iteratedNode
                    iteratedNode = iteratedNode?.next
                    indexIterated += 1
                }
//                dict.updateValue(true, forKey:key)
                dict[key] = true
            }
        }

        return self.rootNode
    }
}

let vslist = VerySimpleLinkedList(rootNodeData:0)
vslist.addNodeAtFirst(inputData:7)
vslist.addNodeAtFirst(inputData:4)
vslist.addNodeAtFirst(inputData:4)
vslist.addNodeAtFirst(inputData:4)
vslist.addNodeAtFirst(inputData:4)
vslist.addNodeAtFirst(inputData:7)
vslist.addNodeAtFirst(inputData:1)
vslist.addNodeAtFirst(inputData:3)
vslist.addNodeAtFirst(inputData:3)
vslist.addNodeAtFirst(inputData:4)
vslist.addNodeAtFirst(inputData:5)
vslist.addNodeAtFirst(inputData:7)
vslist.addNodeAtFirst(inputData:9)
vslist.addNodeAtFirst(inputData:9)
vslist.addNodeAtFirst(inputData:3)
vslist.addNodeAtFirst(inputData:1)      // root node

print("before using removeDuplicatedNodes")
vslist.printAll()
print("total number of node : \(vslist.getTotalNumberOfNode())")
/*
 linked-list[0] : Optional(1)
 linked-list[1] : Optional(3)
 linked-list[2] : Optional(9)
 linked-list[3] : Optional(9)
 linked-list[4] : Optional(7)
 linked-list[5] : Optional(5)
 linked-list[6] : Optional(4)
 linked-list[7] : Optional(3)
 linked-list[8] : Optional(3)
 linked-list[9] : Optional(1)
 linked-list[10] : Optional(7)
 linked-list[11] : Optional(4)
 linked-list[12] : Optional(4)
 linked-list[13] : Optional(4)
 linked-list[14] : Optional(4)
 linked-list[15] : Optional(7)
 linked-list[16] : Optional(0)

 */

do {
    try vslist.removeDuplicatedNodes()
} catch {
    print("error!")
}


print("after using removeDuplicatedNodes")
vslist.printAll()
print("total number of node : \(vslist.getTotalNumberOfNode())")

/*
 linked-list[0] : Optional(1)
 linked-list[1] : Optional(3)
 linked-list[2] : Optional(9)
 linked-list[3] : Optional(7)
 linked-list[4] : Optional(5)
 linked-list[5] : Optional(4)
 linked-list[6] : Optional(0)
*/


do {
    try vslist.removeAtIndex(0)
    try vslist.removeAtIndex(0)
    try vslist.removeAtIndex(0)
    try vslist.removeAtIndex(0)
    try vslist.removeAtIndex(0)
    try vslist.removeAtIndex(0)
    try vslist.removeAtIndex(0)
    
} catch LinkedListError.NilError {
    print("LinkedListError.NilError")
} catch LinkedListError.IndexOverflowError {
    print("LinkedListError.IndexOverflowError")
} catch {
    print("not defined error")
}
print("")
vslist.printAll()
print("")



// Q3. Reverse String
/*
 * Write a method to reverse ordered string.
 */

// Using Native API
let orderedString = "ABCDEFG"
print("ordered-String : \(orderedString)")
let reversedString = String(orderedString.characters.reversed())
print("reversed-String using Swift built-in API : \(reversedString)")

// Using Stack Data Structure LIFO
// Create Very Simple Stack DS.
class VerySimpleStack <T> {
    // ADT
    /*
     * Push
     * Pop
     * PrintAll
     * GetStackSize
     */
    private var stackTotalIndex = 0
    private var topNode: Node<T>?
    
    init (rootNodeData: T) {
        let newNode = Node(data:rootNodeData)
        self.topNode = newNode
        self.topNode?.next = nil
        
        self.stackTotalIndex = 0
    }
    
    init () {
        self.topNode?.next = nil
        
        self.stackTotalIndex = 0
    }
    
    
    func push(inputData:T) -> Void {
        let newNode = Node(data:inputData)
        newNode.next = self.topNode
        self.topNode = newNode
        
        stackTotalIndex += 1
    }

    func pop() -> T? {
        let previousTopNode = self.topNode
        var newTopNode = self.topNode?.next
        self.topNode = newTopNode
        
        stackTotalIndex -= 1
        
        if previousTopNode != nil {
            return previousTopNode!.data
        }
        
        return nil
    }
    
    func popAll() -> [T]? {
        var listToReturn = [T]()
        
        var runningNode = self.topNode
        
        while runningNode != nil {
            let topNodeBeforePop = runningNode
            if topNodeBeforePop != nil {
                listToReturn.append(topNodeBeforePop!.data)
                // print(listToReturn)
            }
            
            stackTotalIndex -= 1
            runningNode = runningNode?.next
        }
        
        self.topNode = runningNode
        
        return listToReturn
    }
    
    func printAll() -> Void {
        var runningNode = self.topNode
        var indexIterated: Int = 0
        
        while runningNode != nil {
            print("stack[\(indexIterated)] : \(runningNode?.data)")
            runningNode = runningNode?.next
            indexIterated += 1
        }
    }
    
    public func getStackSize() -> Int {
        return stackTotalIndex + 1
    }
}

// Using Stack LIFO.
let orderedString2 = "HAHA HELLO WORLD HOHO!"
func reverseString(targetString: String) -> String {
    var vsStack = VerySimpleStack<Character>()
    
    for ch in targetString.characters {
        vsStack.push(inputData:ch)
    }
    var reversedString2: String = ""
    if let orderedCharactersList = vsStack.popAll() {
        for ch in orderedCharactersList {
            reversedString2 = reversedString2 + String(ch)
        }
    } else {
        print("orderedCharactersList optional binding failed!")
    }
    
    return reversedString2
}

let reversedString2 = reverseString(targetString:orderedString2)
print("reversed-String2 using the Stack : \(reversedString2)")

// vsStack.printAll()
// var newStr:String = str + String()

//var vsStack = VerySimpleStack<Int>(rootNodeData:0)
//vsStack.push(inputData:1)
//vsStack.push(inputData:2)
//vsStack.push(inputData:3)
//vsStack.push(inputData:4)
//vsStack.push(inputData:5)
//vsStack.push(inputData:6)
//vsStack.push(inputData:7)
//
//print("total number of nodes in the stack : \(vsStack.getStackSize())")
//
//vsStack.pop()
//vsStack.pop()
//vsStack.pop()
//
//print("total number of nodes in the stack : \(vsStack.getStackSize())")
//
//vsStack.printAll()






// Q4. Replace white-space in the string with %20
/*
 * Write a method to replace all whitespace in string with %20
 * input "Mr John Smith   "
 * Output "Mr%20John%20Smith"
 */

let inputString = "Mr John Smith   "

// step 1. trim the given string
let trimmedInputString = inputString.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines)

// step 2. replace white-space with %20 using Swift API.
let replacedString = trimmedInputString.replacingOccurrences(of:" ", with:"%20")
print("replacedString : \(replacedString)")




// Q5. Compress given string
/*
 * Write a method to perform basic string compression using counts of repeated Characters.
 * If the compression string would not become smaller than the original string,
 * then return original string. 
 * Additional Question => What if these length are same? => self answer to myself. Whatever you return, it's okay.
 * for example, Input:aabccccaa => Output:a2b1c4a2
 */

let input = "aabccccaa"

func compressString(givenString: String) -> String {
    var finalOutput: String = ""
    var buffer: Character? = nil
    var repeatCount = 0

    for ch in givenString.characters {
        if buffer == nil {
            finalOutput += String(ch)
            repeatCount = 1
            buffer = ch
        } else {
            if buffer == ch {
                // repeat!
                repeatCount += 1
                buffer = ch
                
            } else {
                // here new character comes!
                finalOutput += String(repeatCount)
                finalOutput += String(ch)
                repeatCount = 1
                buffer = ch
            }
        }
    }
    
    if repeatCount > 0 {
        finalOutput += String(repeatCount)
        repeatCount = 0
    }

    if (finalOutput.isLonger(stringToCompare: givenString)) {
        return givenString
    }
    
    return finalOutput
}

extension String {
    func isLonger(stringToCompare: String) -> Bool {
        if self.characters.count >= stringToCompare.characters.count {
            return true
        }
        return false
    }
}

let output = compressString(givenString:input)
print("output : \(output)")


