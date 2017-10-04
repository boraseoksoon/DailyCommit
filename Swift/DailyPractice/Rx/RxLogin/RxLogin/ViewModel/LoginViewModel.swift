//
//  LoginViewModel.swift
//  RxLogin
//
//  Created by Seoksoon Jang on 2017. 10. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
import RxSwift

struct LoginViewModel {
  var idText = Variable<String>("")
  var passwordText = Variable<String>("")
  
  var isValid: Observable<Bool> {
    return Observable.combineLatest(idText.asObservable(), passwordText.asObservable()) { id, password in
      id.count > 6 && password.count > 6
    }
  }
}
