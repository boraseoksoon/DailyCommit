//: Playground - noun: a place where people can play

import UIKit

var str = "Few Ways to Bind Data in Swift"

/* Data Binding */

// KVO
class Model: NSObject {
    @objc dynamic var value: Int
    
    override init() {
        value = 0
    }
}

class Observer: NSObject {
    var model = Model()
    
    init(model: Model) {
        super.init()
        self.model = model
        model.addObserver(self, forKeyPath: "value", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        if let newValue = change?[.newKey] {
            print("[KVO] value changed : \(newValue)")
        }
    }
    
    deinit {
        model.removeObserver(self, forKeyPath: "value", context: nil)
    }
}

var model = Model()
model.value = 0
model.value = 1
model.value = 2


var observer = Observer(model: model)
model.value = 3
model.value = 4
model.value = 5

// Delegate

protocol Changable: NSObjectProtocol {
    func valueDidChange(changedValue: Int)
}

class DelegateModel: NSObject {
    var value: Int {
        didSet {
            delegate?.valueDidChange(changedValue: self.value)
        }
    }
    weak var delegate: Changable?
    
    init(value: Int) {
        self.value = value
    }
}

class DelegateTarget: NSObject, Changable {
    override init() {
        super.init()
        let delegateModel = DelegateModel(value: 0)
        delegateModel.value = 0
        delegateModel.value = 1
        delegateModel.value = 2
        delegateModel.delegate = self
        delegateModel.value = 3
        delegateModel.value = 4
        delegateModel.value = 5
    }
    
    func valueDidChange(changedValue: Int) {
        print("[Delegate] valueDidChange : ", changedValue)
    }
}

let test = DelegateTarget()

// FRP(RxSwift)
// Skip since using framework in playground is sort of bothering job.

// Property Observer
struct PropertyObserver {
    var value: String {
        didSet {
            print("[Property Observer] value Changed : ", value)
        }
    }
}

// property observer ignored initializing time.
var propertyObserver = PropertyObserver(value: "A")
propertyObserver.value = "B"
propertyObserver.value = "C"
propertyObserver.value = "D"

// Boxing
class Boxing<T> {
    typealias Listener = ((T) -> Void)?
    private var listener: Listener
    public var value: T {
        didSet {
            listener!(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    public func bind(listener: Listener) {
        self.listener = listener
        listener!(value)
    }
}

var likeUISliderValue: Double = 0.0

let box = Boxing<Double>(10.0)
box.bind {
    likeUISliderValue = $0
    print("[Boxing] value Changed : ", $0)
}

box.value = 0.0
likeUISliderValue

box.value = 1.0
likeUISliderValue

box.value = 2.0
likeUISliderValue

box.value = 3.0
likeUISliderValue
