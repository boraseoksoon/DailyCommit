//
//  SiegeTank.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 6. 27..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class SiegeTank {
    var unitStatus: UnitStatus = NormalStatus()
    
    func attack() -> Void {
        unitStatus.attack(sender: self)
    }
    
    func move() -> Void {
        unitStatus.attack(sender: self)
    }
    
    func attacked(_unitStatus: UnitStatus?) -> Void {
        if let safetyUnitStatus = _unitStatus {
            self.unitStatus = safetyUnitStatus
        } else {
            print("parameter unitStatus is nil!")
        }
        
    }
}
