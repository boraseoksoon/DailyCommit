//
//  TurnTVOff.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class TurnDeviceOff : Command  {
    var theDevice: ElectronicDevice?
    
    init(newDevice: ElectronicDevice) {
        self.theDevice = newDevice
    }
    
    func execute() {
        if let theDevice = self.theDevice {
            theDevice.turnOff()
        }
    }
}
