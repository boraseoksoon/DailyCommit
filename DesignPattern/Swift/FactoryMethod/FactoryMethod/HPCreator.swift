//
//  HPCreator.swift
//  FactoryMethod
//
//  Created by Seoksoon Jang on 2017. 7. 5..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class HPCreator : ItemCreator {
    func createItem() -> HPPotion {
        requestItemLog()
        writeDataToDB()
        return returnCreateCompletedItem()
    }
    
    func returnCreateCompletedItem() -> HPPotion {
        return HPPotion()
    }
}
