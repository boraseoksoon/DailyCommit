//
//  TodoTableViewController.swift
//  RxLogin
//
//  Created by Seoksoon Jang on 2017. 10. 8..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Realm

class TodoTableViewController: UITableViewController {
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.customizationUI()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension TodoTableViewController {
  func customizationUI() -> Void {
    let saveButton = UIBarButtonItem(barButtonSystemItem: .save,
                                     target: self,
                                     action: #selector(self.saveTodo))
    self.navigationItem.rightBarButtonItem = saveButton
  }
  
  @objc func saveTodo() -> Void {
    self.performSegue(withIdentifier: "SaveTodo", sender: self)
  }
}
