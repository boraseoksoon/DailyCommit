//
//  FunctionalWay.swift
//  EnglishWordCount
//
//  Created by Seoksoon Jang on 11/01/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

import Cocoa

class FunctionalWay: WordCountable {
  func RetrieveCountOfWord(from fullText: String) -> Int {
    print("performed functional way algorithm!")
    return fullText
      .components(separatedBy: " ")
      .filter { $0 != "" }
      .count
  }
}
