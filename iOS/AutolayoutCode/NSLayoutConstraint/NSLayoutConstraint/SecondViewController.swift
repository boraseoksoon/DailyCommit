//
//  SecondViewController.swift
//  NSLayoutConstraint
//
//  Created by Seoksoon Jang on 2017. 9. 11..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  @IBOutlet var exampleTopYConstraint: NSLayoutConstraint!
  @IBOutlet var exampleXConstraint: NSLayoutConstraint!
  
  @IBOutlet var exampleLabel: UILabel!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("SecondViewController!")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    let codedLabel:UILabel = UILabel()
    codedLabel.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
    codedLabel.textAlignment = .center
    codedLabel.text = "isActive and Anchor"
    codedLabel.numberOfLines=1
    codedLabel.textColor=UIColor.red
    codedLabel.font=UIFont.systemFont(ofSize: 22)
    codedLabel.backgroundColor=UIColor.lightGray
    
    self.view.addSubview(codedLabel)
    codedLabel.translatesAutoresizingMaskIntoConstraints = false
    codedLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
    codedLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
//    codedLabel.centerXAnchor.constraint(equalTo: codedLabel.superview!.centerXAnchor).isActive = true
//    codedLabel.centerYAnchor.constraint(equalTo: codedLabel.superview!.centerYAnchor).isActive = true
    
    let margins = view.layoutMarginsGuide
    
    codedLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    codedLabel.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor, constant: 10).isActive = true
    // codedLabel.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant:).isActive = true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func doCommitAction(_ sender: Any) {
    UIView.animate(withDuration: 5.0, animations: {
      
      let yConstraint = NSLayoutConstraint(item: self.exampleLabel,
                                           attribute:.centerY,
                                           relatedBy:.equal,
                                           toItem: self.view,
                                           attribute:.centerY,
                                           multiplier: 1.0,
                                           constant: 10)
      
      let xConstraint = NSLayoutConstraint(item: self.view,
                                                 attribute: .centerX,
                                                 relatedBy:.equal,
                                                 toItem: self.exampleLabel,
                                                 attribute:.centerX,
                                                 multiplier: 1.0,
                                                 constant:0)

      self.view.addConstraints([xConstraint,yConstraint])
      self.view.layoutIfNeeded()
    })
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
