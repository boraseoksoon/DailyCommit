//
//  Iterator.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation


// Swift Generator is alike Iterator rather than Python generator using yield.

// Sequence, Generator

// IteratorProtocol is Generator previously.
struct Iterator: IteratorProtocol {
    let end: Int
    var current: Int
    
    // 1
    typealias Element = Int
    
    init(start: Int, end: Int) {
        self.current = start
        self.end = end
    }
    
    // 2
    mutating func next() -> Element? {
        if self.current > end { return nil }
        
        let currentValue = self.current
        self.current+=1
        
        return currentValue
    }
}

struct IteratorSequence: Sequence {
    let start: Int
    let end: Int
    
    // 1
    typealias Generator = Iterator
    
    init(start: Int, end: Int) {
        self.start = start
        self.end = end
    }
    
    // 2
    // generate() is replaced with makeIterator now.
    func makeIterator() -> Generator {
        return Iterator(start: self.start, end: self.end)
    }
}


