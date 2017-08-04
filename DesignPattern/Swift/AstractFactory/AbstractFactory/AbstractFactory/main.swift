//
//  main.swift
//  AbstractFactory
//
//  Created by Seoksoon Jang on 2017. 8. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

print("Hello, World!")

let bikeFactory: AbstractBikeFactory = SamFactory() /* GTFactory() */
let body: AbstractBody = bikeFactory.createBody()
let wheel: AbstractWheel = bikeFactory.createWheel()

body.frame()
wheel.run()
