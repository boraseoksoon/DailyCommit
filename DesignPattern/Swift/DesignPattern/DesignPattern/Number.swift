//
//  Number.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class Number {
    var number1: Int = 0
    var number2: Int = 0
    var opeationString: String = "+"
    
    init(number1: Int, number2: Int, opeationString: String) {
        self.number1 = number1
        self.number2 = number2
        self.opeationString = opeationString
    }
}
