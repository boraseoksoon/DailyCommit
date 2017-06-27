//
//  BlindStatus.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 6. 27..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class BlindStatus : UnitStatus {
    func attack(sender: Any) {
        print("\(sender) is BlindStatus status now, attack is possible but your scope range is 1!")
    }
    
    func move(sender: Any) {
        print("\(sender) is  status now, move possible but your scope range is 1!")
    }
}
