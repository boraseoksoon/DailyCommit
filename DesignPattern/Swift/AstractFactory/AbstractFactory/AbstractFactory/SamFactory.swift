//
//  SamFactory.swift
//  AbstractFactory
//
//  Created by Seoksoon Jang on 2017. 8. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import Foundation

class SamFactory : AbstractBikeFactory {
    func createBody() -> AbstractBody {
        return SamBody()
    }
    func createWheel() -> AbstractWheel {
        return SamWheel()
    }
}
