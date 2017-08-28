//
//  SubtractCalculator.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class SubtractCalculator: Chain {
    private var nextChain: Chain?
    func calculate(_ operation: Number) {
        if operation.opeationString == "-" {
            let result = operation.number1 - operation.number2
            print("subtract calculator makes \(result)")
        } else {
            self.nextChain?.calculate(operation)
        }
    }
    
    func setNextChain(_ chain: Chain) {
        self.nextChain = chain
    }
}
