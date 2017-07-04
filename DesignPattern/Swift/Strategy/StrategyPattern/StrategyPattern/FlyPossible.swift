//
//  FlyPossible.swift
//  StrategyPattern
//
//  Created by Seoksoon Jang on 2017. 7. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class FlyPossible : Flyable {
    func fly(sender: Any) {
        print("\(type(of: sender)) is now flying high!")
    }
}
