//: Playground - noun: a place where people can play

import UIKit

var str = "20170308 Swift Daily Coding : Swift Basic Concept for Protocol Oriented Programming"

protocol Runnable {
    func run()
    var runnerName: String { get }
    var HP: Int { get set }
}

extension Runnable {
    func run() {
        print("running!")
    }
}

struct Human : Runnable {
    
    private var name: String
    
    // backing store
    private var _HP: Int = 0
    internal var HP: Int {
        get {
            return _HP
        }
        
        set {
            _HP = newValue * 10
        }
    }

    internal var runnerName: String {
        return self.name
    }
    
    func run() {
        print("\(self.name) is running!")
    }
    
    
    init(name: String, HP: Int) {
        self.name = name
        self._HP = HP
    }
}


/*
protocol Runnable {
    func run()
}

//extension Runnable {
//    func run() {
//        print("running!")
//    }
//}

// struct Human : Runnable {
struct Human {
    var name: String
    
//    func run() {
//        print("\(self.name) is running!")
//    }
}

extension Human : Runnable {
    func run() {
        print("\(self.name) is running!")
    }
}
*/

// memberwise initializer cannot be allowed with private var.
var h = Human(name: "JSS", HP: 100)
h.HP
h.runnerName
h.HP = 100
h.HP

protocol Initable {
    init()
    init(name:String)
}

struct TestStruct : Initable {
    var name: String
    init() {
        self.name = "기본이름"
    }
    
    init(name:String) {
        self.name = name
    }
}

class TestClass : Initable {
    var name: String
    required init() {
        self.name = "이럴때 required가 필요하다."
    }
    
    required init(name: String) {
        self.name = name
    }
}

class TestClass2 {
    var name: String?
}

class TestClass3 {
    var name: String?
}

/* multiple inheritance is not allowed. */
class TestClass4 : TestClass2, Initable {
    
    // required override is used in this case.
    required override init() {
        super.init()
        self.name = "이럴때 required가 필요하다."
    }
    
    required /* override */ init(name: String) {
        super.init()
        super.name = name
    }
}
