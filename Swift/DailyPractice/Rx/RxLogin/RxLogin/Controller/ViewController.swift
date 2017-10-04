//
//  ViewController.swift
//  RxLogin
//
//  Created by Seoksoon Jang on 2017. 10. 4..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  @IBOutlet var idTextField: UITextField!
  
  @IBOutlet var passwordTextField: UITextField!
  @IBOutlet var loginButton: UIButton!
  @IBOutlet var loginEnableLabel: UILabel!
  
  var loginViewModel = LoginViewModel()
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
    
    setupRx()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setupRx() {
    _ = idTextField.rx.text.map { $0 ?? "" }.bind(to:loginViewModel.idText)
    _ = passwordTextField.rx.text.map { $0 ?? "" }.bind(to:loginViewModel.passwordText)
    
    loginButton.rx.tap
      .subscribe(onNext: { [weak self] in
        print("login can go and do your job!")
      })
      .disposed(by: disposeBag)

    _ = loginViewModel.isValid.bind(to:loginButton.rx.isEnabled)
    
    loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
      self.loginEnableLabel.text = isValid ? "Login Button is now Enable" : "Login Button is now Not Enable"
      self.loginEnableLabel.textColor = isValid ? UIColor.blue : UIColor.red
    }).addDisposableTo(disposeBag)
  }
}
