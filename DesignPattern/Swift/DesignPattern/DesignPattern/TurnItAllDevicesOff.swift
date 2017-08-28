//
//  TurnItAllOff.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class TurnItAllDevicesOff : Command  {
    var theDevices: [ElectronicDevice]?
    
    init(newDevices: [ElectronicDevice]) {
        self.theDevices = newDevices
    }
    
    func execute() {
        if let theDevices = self.theDevices {
            for d in theDevices {
                d.turnOff()
            }
        }
    }
}
