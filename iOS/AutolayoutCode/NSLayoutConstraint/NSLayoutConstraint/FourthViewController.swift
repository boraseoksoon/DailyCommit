//
//  FourthViewController.swift
//  NSLayoutConstraint
//
//  Created by Seoksoon Jang on 2017. 9. 11..
//  Copyright © 2017년 Seoksoon Jang. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("FourthViewController!")
  }
  
  let myView = UIView()
  lazy var topAnchor: NSLayoutConstraint = {
    return self.myView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor)
  }()
  lazy var leadingAnchor: NSLayoutConstraint = {
    return self.myView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor)
  }()
  lazy var trailingAnchor: NSLayoutConstraint = {
    () -> NSLayoutConstraint in return self.myView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor)
  }()
  lazy var heightAnchor: NSLayoutConstraint = {
    return self.myView.heightAnchor.constraint(equalToConstant: 100)
  }()
  
  lazy var constraints: [NSLayoutConstraint] = {
    return [self.topAnchor, self.leadingAnchor, self.trailingAnchor, self.heightAnchor ]
  }()
  
  
  lazy var animationBottomAnchor: NSLayoutConstraint = {
    return self.myView.bottomAnchor.constraint(equalTo: /* self.bottomLayoutGuide.topAnchor */ self.view.bottomAnchor)
  }()
  lazy var animationCenterXAnchor: NSLayoutConstraint = {
    return self.myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
  }()
  lazy var animationWidthAnchor: NSLayoutConstraint = {
    () -> NSLayoutConstraint in return self.myView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.25)
  }()
  lazy var animationHeightAnchor: NSLayoutConstraint = {
    return self.myView.heightAnchor.constraint(equalTo: self.myView.widthAnchor, multiplier: 1.0, constant: 10)
  }()
  
  lazy var animationConstraints: [NSLayoutConstraint] = {
    return [self.animationBottomAnchor, self.animationCenterXAnchor, self.animationWidthAnchor, self.animationHeightAnchor ]
  }()

  static var toggleNumber: Int = 0
  @IBAction func commitAnimationAction(_ sender: Any) {
    FourthViewController.toggleNumber += 1
    
    UIView.animate(withDuration: 2.0, animations: {
      switch FourthViewController.toggleNumber % 3 {
      case 0:
        print("3")
        break
      case 1:
        print("1")
        NSLayoutConstraint.deactivate(self.constraints)
        NSLayoutConstraint.activate(self.animationConstraints)
        break
      case 2:
        print("2")
        NSLayoutConstraint.deactivate(self.animationConstraints)
        NSLayoutConstraint.activate(self.constraints)
        break
      default:
        break
      }

      self.view.layoutIfNeeded()
    })
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    myView.translatesAutoresizingMaskIntoConstraints = false
    myView.backgroundColor = UIColor.blue
    self.view.addSubview(myView)

    NSLayoutConstraint.activate(self.constraints)
    
    // NSLayoutConstraint.deactivate(animationConstraints)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
