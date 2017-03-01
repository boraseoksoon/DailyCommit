//: Playground - noun: a place where people can play

import UIKit

var str = "Swift3.0 Daily Practice 20170228 : Whatever."

// Generic Stack
class Node<T> {
    let value: T
    var next: Node?
    init(value: T) {
        self.value = value
    }
}

class Stack<T> {
    var top: Node<T>?
    
    func push(_ value: T) -> Void {
        let oldTop = top
        top = Node(value: value)
        top?.next = oldTop
    }
    
    func pop() -> T? {
        let currentTop = top
        top = top?.next
        return currentTop?.value
    }
    
    func peek() -> T? {
        return top?.value
    }
}

struct User {
    let name: String
    let userName: String
}

let me = User(name:"JSS", userName:"@jss")
let you = User(name:"YOU", userName:"@you")

let userStack = Stack<User>()
userStack.push(me)
userStack.push(you)

let user1 = userStack.pop()
let user2 = userStack.pop()

user1?.name
user1?.userName

user2?.name
user2?.userName

let intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
intStack.push(3)

intStack.pop()
intStack.pop()
intStack.pop()

// Override property 
enum Color {
    case Black
    case Blue
    case Red
}

class Base {
    var color : Color {
        return .Black
    }
}

class Colorful : Base {
    override var color : Color {
        return .Blue
    }
}

// Property Observer
struct Student {
    var GPA : Double {
        willSet (newValue) {
            print("your score icreased from \(GPA) to \(newValue)")
        }
        
        didSet {
            print("your GPA has been changed.")
            if GPA > oldValue {
                print("your score has been increased by \(GPA - oldValue)")
            } else {
                // print("your score decreased from \(oldValue) to \(GPA), meaning \(oldValue - GPA) has been down.")
            }
        }
    }
    var name : String? {
        didSet {
            if (name != oldValue) {
                print("name changed! : from \(oldValue) to \(name)")
            } else {
                print("same name! : with \(oldValue) and \(name)")
            }
        }
        
        willSet {
            print("\(newValue) will be set from \(name)")
        }
    }
}

print("")
print("***** property observer *****")
print("")
var studentA = Student(GPA: 4.0, name: "JSS")
studentA.GPA = 4.5
studentA.name = "JSS"
studentA.name = "KSS"

print("")
print("***** property observer *****")
print("")

// getter, setter (property observer cannot be used with these together)
struct Square {
    var side : Double?
    // if you want to use customized getter/setter, use getter / setter
    var area : Double {
        get {
            return side! * side!
            //            return area       // serious recursive error! need backing store.
        }
        
        set (newArea) {
            print("set!")
            side = sqrt(newArea)
        }
    }

    // backing store to prevent recursive error using getter/setter
    private var _idx : Int = 0
    var idx : Int {
        get {
            // encapsulation. do not float it away.
            if (_idx <= 0) {
                print("idx should be more than 0!")
            }
            // print(idx)       // do not use idx itself here...horrible recursion will be comming.
            print(_idx)
            return _idx
        }
        
        set {
            _idx = newValue
            // idx = newValue                  // serious recursive(set->get->set->get..) error! need backing store.
        }
    }
    
    // read-only
    private var _color : String = "black"
    var color : String {
        get { return _color }
    }

    init(side:Double) {
        _idx = 0
        self.side = side
    }
}

var s = Square(side: 100)
s.side
s.area
s.area = 100000000
s.side

s.idx
s.idx = 1
s.idx
s.color
// s.color = "red"      // getter only

// Stored Property
class SP {
    var storedProperty1 : Int = 1
    var storedProperty2 : Int = 2
}

SP.init().storedProperty1
SP.init().storedProperty2


// required initialization
// convenience initialization
// designated initialization
// two phase initialization

// Initialization
class Human {
    var name: String
    var age: Int
    
    // desinated init
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    // convenience init
    convenience init(age: Int) {
        self.init(name:"ConvenienceInit1", age:29)
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name:"JSS", age:29)
        self.name = name
    }
    
    // required init : override required
//    required init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
}

class Korean : Human {
    var hometown: String
    
    // designated init in super => override
    // required init in super => required
    override init(name: String, age: Int) {
        self.hometown = "Seoul"
        super.init(name:name, age:age)
    }
    
    // designated init
    init(name: String, age: Int, hometown: String) {
        // new variable in subclass must be used before super.init
        self.hometown = hometown
        super.init(name:name, age:age)
        self.name = name
        self.age = age
    }
    
    // convenience init1
    convenience init(hometown: String) {
        self.init(name:"KSC", age:100, hometown:"Kangwondo")
        self.hometown = "Pusan"
    }
    
    // convenience init2
    convenience init(name: String) {
        self.init(name:"KSC", age:100, hometown:"Kangwondo")
        self.name = name
    }
    // convenience init3
    convenience init(age: Int) {
        self.init(name:"convenienceInit", age:100)
        self.age = age
    }
}

