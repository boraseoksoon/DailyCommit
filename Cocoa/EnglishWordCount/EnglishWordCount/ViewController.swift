//
//  ViewController.swift
//  EnglishWordCount
//
//  Created by Seoksoon Jang on 11/01/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
  @IBOutlet var textView: NSScrollView!
  @IBOutlet var worldsCountLabel: NSTextField!
  @IBOutlet var calculateButton: NSButton!
  private lazy var algorithm = { [unowned self] in
    return AlgorithmContainer(initAlgorithm: FunctionalWay())
  }()
  
  @IBAction func setFunctionalAction(_ sender: Any) {
    algorithm.algorithmType = .functional
  }
  
  @IBAction func setIterateAction(_ sender: Any) {
    algorithm.algorithmType = .iterate
  }
  
  @IBAction func calculateAction(_ sender: Any) {
    let counts = algorithm.performToRetrieveCountOfWord(
      from: (textView.documentView as! NSTextView).string
    )
    worldsCountLabel.stringValue = String(counts)
    worldsCountLabel.sizeToFit()

    // dynamically change
//    algorithm.genericAlgorithm = Iteration()
//
//    let counts2 = algorithm.performToRetrieveCountOfWord(
//      from: (textView.documentView as! NSTextView).string
//    )
//    worldsCountLabel.stringValue = String(counts2)
//    worldsCountLabel.sizeToFit()

    
    // Recursion for fun(logic is not done yet)
//    algorithm.genericAlgorithm = Recursion(closure: { fullText in
//      RecurWordCount(fullWordList: fullText.components(separatedBy: " ")) { [unowned self] tot in
//        print("tot : ", tot)
//        self.worldsCountLabel.stringValue = String(tot)
//        self.worldsCountLabel.sizeToFit()
//      }
//    })
//
//    _ = algorithm.performToRetrieveCountOfWord(
//      from: (textView.documentView as! NSTextView).string
//    )
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }
}

// 개어거지 재귀지만...예외처리 안되어있음
func RecurWordCount(fullWordList: [String],
                    totalWordCount: Int = 0,
                    reachBottom: ((_ totalWordCount: Int) -> (Void))? = nil) -> Void {
  var mutateFullWordList = fullWordList
  let last = mutateFullWordList.popLast()
  
  if fullWordList.count == 0 {
    // base case
    reachBottom?(totalWordCount)
  } else {
    RecurWordCount(fullWordList: mutateFullWordList, totalWordCount: totalWordCount + 1) { tot in      reachBottom?(tot)
    }
  }
}
