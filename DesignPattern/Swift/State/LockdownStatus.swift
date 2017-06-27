//
//  LockdownStatus.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 6. 27..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class LockdownStatus : UnitStatus {
    func attack(sender: Any) {
        print("\(sender) is Lockdown status now, attack is impossible!")
    }
    
    func move(sender: Any) {
        print("\(sender) is Lockdown status now, move is impossible!")
    }
}
