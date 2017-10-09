//
//  Todo.swift
//  RxLogin
//
//  Created by Seoksoon Jang on 2017. 10. 9..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
import RealmSwift

// 'Realm' Model
class Todo: Object {
  @objc dynamic var todoText: String = ""
  @objc dynamic var isDone: Bool = false
}
