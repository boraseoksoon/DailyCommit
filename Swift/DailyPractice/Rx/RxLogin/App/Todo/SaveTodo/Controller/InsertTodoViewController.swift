//
//  InsertTodoViewController.swift
//  RxLogin
//
//  Created by Seoksoon Jang on 2017. 10. 8..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Realm

class InsertTodoViewController: UIViewController {
  @IBOutlet var todoTextField: UITextField!
  @IBOutlet var isFinishedSwitch: UISwitch!
  @IBOutlet var saveButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
