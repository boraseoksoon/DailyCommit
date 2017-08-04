//
//  GTWheel.swift
//  AbstractFactory
//
//  Created by Seoksoon Jang on 2017. 8. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class GTWheel : AbstractWheel {
    func run() -> Void {
        print("run : type of value : \(self)")
    }
}
