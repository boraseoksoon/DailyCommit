//
//  SignUpViewModel.swift
//  RxLogin
//
//  Created by Seoksoon Jang on 2017. 10. 9..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift
//protocol ViewModelOutput {
//  //  var number: Observable<Int> { get }
//}
//
//protocol ViewModelType {
//  var inputs: ViewModelInput { get }
//  var outputs: ViewModelOutput { get }
//}
//
//protocol ViewModelInput {
//  func request1()
//  func request2()
//  func request3()
//}
//
//extension ViewModelInput {
//  func request1() {}
//  func request2() {}
//  func request3() {}
//}

struct SignUpViewModel {
  let dataSource = Variable<[SignUpUsers]>([])
  
  var idText = Variable<String>("")
  var passwordText = Variable<String>("")
  var profileImagePath = Variable<String>("")
  var profileImageData = Variable<Data>(Data())
  
  var isValid: Observable<Bool> {
    return Observable.combineLatest(idText.asObservable(), passwordText.asObservable()) { id, password in
      id.count > 6 && password.count > 6
    }
  }
  
  init() {
    // 'Realm' Read
    // signUpUsers = realm.objects(SignUpUsers.self)
  }
  
  func update(_ signUpUserModel: SignUpUsers, complete: (() -> Void)? = nil) -> Void {
    // edit
    try! realm.write {
      // 'Realm' Update
      signUpUserModel.id = idText.value
      signUpUserModel.password = passwordText.value
      signUpUserModel.profileImageData = profileImageData.value
      
      if let complete = complete {
        complete()
      }
    }
  }
  
  func addSignUpUser(complete: (() -> Void)? = nil) -> Void {
    // write
    let signUpUser = SignUpUsers()
    signUpUser.id = idText.value
    signUpUser.password = passwordText.value
    signUpUser.profileImagePath = profileImagePath.value
    signUpUser.profileImageData = profileImageData.value

    try! realm.write {
      // 'Realm' Create
      realm.add(signUpUser)
    }
    
    if let complete = complete {
      complete()
    }
  }
  
  func delete(_ signUpUserModel: SignUpUsers, complete: (() -> Void)? = nil) -> Void {
    try! realm.write {
      // 'Realm' Delete
      realm.delete(signUpUserModel)
      
      self.dataSource.value.removeAll()
      for user in signUpUsers {
        self.dataSource.value.append(user)
      }
    }
    
    if let complete = complete {
      complete()
    }
  }
}
