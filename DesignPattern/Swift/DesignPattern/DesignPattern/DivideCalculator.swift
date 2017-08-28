//
//  DivideCalculator.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class DivideCalculator: Chain {
    private var nextChain: Chain?
    func calculate(_ operation: Number) {
        if operation.opeationString == "/" {
            let result = operation.number1 / operation.number2
            print("DivideCalculator calculator makes \(result)")
        } else {
            print("you did input wrong operator.\nonly '+', '-', '*', '/' operators are supported.")
        }
    }
    
    func setNextChain(_ chain: Chain) {
        self.nextChain = chain
    }
}

