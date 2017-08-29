//
//  Weapon.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 29..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

protocol Weapon {
    func attack(unitAP: Int)
}

class ConcreteWeapon: Weapon {
    fileprivate var attackPoint: Int = 0
    
    init(AP attackPoint: Int) {
        self.attackPoint = attackPoint
    }
    
    func attack(unitAP: Int) {
        if attackPoint < 0 {
            print("cure : \(attackPoint)")
        } else {
            print("attack!! :  \(unitAP + attackPoint)")
        }
    }
}

class CureSyringe: ConcreteWeapon {
    override init(AP attackPoint: Int) {
        super.init(AP: attackPoint)
        self.attackPoint = -attackPoint
    }
}
class Rifle: ConcreteWeapon {}
class SniperGun: ConcreteWeapon {}
class FirebatShotgun: ConcreteWeapon {}


