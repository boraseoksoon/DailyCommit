//
//  Employee.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 29..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class Employee {
    var name: String
    var dept: String
    var salary: Int
    
    var subordinates:[Employee]?
    
    init(name: String, dept: String, salary: Int) {
        self.name = name
        self.dept = dept
        self.salary = salary
    }
}
