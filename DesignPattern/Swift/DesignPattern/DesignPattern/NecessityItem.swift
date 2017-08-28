//
//  NecessityItem.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class TobaccoItem: Visitable {
    var price: Double = 100
    
    func accept(visitor: Visitor) -> Double {
        return visitor.visit(visitable: self)
    }
}
