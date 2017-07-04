//
//  Programmer.swift
//  TemplateMethodPattern
//
//  Created by Seoksoon Jang on 2017. 7. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

struct Programmer : Programmable {}

protocol Programmable {
    func readyToCoding()
    func prepareIDE()
    func prepareMobileDevice()
    func prepareDomainSkill()
    func isMobileDeviceRequired() -> Bool
    func doCode()
}

extension Programmable {
    func readyToCoding() {
        prepareIDE()
        prepareDomainSkill()
        if isMobileDeviceRequired() {
            prepareMobileDevice()
        }
        doCode()
    }
    
    func doCode() {
        print("finally, code away!")
    }
    
    func prepareIDE() {
        print("prepareIDE by default")
    }
    
    func prepareMobileDevice() {
        print("prepareMobileDevice by default")
    }
    
    func prepareDomainSkill() {
        print("prepareDomainSkill by default")
    }
    
    func isMobileDeviceRequired() -> Bool {
        return false
    }
}
