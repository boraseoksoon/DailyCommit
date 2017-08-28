//
//  main.swift
//  DesignPattern
//
//  Created by Seoksoon Jang on 2017. 8. 28..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

print("/* Visitor Pattern */")

print("/* Chain Of Responsibility Pattern */")

print("/* Observer Pattern */")

print("/* Command Pattern */")

var television: ElectronicDevice = Television()
var turnOnCommand : Command = TurnDeviceOn(newDevice: television)
var turnOffCommand : Command = TurnDeviceOff(newDevice: television)
var volumeDownCmmand : Command = TurnDeviceDown(newDevice: television)
var volumeUpCommand : Command = TurnDeviceUp(newDevice: television)

var invoker = DeviceButton(newCommand:turnOnCommand)

invoker.press()
invoker.press()
invoker.press()
invoker.press()

invoker = DeviceButton(newCommand:turnOffCommand)

invoker.press()
invoker.press()
invoker.press()

invoker = DeviceButton(newCommand:volumeUpCommand)

invoker.press()
invoker.press()
invoker.press()
invoker.press()

invoker = DeviceButton(newCommand:volumeDownCmmand)

invoker.press()
invoker.press()



