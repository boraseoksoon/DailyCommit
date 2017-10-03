//
//  ThirdViewController.swift
//  NSLayoutConstraint
//
//  Created by Seoksoon Jang on 2017. 9. 11..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit
/* NSLayoutConstraint examples */
class ThirdViewController: UIViewController {
  let myView = UIView()
  let subView = UIView()
  var isAnimationCommit: Bool = false
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("ThirdViewController!")
  }
  
  
  lazy var viewConstraint: [NSLayoutConstraint] = {
    return [
      NSLayoutConstraint(item: self.myView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: self.view.frame.size.height * 0.25),
      
      NSLayoutConstraint(item: self.myView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1.0, constant: 0),
      
      NSLayoutConstraint(item: self.myView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.75, constant: 0),
      
      NSLayoutConstraint(item: self.myView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.25, constant: 0)
    ]
  }()
  
  lazy var animatedViewConstraint: [NSLayoutConstraint] = {
    return [
      NSLayoutConstraint(item: self.myView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0),
      
      NSLayoutConstraint(item: self.myView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0),
      
      NSLayoutConstraint(item: self.myView, attribute: .width, relatedBy: .equal, toItem: self.myView, attribute: .height, multiplier: 1.0, constant: 0),
      
      NSLayoutConstraint(item: self.myView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.25, constant: 0),
    ]
  }()
  
  lazy var animatedSubViewConstraint: [NSLayoutConstraint] = {
    return [
      NSLayoutConstraint(item: self.myView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0),
      
      NSLayoutConstraint(item: self.myView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0),
      
      NSLayoutConstraint(item: self.myView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.25, constant: 0),
      
      NSLayoutConstraint(item: self.myView, attribute: .width, relatedBy: .equal, toItem: self.myView, attribute: .height, multiplier: 1.0, constant: 0)
    ]
  }()
  
  lazy var subViewConstraint: [NSLayoutConstraint] = {
    return [
      NSLayoutConstraint(item: self.subView, attribute: .bottom, relatedBy: .equal, toItem: self.myView, attribute: .top, multiplier: 1.0, constant: 0),
      
      NSLayoutConstraint(item: self.subView, attribute: .centerX, relatedBy: .equal, toItem: self.myView, attribute: .centerX, multiplier: 1.0, constant: 0),
      
      NSLayoutConstraint(item: self.subView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.25, constant: 0),
      
      NSLayoutConstraint(item: self.subView, attribute: .width, relatedBy: .equal, toItem: self.myView, attribute: .width, multiplier: 1.0, constant: 0)
    ]
  }()
  
  @IBAction func animationCommitAction(_ sender: Any) {
    isAnimationCommit = !isAnimationCommit
    
    UIView.animate(withDuration: 2.0, animations: {
      if self.isAnimationCommit {
        print("self.isAnimationCommit!")
        NSLayoutConstraint.deactivate(self.viewConstraint)
        NSLayoutConstraint.activate(self.animatedViewConstraint)
      } else {
        print("self.isAnimationCommit else!")
        NSLayoutConstraint.deactivate(self.animatedViewConstraint)
        NSLayoutConstraint.activate(self.viewConstraint)
      }
      self.view.layoutIfNeeded()
    })
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    
    // Do any additional setup after loading the view.
    myView.backgroundColor = UIColor.black
    myView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(myView)

    NSLayoutConstraint.activate(viewConstraint)
    
    subView.backgroundColor = UIColor.red
    subView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(subView)
    
    NSLayoutConstraint.activate(subViewConstraint)
    
    
    /*
    // NSLayoutConstraints
    // [1]
    let viewConstraints = [
      NSLayoutConstraint(item: myView, attribute: .top, relatedBy: .equal, toItem: topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0),
      NSLayoutConstraint(item: myView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1.0, constant: 0),
      NSLayoutConstraint(item: myView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1.0, constant: 0),
      NSLayoutConstraint(item: myView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
    ]
    
    // [2]
    NSLayoutConstraint.activate(viewConstraints)
    
//    myView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
//    myView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true
//    myView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true
//    myView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    */
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
