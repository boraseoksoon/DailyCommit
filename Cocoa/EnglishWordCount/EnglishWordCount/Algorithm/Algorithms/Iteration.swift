//
//  Iteration.swift
//  EnglishWordCount
//
//  Created by Seoksoon Jang on 11/01/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

import Cocoa

class Iteration: WordCountable {
  init() {
    //
  }
  
  init(closure: ((_ fullText: String) -> Int)?) {
    self.closure = closure
  }
  
  var closure: ((_ fullText: String) -> Int)?
  
  func RetrieveCountOfWord(from fullText: String) -> Int {
    print("performed iteration algorithm!")
    if closure != nil {
      return closure!(fullText)
    } else {
      var theWord = ""
      var counts = 0
      
      if fullText.isEntireWhiteSpaceString() {
        return 0
      } else {
        counts+=1
        
        fullText.forEach {
          if $0 == " " {
            if theWord != " " {
              counts+=1
            } else {
              counts+=0
            }
            
            theWord = ""
          } else {
            counts+=0
          }
          
          theWord.append($0)
        }
        
        if theWord.isEntireWhiteSpaceString() {
          return counts - 1
        } else {
          return counts
        }
        
      }

    }
  }
  
}
