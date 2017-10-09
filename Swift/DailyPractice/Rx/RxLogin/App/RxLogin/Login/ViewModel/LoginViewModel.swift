//
//  LoginViewModel.swift
//  RxLogin
//
//  Created by Seoksoon Jang on 2017. 10. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
import RxSwift

protocol ViewModelOutput {
//  var number: Observable<Int> { get }
}

protocol ViewModelType {
  var inputs: ViewModelInput { get }
  var outputs: ViewModelOutput { get }
}

protocol ViewModelInput {
  func request1()
  func request2()
  func request3()
}

extension ViewModelInput {
  func request1() {}
  func request2() {}
  func request3() {}
}

struct LoginViewModel: ViewModelInput, ViewModelOutput, ViewModelType {
//  let number: Observable<Int>
  
//  init() {
//    model = Model()
//    self.number = model.number.asObservable()
//  }
  
  var inputs: ViewModelInput { return self }
  var outputs: ViewModelOutput { return self }
  
  var idText = Variable<String>("")
  var passwordText = Variable<String>("")
  
  var isValid: Observable<Bool> {
    return Observable.combineLatest(idText.asObservable(), passwordText.asObservable()) { id, password in
      id.count > 6 && password.count > 6
    }
  }
}
