//
//  WordCountable.swift
//  EnglishWordCount
//
//  Created by Seoksoon Jang on 11/01/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

import Cocoa

// Applying strategy pattern..
protocol WordCountable {
  func RetrieveCountOfWord(from fullText: String) -> Int
}
