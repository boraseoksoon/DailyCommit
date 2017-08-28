//
//  Visitor.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

protocol Visitor {
    func visit(visitable: Visitable) -> Double
}
