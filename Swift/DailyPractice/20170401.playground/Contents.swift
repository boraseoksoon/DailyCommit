//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "20170401, daily swift coding : Grand Central Dispatch Basic-Part repeat"

// dispatch queue repeat for swift 3.0.

// create serial queue by default
let serialQueue = DispatchQueue(label: "queuename")
serialQueue.sync {
    
}

// create concurrent queue
let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
concurrentQueue.sync {
    
}

// get main queue provided by iOS system(Main UI Thtread) and do job asynchronously
DispatchQueue.main.async {
    // do some work.
}

// get global background thread queue provided by iOS system and do job asynchronously
DispatchQueue.global(qos: .default).async {
    // do some work.
}

// most common pattern to use

// Run on a background thread prepared by system to do some long running and heavy work
DispatchQueue.global(qos: .userInitiated).async {
    
    // run on the main thread to update the UI
    DispatchQueue.main.async {
        
    }
}

// to run something in 5.0 seconds
DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
    // your code here
    print("do some work in 5.0")
}


// Dispatch group
let DISPATCH_GROUP_LABEL = "test"
let dispatchGroup = DispatchGroup()
let dispatchQueue1 = DispatchQueue(label:DISPATCH_GROUP_LABEL)
let dispatchQqueue2 = DispatchQueue(label:DISPATCH_GROUP_LABEL)
let dispatchQqueue3 = DispatchQueue(label:DISPATCH_GROUP_LABEL)

dispatchQueue1.async(group: dispatchGroup) {
    print("queue1 finished")
}
dispatchQqueue2.async(group: dispatchGroup) {
    print("queue2 finished")
}
dispatchQqueue3.async(group: dispatchGroup) {
    print("queue3 finished")
}

dispatchGroup.notify(queue: DispatchQueue.main) {
    print("entire dispatch group works finished")
}

// iOS continuous job like Android Service
let queue = DispatchQueue.global()

queue.async { () -> Void in
    while true {
        sleep(1)
        print("do continue to work on while true")
        DispatchQueue.main.async {
            print("do some work after finished job.")
        }
    }
}

// dispatch work item
let workItem = DispatchWorkItem {
    print("workItem!")
}
workItem.perform()

let workItem2 = DispatchWorkItem(qos: .userInitiated,
                              flags: .assignCurrentContext) {
    print("workItem2!")
}

DispatchQueue.global().async(execute: workItem2)
// DispatchQueue.global(qos:.default).async(execute: workItem2)
//workItem2.cancle()
//workItem2.wait()
// workItem2.wait(timeout: DispatchTime(uptimeNanoseconds: 1 * 1000000000))


// dispatch assert
let globalQueue = DispatchQueue.global(qos: .userInitiated)
let mainQueue = DispatchQueue.main

mainQueue.async {
    dispatchPrecondition(condition: .notOnQueue(mainQueue))
    print("This code won't execute")
}

globalQueue.async {
    dispatchPrecondition(condition: .onQueue(globalQueue))
    print("This code will execute")
}

// dispatch_once is deprecated
final class ClassSample {
    static let sharedInstance = ClassSample()
    
    private init() {
    }
    
    var _CLASS_ID: Int = 1
    var CLASS_ID: Int {
        get {
            return _CLASS_ID
        }
        set (newVal) {
            if newVal > 0 {
                _CLASS_ID = newVal
            } else {
                print("ERROR")
            }
        }
    }
    
    var CLASS_COUNT: Int = 0 {             // An explicit type is required
        willSet(newClassCount) {          // Called before the prop is set
            CLASS_COUNT = newClassCount + 1  // Warning. Can't set within its own willSet
            print("willSet : \(CLASS_COUNT)")
        }
        didSet {                            // Called after a new val is set
            print("didset : \(CLASS_COUNT - oldValue)")    // oldValue is magically defined
        }
    }
}

ClassSample.sharedInstance.CLASS_ID
ClassSample.sharedInstance.CLASS_ID = 0
ClassSample.sharedInstance.CLASS_ID

ClassSample.sharedInstance.CLASS_COUNT = 1
print(ClassSample.sharedInstance.CLASS_COUNT)


