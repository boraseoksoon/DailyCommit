//
//  Itemable.swift
//  FactoryMethod
//
//  Created by Seoksoon Jang on 2017. 7. 5..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

protocol Itemable {
    func use(sender: Any)
}

extension Itemable {
    func use(sender: Any) {
        print("item : \(type(of:sender)) is used")
    }
}
