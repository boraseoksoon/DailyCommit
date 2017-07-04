//
//  Dragon.swift
//  StrategyPattern
//
//  Created by Seoksoon Jang on 2017. 7. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class Dragon : Animal {
    override init() {
        super.init()
        // flyable = FlyPossible()
        self.setFlyable(flyable: FlyPossible())
    }
}
