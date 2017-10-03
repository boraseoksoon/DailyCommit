//
//  ViewController.swift
//  NSLayoutConstraint
//
//  Created by Seoksoon Jang on 2017. 9. 11..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let secondView = UIView()
  let animationCommitTime = 1.0
  var isViewTransformed: Bool = false
  
  let thirdView = UIView()
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("ViewController!")
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.constraintInstall()
    
    thirdView.translatesAutoresizingMaskIntoConstraints = false
    thirdView.backgroundColor = UIColor.blue
    self.view.addSubview(thirdView)
    
    thirdView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.25).isActive = true
    thirdView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
    
    let margins = view.layoutMarginsGuide
    thirdView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    thirdView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: 10).isActive = true
  }
  
  func buttonAction(sender: UIButton!) {
    print("Button tapped")
    isViewTransformed = !isViewTransformed
  
    if isViewTransformed {
      self.changeAnimation()
    } else {
      self.getBackAnimation()
    }
  }
  
  func changeAnimation() {
    UIView.animate(withDuration: 2.0, animations: {
      self.thirdView.backgroundColor = UIColor.red
      // self.bottomConstraint.isActive = true
      self.thirdView.bottomAnchor
        .constraint(equalTo: self.bottomLayoutGuide.bottomAnchor).isActive = true
      self.view.layoutIfNeeded()
    })
  }
  
  func getBackAnimation() -> Void {
    UIView.animate(withDuration: 2.0, animations: {
      self.thirdView.backgroundColor = UIColor.blue
      self.thirdView.topAnchor.constraint(equalTo: self.topLayoutGuide.topAnchor, constant: 10).isActive = true
      self.view.layoutIfNeeded()
    })
  }

  func constraintInstall() -> Void {
    secondView.translatesAutoresizingMaskIntoConstraints = false
    secondView.backgroundColor = UIColor.orange
    self.view.addSubview(secondView)
    
    let widthConstraint = NSLayoutConstraint(item: secondView,
                                             attribute: .width,
                                             relatedBy:.equal,
                                             toItem: nil,
                                             attribute:.notAnAttribute,
                                             multiplier: 1.0,
                                             constant: 50)
    
    let heightConstraint = NSLayoutConstraint(item: secondView,
                                              attribute: .height,
                                              relatedBy:.equal,
                                              toItem: nil,
                                              attribute:.notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 50)
    
    let centerXConstraint = NSLayoutConstraint(item: secondView,
                                               attribute: .centerX,
                                               relatedBy:.equal,
                                               toItem: self.view,
                                               attribute:.centerX,
                                               multiplier: 1.0,
                                               constant: 0)
    
    let centerYConstraint = NSLayoutConstraint(item: secondView,
                                               attribute: .centerY,
                                               relatedBy:.equal,
                                               toItem: self.view,
                                               attribute:.centerY,
                                               multiplier: 1.0,
                                               constant: 0)
    
    self.view.addConstraints([widthConstraint, heightConstraint])
    self.view.addConstraints([centerXConstraint, centerYConstraint])
    
    
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .green
    button.setTitle("Test Button", for: .normal)
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    self.view.addSubview(button)
    
    let buttonWidthConstraint = NSLayoutConstraint(item:button,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: secondView,
                                                   attribute: .width,
                                                   multiplier: 0.5,
                                                   constant: 0)
    
    let buttonXConstraint = NSLayoutConstraint(item:button,
                                               attribute: .centerX,
                                               relatedBy: .equal,
                                               toItem: secondView,
                                               attribute: .centerX,
                                               multiplier: 1.0,
                                               constant: 0)
    
    let buttonYConstraint = NSLayoutConstraint(item:button,
                                               attribute: .bottom,
                                               relatedBy: .equal,
                                               toItem: secondView,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: -10)
    
    self.view.addConstraints([buttonWidthConstraint, buttonXConstraint, buttonYConstraint])
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

