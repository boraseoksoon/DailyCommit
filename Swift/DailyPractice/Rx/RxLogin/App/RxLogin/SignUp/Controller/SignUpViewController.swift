//
//  SingUpViewController.swift
//  RxLogin
//
//  Created by Seoksoon Jang on 2017. 10. 9..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {
  let disposeBag = DisposeBag()
  var profileImageData: Data?
  var incommingSignUpUser: SignUpUsers?
  var signUpButtonText: String = "Sign Up"
  
  @IBOutlet var profileImageView: UIImageView!
  @IBOutlet var idTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  @IBOutlet var signUpButton: UIButton!
  
  lazy var cameraButton: UIButton = {
    let button = UIButton()
    // button.backgroundColor = UIColor.purple
    button.setTitle("Camera Button", for: .normal)
    button.setTitleColor(self.view.tintColor, for: .normal)
    button.setTitleColor(.white, for: .highlighted)
    return button
  }()

  lazy var galleryButton: UIButton = {
    let button = UIButton()
    // button.backgroundColor = UIColor.purple
    button.setTitle("Gallery Button", for: .normal)
    button.setTitleColor(self.view.tintColor, for: .normal)
    button.setTitleColor(.white, for: .highlighted)
    return button
  }()
  
  private (set) lazy var bottomStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [cameraButton, galleryButton])
    stackView.distribution = .fillEqually
    
    return stackView
  }()
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
//    if let imageData = self.profileImageData {
//      if let image = UIImage(data: imageData) {
//        profileImageView.image = image
//      }
//    }
    
    if let signUpUser = incommingSignUpUser {
      idTextField.text =  signUpUser.id
      passwordTextField.text = signUpUser.password
      if let image = UIImage(data: signUpUser.profileImageData) {
        profileImageView.image = image
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    self.title = "SIGN UP"
    self.signUpButton.setTitle(signUpButtonText, for: .normal)
    
    setUpRx()
    setupBottomStackView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension SignUpViewController {
  func setUpRx() {
    _ = idTextField.rx.text.map { $0 ?? "" }.bind(to:signUpViewModel.idText)
    _ = passwordTextField.rx.text.map { $0 ?? "" }.bind(to:signUpViewModel.passwordText)

    signUpButton.rx.tap
      .subscribe(onNext: { [weak self]  in
        print("signUpButton tapped!")
        
        if self?.signUpButtonText != "Edit" {
          signUpViewModel.addSignUpUser() {
            let alertView = UIAlertController(title: "Info", message: "Add Completed!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
              self?.navigationController?.popViewController(animated: true)
            })
            
            alertView.addAction(action)
            self?.present(alertView, animated: true, completion: nil)
          }
        } else {
          signUpViewModel.update((self?.incommingSignUpUser!)!) {
            let alertView = UIAlertController(title: "Info", message: "Update Completed!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
              self?.navigationController?.popViewController(animated: true)
            })
            
            alertView.addAction(action)
            self?.present(alertView, animated: true, completion: nil)
          }
        }
      })
      .disposed(by: disposeBag)
    
    if signUpButtonText != "Edit" {
      _ = signUpViewModel.isValid.bind(to:signUpButton.rx.isEnabled)
    }
    
    signUpViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
      if self.signUpButtonText != "Edit" {
        self.signUpButton.titleLabel?.text = isValid ? "signUpButton Button is now Enable" : "signUpButton is now Not Enable"
        self.signUpButton.tintColor = isValid ? UIColor.blue : UIColor.red
      }
    }).addDisposableTo(disposeBag)

    
    cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    
    cameraButton.rx.tap
      .flatMapLatest { [weak self] _ in
        return UIImagePickerController.rx.createWithParent(self) { picker in
          picker.sourceType = .camera
          picker.allowsEditing = false
          }
          .flatMap { $0.rx.didFinishPickingMediaWithInfo }
          .take(1)
      }
      .map { info in
        return info[UIImagePickerControllerOriginalImage] as! UIImage
      }
      .bind(to: profileImageView.rx.image)
      .disposed(by: disposeBag)
    
    galleryButton.rx.tap
      .flatMapLatest { [weak self] _ in
        return UIImagePickerController.rx.createWithParent(self) { picker in
          picker.sourceType = .photoLibrary
          picker.allowsEditing = false
          }
          .flatMap {
            $0.rx.didFinishPickingMediaWithInfo
          }
          .take(1)
      }
      .map { info in
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let data = UIImageJPEGRepresentation(image, 0.1)
        self.profileImageData = data

        return data!
      }
      .bind(to: signUpViewModel.profileImageData)
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
