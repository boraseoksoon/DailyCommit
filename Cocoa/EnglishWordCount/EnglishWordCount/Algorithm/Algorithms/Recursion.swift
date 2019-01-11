//
//  Recursion.swift
//  EnglishWordCount
//
//  Created by Seoksoon Jang on 11/01/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

import Cocoa

class Recursion: WordCountable {
  init() {
    //
  }
  
  init(closure: ((_ fullText: String) -> Void)?) {
    self.closure = closure
  }
  
  var closure: ((_ fullText: String) -> Void)?
  
  func RetrieveCountOfWord(from fullText: String) -> Int {
    print("performed recursion algorithm!")
    
    if closure != nil {
      closure!(fullText)
      return -1
    } else {
      // leave it blank on purpose to use dynamic implementation.
      fatalError("*** YOU MUST IMPLEMENT THIS DYNAMICALLY OTHERWISE, CRASH ***\nleave it blank on purpose to use dynamic implementation.")
    }
  }
}
