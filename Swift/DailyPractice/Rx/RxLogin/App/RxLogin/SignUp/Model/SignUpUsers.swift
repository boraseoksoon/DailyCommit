//
//  SignUpUsers.swift
//  RxLogin
//
//  Created by Seoksoon Jang on 2017. 10. 9..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
import RealmSwift

// 'Realm' Model
class SignUpUsers: Object {
  @objc dynamic var id: String = ""
  @objc dynamic var password: String = ""
  @objc dynamic var profileImagePath: String = ""
  @objc dynamic var profileImageData: Data = Data()
}
