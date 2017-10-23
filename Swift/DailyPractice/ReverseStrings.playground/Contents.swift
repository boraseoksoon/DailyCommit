//: Playground - noun: a place where people can play

import UIKit

/**
// Q : Reverse given string when word in string is odd number position and remove vowel in the resolved solution string.
*/

var str = "Hello Man Today was Sooooooooo good day"

func reverseWord(inString givenString: String,
                 processing: (String) -> Void,
                 complete: (String) -> Void) -> Void {
  var newWord = ""
  let wordList = givenString.components(separatedBy: " ")

  // let's not try imperative way on purpose like below.
  
//  for (index, word) in wordList.enumerated() {
//    if newWord != "" {
//      newWord += " "
//    }
//
//    if index % 2 != 0 {
//      newWord += word.reversed()
//    } else {
//      newWord += word
//    }
//  }
//  return newWord.removeVowel()

  let freeIntVariable: Int = 0
  _ = wordList.filter {
    word in
    if newWord != "" {
      newWord += " "
    }
    
    if freeIntVariable % 2 != 0 {
      newWord += word.reversed()
    } else {
      newWord += word
    }

    processing(newWord.removeVowel())
    return false
  }
  complete(newWord.removeVowel())
}

extension String {
  func removeVowel() -> String {
    var newWord = self
    for vowel in ["a", "e", "e", "o", "u"] {
      newWord = newWord.replacingOccurrences(of: vowel, with: "")
    }
    return newWord
  }
}

reverseWord(inString: str,
            processing: {
              processingSolution -> Void in
              print("processing.. : ", processingSolution)
            }, complete: {
              completedSolution -> Void in
              print("completed solution : ", completedSolution)
})
