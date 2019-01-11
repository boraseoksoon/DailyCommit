//
//  String+Extension.swift
//  EnglishWordCount
//
//  Created by Seoksoon Jang on 11/01/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

import Cocoa

extension String {
  func isEntireWhiteSpaceString() -> Bool {
    if self == "" {
      return true
    } else {
      var whiteSpaceCount = 0
      self.forEach {
        if $0 == " " {
          whiteSpaceCount+=1
        }
      }
      
      return whiteSpaceCount == self.count ? true : false
    }
  }
}

