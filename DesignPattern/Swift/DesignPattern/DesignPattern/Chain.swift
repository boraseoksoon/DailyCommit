//
//  Chain.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

protocol Chain {
    func setNextChain(_ chain: Chain)
    func calculate(_ operation: Number)
}
