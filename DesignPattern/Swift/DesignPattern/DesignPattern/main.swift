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

print("/********* Structural *********/")

print("/* Adapter Pattern */")
print("/* Bridge Pattern */")
print("/* Composite Pattern */")
print("/* Decorater Pattern */")
print("/* Facade Pattern */")
print("/* Flyweight Pattern */")
print("/* Proxy Pattern */")

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

print("/* Template Method Pattern */")
print("/* Strategy Pattern */")
print("/* State Pattern */")




