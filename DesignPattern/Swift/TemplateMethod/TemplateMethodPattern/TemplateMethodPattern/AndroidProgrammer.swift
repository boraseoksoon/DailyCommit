//
//  Android.swift
//  TemplateMethodPattern
//
//  Created by Seoksoon Jang on 2017. 7. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

struct AndroidProgrammer : Programmable {
    func prepareIDE() {
        print("prepare Android studio!")
    }
    
    func prepareMobileDevice() {
        print("prepare Galaxy Phone!")
    }
    
    func prepareDomainSkill() {
        print("prepare Kotiln? Java?")
    }
    
    func isMobileDeviceRequired() -> Bool {
        return true
    }
    
    func doCode() {
        print("do Android Coding-")
    }
}
