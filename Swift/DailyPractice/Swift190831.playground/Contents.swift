import Foundation

// Given a string with repeated characters, rearrange the string so that no two adjacent characters are the same.
// Write a function to satisfy the requirements given above.

// for example,
//input: "aaabbc"
//output: "ababac"
//
//input: "aaac"
//output: ""

func function(input: String) -> String {
    guard !input.isEmpty,
             input.count >= 2
        else { return "" }
    
    var longestLengthOfCharacterMap: [Character: [Character]] = [:]
    var longestCharacterArrayLength = 0
   
    var restOfCharacterMap: [Character: [Character]] = [:]
    input.enumerated().forEach { _, char in
        let characterArray = input.filter { $0 == char }
        
        if longestCharacterArrayLength < characterArray.count {
            longestLengthOfCharacterMap = [:]
            longestCharacterArrayLength = characterArray.count
            longestLengthOfCharacterMap.updateValue(input.filter { $0 == char }, forKey: char)
        } else {
            restOfCharacterMap.updateValue(input.filter { $0 == char }, forKey: char)
        }
    }
    print(longestLengthOfCharacterMap)
    print(restOfCharacterMap)

    var isAllSingleCharacterInLongest = true
    var isAllSingleCharacterInShortest = true
    
    longestLengthOfCharacterMap.values.forEach {
        if ($0.count != 1) {
            isAllSingleCharacterInLongest = false
            return
        }
    }
    
    restOfCharacterMap.values.forEach {
        if ($0.count != 1) {
            isAllSingleCharacterInShortest = false
            return
        }
    }
    
    if isAllSingleCharacterInShortest && isAllSingleCharacterInLongest {
        return input
    } else {
        guard longestLengthOfCharacterMap.keys.count == 1 else { return "" }
        restOfCharacterMap = restOfCharacterMap.filter { $0.key != longestLengthOfCharacterMap.keys.first!  }
        
        let longestCharacters = longestLengthOfCharacterMap.values.reduce([], +)
        let otherCharacters = restOfCharacterMap.values.reduce([], +)
        var mutateOtherCharacters = otherCharacters
        
        guard otherCharacters.count == longestCharacters.count else { return "" }
        
        var resultArray = [String]()
        longestCharacters.enumerated().forEach { index, longChar in
            guard let shortChar = mutateOtherCharacters.popLast() else { return }
            
            resultArray.append(String(longChar))
            resultArray.append(String(shortChar))
        }
        
        return resultArray.joined(separator:"")

    }
}

//input: "aaabbc"
//output: "ababac"

let res = function(input: "abcdeaappaaa")
res

//func re() { "Swift!" }
//
//let ret = re()
//print(" ret : \(ret)")
//
//
//// Iterable
//struct Incrementer: Sequence, IteratorProtocol {
//    typealias Element = Int
//
//    var value: Int = 0
//
//    init(initValue: Int) {
//        self.value = initValue
//    }
//
//    mutating func next() -> Int? {
//        value+=1
//        return value
//    }
//}
//
//
//var inc = Incrementer(initValue: 10)
//(type(of: inc.prefix(10)))
//
//for x in inc.prefix(10) {
//    print(x)
//}
//
////inc.next()
////inc.next()
////inc.next()
////inc.next()
////inc.next()
////inc.next()
//
//
//
