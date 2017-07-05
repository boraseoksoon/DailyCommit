//
//  ItemCreatorable.swift
//  FactoryMethod
//
//  Created by Seoksoon Jang on 2017. 7. 5..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

protocol ItemCreatorable {
    func createItem() -> Item
    func requestItemLog() -> Void
    func writeDataToDB() -> Void
    func returnCreateCompletedItem() -> Item
}

extension ItemCreatorable {
    func createItem() -> Item {
        requestItemLog()
        writeDataToDB()
        return returnCreateCompletedItem()
    }
    
    func requestItemLog() -> Void {
        print("requestItemLog!")
    }
    
    func writeDataToDB() -> Void {
        print("writeDataToDB!")
    }
    
    func returnCreateCompletedItem() -> Item {
        return Item()
    }
}
