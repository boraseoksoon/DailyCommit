//
//  Television.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class Television : ElectronicDevice {
    var volume: Int = 0
    
    func turnOff() {
        print("\(self) is turnOff")
    }
    
    func turnOn() {
        print("\(self) is turnOn")
    }
    
    func volumeDown() {
        if volume > 0 {
            volume -= 1
        }
        
        print("\(self) is volumeDown : \(volume)")
    }
    
    func volumeUp() {
        
        if volume < 10 {
            volume += 1
        }

        print("\(self) is volumeDown : \(volume)")
    }
}
