//
//  main.swift
//  StrategyPattern
//
//  Created by Seoksoon Jang on 2017. 7. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

print("Hello, World!")

let dragonTom: Animal = Dragon()
let dogMichale: Animal = Dog()
let birdJolly: Animal = Bird()

print("* Dragon *")
dragonTom.introduceToMySelf()
dragonTom.performFly()
print("")

print("* Dog *")
dogMichale.introduceToMySelf()
dogMichale.performFly()
print("")

print("* Bird *")
birdJolly.introduceToMySelf()
birdJolly.performFly()
print("")

print("* dog is not eating food....* ")
// dogMichale.getFood()
dogMichale.setFlyable(flyable: FlyPossible())
dogMichale.performFly()
print("")
