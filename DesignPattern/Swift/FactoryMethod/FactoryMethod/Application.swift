//
//  Application.swift
//  FactoryMethod
//
//  Created by Seoksoon Jang on 2017. 7. 5..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class Application {
    func executePattern() {
        print("**** HP Potion Creating... ****")
        var creator: ItemCreator = HPCreator()
        var item: Item = (creator as! HPCreator).createItem()
        item.use(sender: item)
        
        print("")
        
        print("**** MP Potion Creating... ****")
        creator = MPCreator()
        item = (creator as! MPCreator).createItem()
        item.use(sender: item)
    }
}
