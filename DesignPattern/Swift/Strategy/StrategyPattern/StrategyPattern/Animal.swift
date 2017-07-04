//
//  File.swift
//  StrategyPattern
//
//  Created by Seoksoon Jang on 2017. 7. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class Animal {
    private var isFeed: Bool = false
    private var flyable: Flyable?
    
    init() {
        flyable = FlyImpossible()
    }
    
    func introduceToMySelf() {
        print("Hello, My kind is \(type(of: self))")
    }
    
    func performFly() {
        self.flyable?.fly(sender:self)
    }
    
    func getFood() {
        print("it's time to get food! I think I have another power!")
        
        if !isFeed {
            isFeed = true
        }
        if flyable is FlyImpossible {
            flyable = FlyPossible()
        }
    }
    
    func setFlyable(flyable: Flyable) -> Void {
        self.flyable = flyable
    }
}
