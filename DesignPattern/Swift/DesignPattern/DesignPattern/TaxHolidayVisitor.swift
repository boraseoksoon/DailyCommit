//
//  TaxHolidayVisitor.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class TaxHolidayVisitor : Visitor {
    private var necessityTaxRatio = 10.39 / 2.0
    private var tobaccoTaxRatio = 25.14 / 2.0
    private var liquorTaxRatio = 40.62 / 2.0
    
    func visit(visitable: Visitable) -> Double {
        if visitable is NecessityItem, case let visitable = visitable as! NecessityItem {
            return (visitable.price * necessityTaxRatio) + visitable.price
        } else if visitable is TobaccoItem, case let visitable = visitable as! TobaccoItem {
            return (visitable.price * tobaccoTaxRatio) + visitable.price
        } else if visitable is LiquorItem, case let visitable = visitable as! LiquorItem {
            return (visitable.price * liquorTaxRatio) + visitable.price
        }
        
        return 0.0
    }
}
