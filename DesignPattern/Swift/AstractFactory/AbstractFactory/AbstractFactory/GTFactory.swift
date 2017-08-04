//
//  GTFactory.swift
//  AbstractFactory
//
//  Created by Seoksoon Jang on 2017. 8. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class GTFactory : AbstractBikeFactory {
    func createBody() -> AbstractBody {
        return GTBody()
    }
    func createWheel() -> AbstractWheel {
        return GTWheel()
    }
}
