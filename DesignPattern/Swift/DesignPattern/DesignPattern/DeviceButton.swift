//
//  DeviceButton.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class DeviceButton {
    private var theCommand: Command!
    
    init(newCommand: Command) {
        self.theCommand = newCommand
    }
    
    func press() {
        self.theCommand.execute()
    }
}
