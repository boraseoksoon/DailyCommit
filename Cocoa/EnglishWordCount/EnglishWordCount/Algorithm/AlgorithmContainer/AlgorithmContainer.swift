//
//  AlgorithmContainer.swift
//  EnglishWordCount
//
//  Created by Seoksoon Jang on 11/01/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

import Cocoa

class AlgorithmContainer {
  enum AlgorithmType {
    case iterate
    case recursion
    case functional
  }
  
  init() {
    genericAlgorithm = Iteration()
  }
  
  init(initAlgorithm: WordCountable) {
    genericAlgorithm = initAlgorithm
    
    switch initAlgorithm {
    case is Iteration:
      algorithmType = .iterate
    case is Recursion:
      algorithmType = .recursion
    case is FunctionalWay:
      algorithmType = .functional
    default:
      algorithmType = .iterate
      genericAlgorithm = Iteration()
    }
  }
  
  private var _algorithmType: AlgorithmType!
  public var algorithmType: AlgorithmType! {
    get {
      return _algorithmType
    }
    set {
      _algorithmType = newValue
      
      if let _algorithmType = _algorithmType {
        switch _algorithmType {
        case .iterate:
          genericAlgorithm = Iteration()
        case .functional:
          genericAlgorithm = FunctionalWay()
        case .recursion:
          genericAlgorithm = Recursion()
        }
      }
    }
  }
  
  private var _genericAlgorithm: WordCountable!
  public var genericAlgorithm: WordCountable! {
    get {
      return _genericAlgorithm
    }
    set {
      _genericAlgorithm = newValue
    }
  }
  
  public func performToRetrieveCountOfWord(from sourceText: String) -> Int {
    return genericAlgorithm.RetrieveCountOfWord(from: sourceText)
  }
}
