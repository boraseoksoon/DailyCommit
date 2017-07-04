//
//  Bird.swift
//  StrategyPattern
//
//  Created by Seoksoon Jang on 2017. 7. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class Bird : Animal {
    override init() {
        super.init()
        self.setFlyable(flyable: FlyImpossible())
    }
}
