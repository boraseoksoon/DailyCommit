//
//  SamBody.swift
//  AbstractFactory
//
//  Created by Seoksoon Jang on 2017. 8. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class SamBody : AbstractBody {
    func frame() -> Void {
        print("frame : type of value : \(self)")
    }
}
