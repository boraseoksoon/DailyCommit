//
//  InsertTodoViewController.swift
//  RealmTest
//
//  Created by Seoksoon Jang on 2017. 9. 20..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
import Realm

class InsertTodoViewController: UIViewController {
  var incomingTodo: Todo? = nil
  
  @IBOutlet var todoTextField: UITextField!
  @IBOutlet var isFinishedSwitch: UISwitch!

  @IBAction func saveAction(_ sender: Any) {
    guard let text = todoTextField.text else { return }
    
    if let incomingTodo = incomingTodo {
      // edit
      try! realm.write {
        // 'Realm' Update
        incomingTodo.todoText = text
        incomingTodo.isDone = isFinishedSwitch.isOn
      }
    } else {
      // write
      let todo = Todo()
      todo.todoText = text
      todo.isDone = isFinishedSwitch.isOn
      
      try! realm.write {
        // 'Realm' Create
        realm.add(todo)
      }
    }
    
    self.navigationController?
      .popViewController(animated: true)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    if let incomingTodo = incomingTodo {
      todoTextField.text = incomingTodo.todoText
      isFinishedSwitch.setOn(incomingTodo.isDone, animated: false)
    }
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
