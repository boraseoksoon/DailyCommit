//
//  main.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

print("/********* Creational *********/")

print("/* Factory Method Pattern */")

print("/* Abstract Factory Pattern */")

print("/* Singleton Pattern */")

print("/* Builder Pattern */")

print("/* Prototype Pattern */")


print("")
print("")
print("")
print("")
print("/********* Structural *********/")

print("/* Adapter Pattern */")

print("/* Bridge Pattern */")
let marine: Marine = Marine(AP: 5)
let medic: Medic = Medic(AP: 3)
let ghost: Ghost = Ghost(AP: 8)
let firebat: Firebat = Firebat(AP: 10)

marine.attack(weapon: Rifle(AP: 10))
marine.attack(weapon: CureSyringe(AP: 30))

medic.attack(weapon: FirebatShotgun(AP: 100))

print("/* Composite Pattern */")

print("/* Decorater Pattern */")

print("/* Facade Pattern */")

print("/* Flyweight Pattern */")

print("/* Proxy Pattern */")


print("")
print("")
print("")
print("")
print("/********* Behavioral *********/")

print("/* Chain Of Responsibility Pattern */")
var addCalculator: Chain = AddCalculator()
var subtractCalculator: Chain = SubtractCalculator()
var multiplytractCalculator: Chain = MultiplyCalculator()
var dividetractCalculator: Chain = DivideCalculator()

addCalculator.setNextChain(subtractCalculator)
subtractCalculator.setNextChain(multiplytractCalculator)
multiplytractCalculator.setNextChain(dividetractCalculator)

let numberRequest: Number = Number(number1: 40, number2: 20, opeationString: "!")
addCalculator.calculate(numberRequest)


print("/* Command Pattern */")

var television: ElectronicDevice = Television()
var turnOnCommand : Command = TurnDeviceOn(newDevice: television)
var turnOffCommand : Command = TurnDeviceOff(newDevice: television)
var volumeDownCmmand : Command = TurnDeviceDown(newDevice: television)
var volumeUpCommand : Command = TurnDeviceUp(newDevice: television)

var invoker = DeviceButton(newCommand:turnOnCommand)

invoker.press()

invoker = DeviceButton(newCommand:turnOffCommand)

invoker.press()


invoker = DeviceButton(newCommand:volumeUpCommand)

invoker.press()
invoker.press()

invoker = DeviceButton(newCommand:volumeDownCmmand)

invoker.press()
invoker.press()

print("/* Iterator Pattern */")

let range = IteratorSequence(start: 10, end: 13)

for i in range {
    print(i)
}

print("/* Interpreter Pattern */")


print("/* Mediator Pattern */")

print("/* Memento Pattern */")

print("/* Observer Pattern */")

print("/* Visitor Pattern */")

// visitors
let taxVisitor: Visitor = TaxVisitor()
let taxHolidayVisitor: Visitor = TaxHolidayVisitor()

// visitables
let necessityItem: Visitable = NecessityItem()
let tobaccoItem: Visitable = TobaccoItem()
let liquorItem: Visitable = LiquorItem()

print("necessityItem.accept(visitor: taxVisitor) : \(necessityItem.accept(visitor: taxVisitor))")
print("tobaccoItem.accept(visitor: taxVisitor) : \(tobaccoItem.accept(visitor: taxVisitor))")
print("liquorItem.accept(visitor: taxVisitor) : \(liquorItem.accept(visitor: taxVisitor))")

print("necessityItem.accept(visitor: taxHolidayVisitor) : \(necessityItem.accept(visitor: taxHolidayVisitor))")
print("tobaccoItem.accept(visitor: taxHolidayVisitor) : \(tobaccoItem.accept(visitor: taxHolidayVisitor))")
print("liquorItem.accept(visitor: taxHolidayVisitor) : \(liquorItem.accept(visitor: taxHolidayVisitor))")


print("/* Template Method Pattern */")

print("/* Strategy Pattern */")

print("/* State Pattern */")


