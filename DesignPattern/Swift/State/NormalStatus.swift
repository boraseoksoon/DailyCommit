//
//  NormalStatus.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 6. 27..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class NormalStatus : UnitStatus {
    func attack(sender: Any) {
        print("\(sender) is Normal status now, do attack!")
    }
    
    func move(sender: Any) {
        print("\(sender) is Normal status now, do move!")
    }
}
