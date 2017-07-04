//
//  FlyImpossible.swift
//  StrategyPattern
//
//  Created by Seoksoon Jang on 2017. 7. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class FlyImpossible : Flyable {
    func fly(sender:Any) {
        print("\(type(of: sender)) can't fly!")
    }
}
