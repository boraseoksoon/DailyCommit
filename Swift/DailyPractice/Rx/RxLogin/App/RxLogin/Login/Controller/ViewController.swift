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
import RealmSwift

class ViewController: UIViewController {
  @IBOutlet var idTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  @IBOutlet var loginButton: UIButton!
  @IBOutlet var loginEnableLabel: UILabel!
  @IBOutlet var signUpButton: UIButton!
  @IBOutlet var userListButton: UIButton!
  
  var loginViewModel = LoginViewModel()
  
  private (set) lazy var bottomStackView: UIStackView = {
    let redView = UIView()
    redView.backgroundColor = .red
    
    let blueView = UIView()
    blueView.backgroundColor = .blue
    
    let blackView = UIView()
    blackView.backgroundColor = .black
    
    let button = UIButton()
    button.backgroundColor = UIColor.purple
    button.setTitle("RxButton", for: .normal)
    button.setTitleColor(self.view.tintColor, for: .normal)
    button.setTitleColor(.white, for: .highlighted)
    
    _ = button.rx.tap.bind {
      print("button tapped")
    }

    let stackView = UIStackView(arrangedSubviews: [redView, blueView, blackView, button])
    stackView.distribution = .fillEqually
  
    return stackView
  }()
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
    
    setupRx()
    setupBottomStackView()
    // testRx()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension ViewController {
  fileprivate func testRx() {
    
    // Just
    _ = Observable<String>.just("Just 😁").subscribe(onNext: {
      element in print("element : ", element)
    }, onCompleted: {
      print("I am done.😆")
    })
    
    // repeatElement
    //    _ = Observable<String>
    //      .repeatElement("🤣 Repeat!")
    //      .throttle(1.0, scheduler: MainScheduler.instance)
    //      .subscribe(onNext:{ element in print("onNext : ", element) },
    //                 onError:{ error in print("onError : ", error) },
    //                 onCompleted: { print("It's done!")},
    //                 onDisposed: {print("onDisposed!")})
    // Of
    
    // Create
    _ = Observable<Int>.create { observer -> Disposable in
      observer.onNext(1)
      observer.onNext(2)
      observer.onNext(3)
      observer.onNext(4)
      return Disposables.create()
      }.map { $0 * 10 }
      .subscribe(onNext:{ element in print("Create \(element)") }
    )
  }
  
  fileprivate func setupRx() {
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
    
//    signUpButton.rx.tap
//      .subscribe(onNext: { [weak self]  in
//        print("signUpButton tapped!")  
//      })
//      .disposed(by: disposeBag)
    
    userListButton.rx.tap
      .subscribe(onNext: { [weak self]  in
        print("userList tapped!")
      })
      .disposed(by: disposeBag)
  }
  
  fileprivate func setupBottomStackView() -> Void {
    self.view.addSubview(bottomStackView)
    
    bottomStackView.translatesAutoresizingMaskIntoConstraints = false
    
    let stackViewBottomAnchor = bottomStackView.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor)
    let stackViewLeadingAnchor = bottomStackView.leadingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leadingAnchor)
    let stackViewTrailingAnchor = bottomStackView.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor)
    let stackViewHeightAnchor = bottomStackView.heightAnchor.constraint(equalToConstant: 50)
    
    let stackViewAnchorList = [stackViewHeightAnchor,
                               stackViewBottomAnchor,
                               stackViewLeadingAnchor,
                               stackViewTrailingAnchor]
    
    NSLayoutConstraint.activate(stackViewAnchorList)
  }
}