var objectA = Human(age:10)
objectA.age
objectA.name

var objectB = Human(name:"ConvenienceInit2")
objectB.age
objectB.name

var objectC = Human(name:"Designated(Required)Init", age:100)
objectC.age
objectC.name


class NuclearRocket {
    var meters: Double
    var liters: Double
    
    // init for
    init(meters: Double, liters: Double) {
        self.meters = meters
        self.liters = liters
    }
    
    // two phase init
    convenience init(ft: Double, gallons: Double) { // (convenience) for class
        let convertedMeters = ft / 3.28
        let convertedLiters = gallons * 3.79
        
        self.init(meters:convertedMeters, liters:convertedLiters)
    }
    
    convenience init(ft: Double) {
        self.init(meters:ft / 3.28, liters:200)
        self.liters = 200 / 3.79
    }
}

// Control Flow

// Iteration
print("")

for _ in 1...5 {
    print(5)
}
    
for x in [1,2,3,4,5] {
    print(x)
}

for x in 1...5 {
    print(x)
}

for x in 1..<6 {
    print(x)
}

for (k, v) in ["key1":1, "key2":2] {
    print("\(k) : \(v)")
}
for (animal, legs) in ["snake": 0, "cheetah": 4] {
    print("\(animal)'s have \(legs) legs.")
}

print("")

// Switch : fallthrough
let sampleCharacter : Character = "a"

switch sampleCharacter {
    case "a" :
        // print("a")
        fallthrough
    case "A" :
        // print("A")
        fallthrough
    case "B" :
        print("B")
    default:
        print("default!")
}

// Sequence
struct Countdown: Sequence, IteratorProtocol {
    var count: Int
    
    mutating func next() -> Int? {
        if count == 0 {
            return nil
        } else {
            defer { count -= 1 }
            return count
        }
    }
}

let threeToGo = Countdown(count: 3)
for i in threeToGo {
    print(i)
}

// Functional Programming

// High-Order Function
// Map
// how to use
// how to implement

// Filter
// how to use
// how to implement

// Reduce
// how to use
// how to implement

// Monad


// Currying

// Swift Type Understanding(Swift is much more oriented to Value type)
// Value, Reference
// Value type example

//What’s the Difference?
//The most basic distinguishing feature of a value type is that copying — the effect of assignment, initialization, and argument passing — creates an independent instance with its own unique copy of its data:

struct S { var data: Int = -1 }
var a = S()
var b = a						// a is copied to b
a.data = 42						// Changes a, not b
print("\(a.data), \(b.data)")	// prints "42, -1"

// Reference type example
class C { var data: Int = -1 }
var x = C()
var y = x						// x is copied to y
x.data = 42						// changes the instance referred to by x (and y)
print("\(x.data), \(y.data)")	// prints "42, 42"


//One of the primary reasons to choose value types over reference types is the ability to more easily reason about your code. If you always get a unique, copied instance, you can trust that no other part of your app is changing the data under the covers. This is especially helpful in multi-threaded environments where a different thread could alter your data out from under you. This can create nasty bugs that are extremely hard to debug.

//How to Choose?
//So if you want to build a new type, how do you decide which kind to make? When you’re working with Cocoa, many APIs expect subclasses of NSObject, so you have to use a class. For the other cases, here are some guidelines:
//Use a value type when:
//Comparing instance data with == makes sense
//You want copies to have independent state
//The data will be used in code across multiple threads

//Use a reference type (e.g. use a class) when:
//Comparing instance identity with === makes sense
//You want to create shared, mutable state
//In Swift, Array, String, and Dictionary are all value types. They behave much like a simple int value in C, acting as a unique instance of that data. You don’t need to do anything special — such as making an explicit copy — to prevent other code from modifying that data behind your back. Importantly, you can safely pass copies of values across threads without synchronization. In the spirit of improving safety, this model will help you write more predictable code in Swift.

// Value Type : struct, enum, tuple and Swift Standard Data Types such as Int, String, Double and so on....

// Reference Type

// Reference Type in Value Type
class ReferenceType {
    var id: Int
    init(id: Int) {
        self.id = id
    }
}

struct ValueType {
    var id: Int
    var referenceType: ReferenceType
}

var id: Int = 1
ValueType(id:id, referenceType:ReferenceType(id:id))
id+=1

// Range and Array List
//let range = Range(1...5)
//
//for i in range {
//    print(i)
//}

let myRange: ClosedRange = 1...3

let myArray = ["a", "b", "c", "d", "e"]
myArray[myRange] // ["b", "c", "d"]

// now the range can also be iterated over.
let myRange2: CountableClosedRange = 1...3

let myArray2 = ["a", "b", "c", "d", "e"]
myArray2[myRange2] // ["b", "c", "d"]

for index in myRange2 {
    print(myArray2[index])
}

// NSRange
let myNSRange = NSRange(location: 3, length: 2)

let list = Array(1...5)

for i in list {
    print(i)
}


