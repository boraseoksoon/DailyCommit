//
//  Unit.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 29..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

protocol Unit {
    func attack(weapon: Weapon?)
}

class ConcreteUnit : Unit {
    private var attackPoint: Int = 0
    
    init(AP attackPoint: Int) {
        self.attackPoint = attackPoint
    }
    
    func attack(weapon: Weapon?) {
        if weapon == nil {
            print("punch attack!")
        } else {
            weapon!.attack(unitAP: self.attackPoint)
        }
    }
}

class Marine: ConcreteUnit {}
class Firebat: ConcreteUnit {}
class Ghost: ConcreteUnit {}
class Medic: ConcreteUnit {}
