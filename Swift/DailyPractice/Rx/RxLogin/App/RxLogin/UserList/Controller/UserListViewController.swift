//
//  UserListViewController.swift
//  RxLogin
//
//  Created by Seoksoon Jang on 2017. 10. 9..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RealmSwift

class UserListViewController: UIViewController {
  let disposeBag = DisposeBag()
  @IBOutlet var tableView: UITableView!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    signUpViewModel.dataSource.value.removeAll()
    for user in signUpUsers {
      signUpViewModel.dataSource.value.append(user)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    self.title = "USER LIST"
    self.setUpTableView()
    self.customizationUI()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "EditUserInfo" {
      let destination = segue.destination as! SignUpViewController
      destination.incommingSignUpUser =  signUpUsers[self.tableView.indexPathForSelectedRow!.row]
      destination.signUpButtonText = "Edit"
    } else if segue.identifier == "SignUp" {
      let destination = segue.destination as! SignUpViewController
      destination.signUpButtonText = "Sign Up"
    }
  }
}

extension UserListViewController {
  @objc func goToSignUpViewController() -> Void {
    self.performSegue(withIdentifier: "SignUp", sender: self)
  }

  fileprivate func setUpTableView() {
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserListTableViewCell")

    signUpViewModel.dataSource.asObservable()
      .bind(to: tableView.rx.items(cellIdentifier: "UserListTableViewCell",
                                   cellType: UITableViewCell.self))
      { (row, element, cell) in
        
        cell.textLabel?.text = "\(row) @ ID : \(element.id) @ PASSWORD : \(element.password)"
        cell.textLabel?.font = UIFont(name: "System", size: 10)
        cell.accessoryType = .disclosureIndicator

        if let image = UIImage(data: element.profileImageData) {
          cell.imageView?.image = image
        }
      }
      .disposed(by: disposeBag)
    
    self.tableView.rx
      .modelSelected(SignUpUsers.self)
      .subscribe(onNext:  { signUpUser in
        print("\(signUpUser) tapped!")
        self.performSegue(withIdentifier: "EditUserInfo", sender: self)
      })
      .disposed(by: disposeBag)
    
    self.tableView.rx.modelDeleted(SignUpUsers.self)
      .subscribe(onNext: { [unowned self] signUpUser in
        print("\(signUpUser) delete tapped!")
        signUpViewModel.delete(signUpUser)
      })
      .disposed(by: disposeBag)
  }
  
  func customizationUI() -> Void {
    let saveButton = UIBarButtonItem(barButtonSystemItem: .save,
                                     target: self,
                                     action: #selector(self.goToSignUpViewController))
    self.navigationItem.rightBarButtonItem = saveButton
  }
}
