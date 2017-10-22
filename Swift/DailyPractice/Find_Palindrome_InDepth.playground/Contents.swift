//: Playground - noun: a place where people can play

import UIKit

public enum PalindromeSortOrder: Int {
    case ascendingOrder
    case descendingOrder
}

var palindromeString = "@*((#))(, EJCJKEL, racecar, anna, DJWISJDED, madam, sdaf, madam, vsrU*usc, kayak, sposksks, madam, c9ejkifaws, kayak, civic, racecar, racecar, racecar, anna,anna, anna, seoksoonjang, radar, df2qi-9, sdakjfkalsjda, KJPOIECK#(PW, mvJCIJEA, *EW*DA*UD"

/**
 // quest : return data that is made up of palindrome name key and count value
 and able to be sorted order user wants from given random string.
 */

func parse(givenString: String,
           sortStyle: PalindromeSortOrder,
           isPalindrome: (_ givenWord: String) -> Bool,
           complete: ([(String, Int)]) -> Void) -> Void {
    var intermediateHash: [String:Int] = [:]
    
    let trimmedString = givenString.trimmingCharacters(in: .whitespaces)
        .replacingOccurrences(of: " ", with: "")
    
    let wordList = trimmedString.components(separatedBy: ",")
    for word in wordList {
        // print("contaied word : ", word)
        
        // check whether or not this is palindrome.
        if isPalindrome(word) {
            if intermediateHash[word] != nil {
                intermediateHash[word] = intermediateHash[word]! + 1
            } else {
                intermediateHash[word] = 1
            }
        }
    }
    
    sortLogic(givenHash: intermediateHash, with: sortStyle) {
        result in
        complete(result)
    }
}

func sortLogic(givenHash: [String:Int],
               with sortStyle: PalindromeSortOrder,
               complete: ([(String, Int)]) -> Void) -> Void {
    var returnTupleList = [(String, Int)]()
    
    if sortStyle == .ascendingOrder {
        let sortedHash = givenHash.sorted(by: {$0.key < $1.key})
        sortedHash.forEach { element in
            returnTupleList.append((element.key, element.value))
        }
        complete(returnTupleList)
    } else if sortStyle == .descendingOrder {
        let sortedHash = givenHash.sorted(by: {$0.key > $1.key})
        var returnTupleList = [(String, Int)]()
        sortedHash.forEach { element in
            returnTupleList.append((element.key, element.value))
        }
        complete(returnTupleList)
    }
}

let imperativeWay = { (givenWord:String) -> Bool in
    let ceilNumber = Int(ceil(Double(givenWord.count / 2)))
    
    let frontOfWord = givenWord[0..<ceilNumber]
    let lastOfWord = String(givenWord.reversed()[0..<ceilNumber])
    
    if frontOfWord == lastOfWord {
        return true
    } else {
        return false
    }
}
// imperativeWay

let simpleWay = { (givenWord:String) -> Bool in
    if givenWord == String(givenWord.reversed()) {
        return true
    } else {
        return false
    }
}
// simpleWay

let IMPERATIVE_KEY = "imperativeWay"
let SIMPLE_KEY = "simpleWay"

var functionList = [String:((String) -> Bool)]()
functionList[IMPERATIVE_KEY] = imperativeWay
functionList[SIMPLE_KEY] = simpleWay

functionList

parse(givenString: palindromeString,
      sortStyle: .descendingOrder,
      isPalindrome: functionList[IMPERATIVE_KEY]!) {
        result in
        print("desceding result : ", result)
}

parse(givenString: palindromeString,
      sortStyle: .ascendingOrder,
      isPalindrome: functionList[SIMPLE_KEY]!) {
        result in
        print("ascending result : ", result)
}

// String index-access extension
extension String {
    subscript (r: CountableClosedRange<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
        let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return String(self[startIndex...endIndex])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let startIndex =  self.index(self.startIndex, offsetBy: bounds.lowerBound)
        let endIndex = self.index(startIndex, offsetBy: bounds.upperBound - bounds.lowerBound)
        return String(self[startIndex..<endIndex])
    }
}
