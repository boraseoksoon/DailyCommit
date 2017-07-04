//
//  main.swift
//  TemplateMethodPattern
//
//  Created by Seoksoon Jang on 2017. 7. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

print("Hello, World!")

print("")
print("* iOS hacker ready to code *")
let iOSDeveloper: iOSProgrammer = iOSProgrammer()
iOSDeveloper.readyToCoding()
print("********************************")

print("")
print("* android hacker ready to code *")
let androidDeveloper: AndroidProgrammer = AndroidProgrammer()
androidDeveloper.readyToCoding()
print("********************************")

print("")
print("* backend hacker ready to code *")
let backendDeveloper: BackEndProgrammer = BackEndProgrammer()
backendDeveloper.readyToCoding()
print("********************************")
