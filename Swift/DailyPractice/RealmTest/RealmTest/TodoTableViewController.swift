//
//  TodoTableTableViewController.swift
//  RealmTest
//
//  Created by Seoksoon Jang on 2017. 9. 20..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
import RealmSwift

// 'Realm' Model
class Todo: Object {
  @objc dynamic var todoText: String = ""
  @objc dynamic var isDone: Bool = false
}

// 'Realm' Global Instances
var todos: Results<Todo>!
var realm = try! Realm()

class TodoTableViewController: UITableViewController {
  @objc func saveTodo() -> Void {
    self.performSegue(withIdentifier: "SaveTodo", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "SaveTodo" {
      /*
       */
    } else if segue.identifier == "EditTodo" {
      let destination = segue.destination as! InsertTodoViewController
      destination.incomingTodo = todos[self.tableView.indexPathForSelectedRow!.row]
    }
  }
  
  func customizationUI() -> Void {
    let saveButton = UIBarButtonItem(barButtonSystemItem: .save,
                                     target: self,
                                     action: #selector(self.saveTodo))
    self.navigationItem.rightBarButtonItem = saveButton
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.customizationUI()
    
    // 'Realm' Read
    todos = realm.objects(Todo.self)
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.reloadData()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let todo = todos[indexPath.row]
      try! realm.write {
        // 'Realm' Delete
        realm.delete(todo)
      }
      self.tableView.reloadData()
    }
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell",
                                             for: indexPath) as! TodoTableViewCell
    
    let todo = todos[indexPath.row]
    cell.jobListLabel.text = todo.todoText
    cell.isDone.setOn(todo.isDone, animated: false)
    cell.isDone.tag = indexPath.row
    cell.isDone.addTarget(self,
                          action:#selector(self.didSwitchChanged),
                          for:UIControlEvents.touchUpInside)

    // Configure the cell...
    return cell
  }
  
  @objc func didSwitchChanged(sender: Any) -> Void {
    let switchButton = sender as! UISwitch
    print("didSwitchChanged : \(switchButton.tag)")
    
    let todo = todos[switchButton.tag]
    try! realm.write {
      // 'Realm' Update2
      todo.isDone = switchButton.isOn
    }
  }
}
