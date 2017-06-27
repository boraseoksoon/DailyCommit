//
//  main.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 6. 27..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

print("Hello, State Pattern!!")

// state pattern
let siegeTankInstance: SiegeTank = SiegeTank()

siegeTankInstance.attack()
siegeTankInstance.move()

siegeTankInstance.attacked(_unitStatus: BlindStatus())
siegeTankInstance.attack()
siegeTankInstance.move()

siegeTankInstance.attacked(_unitStatus: LockdownStatus())
siegeTankInstance.attack()
siegeTankInstance.move()
