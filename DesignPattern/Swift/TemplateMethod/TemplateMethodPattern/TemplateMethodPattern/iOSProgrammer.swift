//
//  iOSProgrammer.swift
//  TemplateMethodPattern
//
//  Created by Seoksoon Jang on 2017. 7. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

struct iOSProgrammer : Programmable {
    func readyToCoding() {
        // switch method order if you want.
        if isMobileDeviceRequired() {
            prepareMobileDevice()
        }
        prepareDomainSkill()
        prepareIDE()
        doCode()
    }
    
    func prepareIDE() {
        print("prepare Xcode!")
    }
    
    func prepareMobileDevice() {
        print("prepare iPhone!")
    }
    
    func prepareDomainSkill() {
        print("prepare Swift, Cocoa framework")
    }
    
    // like hook.
    func isMobileDeviceRequired() -> Bool {
        return true
    }
    
    func doCode() {
        print("do iOS Coding-")
    }
}
