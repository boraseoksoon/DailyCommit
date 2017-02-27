//: Playground - noun: a place where people can play

import UIKit

var str = "Swift 3.0 Daily Practice - 20170227"

// sequential
var a = 1
var b = 2

// conditional
if a > b {
    print("a is bigger!")
} else {
    print("a is not bigger than b!")
}

// iteration
var sum : Int = 0
for i in 1...5 {
    sum += i
}
print(sum)

// reverse loop.
for i in (1...10).reversed() {
    print(i)
}

print("")

for i in 1..<10 {
    print(i)
}

print("")

var i = 0
while i <= 100 {
    i+=1
}
print(i)

print("")

repeat {
    if (i <= 10) {
        break
    }
    
    i-=10
    print(i)
} while (i >= 0)

print("DONE : \(i)")
print("")

// Generic
func genericSwap<T>(x:inout T , y:inout T) -> (T,T,T) {
    let temp = x
    x = y
    y = temp
    
    return (temp, x, y)
}

var x = "A"
var y = "B"
let result = genericSwap(x:&x, y:&y)
print(result)
print(result.1)     // x
print(result.2)     // y

//- Swift collection framework
//    - dictionary

// mutable cookies.
var mutableCookies = [
    "Macadamia Nut":0.06,
    "Coconut":0.20,
    "Macaron":0.55
]

for (k, v) in mutableCookies {
    print("key : \(k), value : \(v)")
}

// immutable cookies.
let cookies = ["Chocolate Chip":0.25,"Oatmeal":0.26]
for (k, v) in cookies {
    print("key : \(k), value : \(v)")
}

// normal things.
var dictionary = [String:String]()
dictionary.updateValue("A", forKey:"1")
dictionary.updateValue("B", forKey:"2")
dictionary.updateValue("C", forKey:"1")

if let success = dictionary.updateValue("키", forKey:"값") {
    print(success)
} else if let success = dictionary.updateValue("A", forKey:"111") {
    print(success)
}

dictionary.removeValue(forKey:"값")
dictionary.removeValue(forKey:"A")

print(dictionary)

// dictionary iteration
for (k, v) in dictionary {
    print("key : \(k), value : \(v)")
}

for k in dictionary.keys{
    print ("[Key] =  \(k)")
}

for v  in dictionary.values {
    print ("[Value] =  \(v)")
}

var toppings = ["Pepperoni":0.25,
                "Sausage":0.26,
                "Onions":0.02,
                "Green Peppers":0.03,
                "Cheese":0.01
]

// make a 10% price increase
for myKey in toppings.keys{
    toppings[myKey] = toppings[myKey]! * 1.10
}

var valuesArray = [Double](toppings.values)
let keyArray = [String](toppings.keys)

for o in keyArray {
    print(o)
}

for v in valuesArray {
    print(v)
}

//    - list
var list = [Int]()
list.append(1)
list.append(2)
list.append(3)
list.append(4)

var list2 = [Int]()
list2.append(5)
list2.append(6)
list2.append(7)
list2.append(8)

list = list + list2

for e in list {
    print(e)
}

var repeatArray = Array(repeating: "A", count:100)

print("")
var literalList = ["A","B", true] as [Any]
for i in literalList {
    print(i)
}

for (index, value) in literalList.enumerated() {
    print("index : \(index) and value : \(value)")
}

print("")


//    - set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
// letters now contains 1 value of type Character
print(letters)
letters = []
// letters is now an empty set, but is still of type Set<Character>

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteSongs : Set = ["소주한잔", "SkyHigh", "RobotRock"]
print(favoriteSongs)

let containResult = favoriteSongs.contains("소주한잔")
if favoriteSongs.contains("소주한잔") {
    print("yes true!")
} else {
    print("no false!")
}

print(containResult)

// list
let elements = [1,2,3,4,5,100]
if elements.contains(100) {
    print("yes, contains!")
} else {
    print("no, contains!")
}

literalList = []
literalList = ["소주한잔", "SkyHigh", "RobotRock", "노래", "노래", "노래"]


if literalList.isEmpty {
    print("literalList is empty!")
} else {
    print("literalList is NOT empty!")
}

var c = {
    print("hello closure!")
}

var c2 = {
    print("hello closure!!")
}

literalList+=[c]
literalList+=[c2]

// literalList[4...6] = ["Bananas", "Apples"]
print(literalList.count)

literalList.insert("Maple Syrup", at:2)
let listClosure = literalList.remove(at: 0)
// listClosure()

for c in literalList {
    if let stringType = c as? String {
        print(c)
    } else if let closureType = c as? [()->()] {
        c //closureType() as! [()->()]
    }
}

var closureList = [()->()]()
closureList += [c]
closureList += [c2]

for c in closureList {
    c()
}

//    - tuple
// tuple
func returnTuple() -> (Int,Int){
    return (1,2)
}
let t = returnTuple()
print(t)

// 
//- aceessor
// - open, public, internal, fileprivate, private
//
//- defer
// - defer can be used indepently
// 

func deferFunc() -> Void {
    print("start func!")

    // defer stacked at bottom index 0
    defer {
        print("defer stack index at 0")
    }
    // defer stacked at index 1 on top of bottom.
    defer {
        print("defer stack index at 1")
    }
    
    return
    // execute defer stack from top to bottom(1->0) after function is finished.
    
    // code section below return is not executed.
    
    defer {
        print("defer stack index at 2")
    }
        
    print("end func!")
}

deferFunc()

// ARC
    //- strong retain cycle
        //    - property
        //    - lazy evaluation using closure

class Account {
    var name : Person?
    var accountNumber : String
    
    init(_accountNumber:String) {
        accountNumber = _accountNumber
    }
    
    deinit {
        print("Account with number \(accountNumber) is being deinitialized!")
    }
}

class Person {
    let name : String
    init (_name:String) {
        name = _name
    }
    // use weak to prevent memory leak from strong reference cycle in either here or Account class.
    // unowned is not able to be used here.
    weak var account : Account?
    deinit {
        print("Person name \(name) is being deinitialize!")
    }
}
var aPerson : Person?
var bPerson : Person?
var cPerson : Person?

aPerson = Person(_name:"JSS")
bPerson = aPerson
cPerson = aPerson

aPerson = nil
bPerson = nil
// cPerson = nil        // deinit is not called unless all reference is released.

var testPerson : Person?
testPerson = Person(_name:"Kim")
var testAccount : Account?
testAccount = Account(_accountNumber:"0x152121ABC")

// using no weak, you can prevent memory leak from strong retain cycle by using below.
testPerson!.account = testAccount
testAccount!.name = testPerson

testPerson!.account = nil
testAccount!.name = nil

testPerson = nil
testAccount = nil

class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class XMLElement {
    let tag : String
    let text : String?
    
    init(_tag:String, _text:String? = nil) {
        self.tag = _tag
        self.text = _text
    }
    
    lazy var asXML : () -> String = {
        /*
        [unowned self] in
        if self.text != nil {
            return "<\(self.tag)>\(self.text)<\(self.tag)>"
        } else {
            return "\(self.text)"
        }
        */
        /*
        [weak self] in
        if self?.text != nil {
            return "<\(self?.tag)>\(self?.text)<\(self?.tag)>"
        } else {
            return "\(self?.text)"
        }
        */
        
        // if unwoned deleted, memory leak caued by capturing self value in closure
        // causing strong retain cycle.
        [unowned self] in
            return self.tag
    }
    
    deinit {
        print("XMLElement is being deinitialized")
    }
}

var xmlElement : XMLElement?
xmlElement = XMLElement(_tag: "h1", _text:"hello CS!")
let printXML = xmlElement!.asXML()
print(printXML)
xmlElement = nil

//
//- closure
    // closure capturing value

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementBySeven()
incrementBySeven()


// free variable
var runningTotal : Int = 0

func incrementer(amount:Int) -> () -> Int {
    func nestedIncrementer() -> Int {
        // capturing value surronding context
        runningTotal += amount
        return runningTotal
    }
    return nestedIncrementer
}

let closure1 = incrementer(amount:10)
let closure2 = incrementer(amount:10)

print(closure1())
print(closure1())
print(closure1())
print(closure1())
print(closure1())
print(closure1())
print(closure1())
print(closure1())
// since free variable is shared between both closures.
print(closure2())
print(closure2())
print(closure2())

// from Swift 3, @noescaping is by default.
// - @noescaping, @escaping, @autoclosure

var externalClosure1 : () -> Void = {
    print("closure doing nothing1")
}

var externalClosure2 : () -> Void = {
    print("closure doing nothing2")
}

func changeClosure(closureA:@escaping()->Void, closureB:@escaping ()->Void) -> Void {
    externalClosure1 = closureA
    externalClosure2 = closureB
}

externalClosure1()
externalClosure2()

changeClosure(closureA: { () -> Void in
    print("escaped closureA is in the closure!")
}) {
    // type inference will make you no need to type any other type and return value.
    
    // trailing closure syntax though it is here showing terrible readability, 
    // I just use it since it is practice
    print("escaped closureB is in the closure!")
}

externalClosure1()
externalClosure2()

//        - @noescaping is default in swift3 .


// https://outofbedlam.github.io/swift/2016/01/26/Swift-escape-closure/
//@autoclosure
//@autoclosure는 @noescape와 거의 동일합니다. @autoclosure를 지정하면 즉시 @noescape를 지정한 것과 같은 효과를 나타냅니다. 다만, @autoclosure는 클로저에 적용되는 것이 아니라 표현식에 적용됩니다. @autoclosure는 표현식을 자동으로 파라미터가 없는 클로저로 감싸줍니다. 가장 많이 볼 수 있는 @autoclosure의 예는 assert 함수 입니다. assert 함수는 다음과 같이 정의되어 있습니다.

// _ will remove named parameter.
func autoClosureTest( condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String) {
    if condition() {
        print("message : \(message())")
    }
}

autoClosureTest(condition: true, "auto closure is used!")

func autoClosureTest2 (_ condition: () -> Bool, _ message: () -> String) {
    if condition() {
        print("message : \(message())")
    }
}

autoClosureTest2({ return true }, { () -> String in return "auto closure is not used!" })

//- subscript
struct SubsrciptTest {
    subscript(inputX:Int) -> Void {
        get {
            print("subscript : \(inputX)")
        }
        set (newVal) {
            print("subscript : changed to \(newVal)")
        }
    }
    
    subscript(inputX:Int, inputY:Int, message:String) -> String {
        get {
            return message + String(inputX + inputY)
        }
        
        set (newData1){
            print("subscript use : \(newData1)")
        }
    }
}

var s = SubsrciptTest()
s[1]
s[0]
s[1,2,"결과는? => "]

//- lazy evaluation with lazy let(lazy let does not works)
// how to use yield in Swift to handle infinity?
print("")

// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89
//- lazy var normal property, lazy var closure

class PersonForLazy {
    var age = 11
    var height = 177
    var weight = 77
    
    lazy var fibonacciOfAge: Int = {
        // it does not cause strong reference cycle since this is not closure.
        // [unowned self] in
        print("fibonacciOfAge starts!")
        return fibonacci(of:self.age)
    }()
    
    lazy var needToUnowned : () -> Int  = {
        // it 'causes' strong reference cycle since this is closure capturing self value in closure scope.
        // it must be used.
        [unowned self] in
            return self.age + self.height + self.weight
    }
    
    deinit {
        print("PersonForLazy is being deinitialized!")
    }
}

// need to optimize using memoization
func fibonacci(of num: Int) -> Int {
    if num < 2 {
        return num
    } else {
        return fibonacci(of: num - 1) + fibonacci(of: num - 2)
    }
}

var fibonacciPerson : PersonForLazy?
fibonacciPerson = PersonForLazy()
// since you use lazy, it is not executed until you explicitly use it.
// optional check.
let fibonacciResult = fibonacciPerson?.fibonacciOfAge       // it will return optional
print(fibonacciResult!)

if let localFibonacciInstance = fibonacciPerson {
    print("localFibonacciInstance is success!")
    print(localFibonacciInstance.fibonacciOfAge)
} else {
    print("localFibonacciInstance is failed!")
}

fibonacciPerson?.needToUnowned()
fibonacciPerson = nil

print("")


class UIViewController {
    deinit {
        print("/* UIViewController class name can be used\nsince name-space per module is assigned in Swift. */")
    }
}

var controller : UIViewController?
controller = UIViewController()
controller = nil

// comaring to Objetive-C version

class A {
    lazy var lazyVariableForClosure = {
        return lazyVarCalculator(howMany: 100, expression: {
            x, y in
                return x + y
        })// () should be here or
    }() // here.
    
    lazy var lazyVariableForValue = {
        return lazyVarCalculator2(howMany:1000, expression: {
                return String($0 + $1)
        })
    }()
}

func lazyVarCalculator(howMany amount:Int, expression:@escaping (Int, Int)->Int) -> () -> String {
    var freeVariable = 0
    func nestedFunc() -> String {
        return String(expression(freeVariable, amount))
    }
    return nestedFunc
}

func lazyVarCalculator2(howMany amount:Int, expression:@escaping (Int, Int)->String) -> Int {
    var freeVariable = 0
    func nestedFunc() -> String {
        return expression(freeVariable, amount)
    }
    return Int(nestedFunc())!
}


let instanceOfA = A()
// instanceOfA.lazyVariable is function type! all function is closure.
print("instanceOfA.lazyVariableForClosure : \(instanceOfA.lazyVariableForClosure())")
print("instanceOfA.lazyVariableForValue : \(instanceOfA.lazyVariableForValue)")

let returnedClosure = lazyVarCalculator(howMany:10, expression: {
    x, y in
        return x + y
    
    // since closure value is immutable, below does not work
    //        x = x + y
    //        return x
})

returnedClosure()
returnedClosure()
returnedClosure()
returnedClosure()
returnedClosure()

//- type casting
// https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TypeCasting.html
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
        self.name = name
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}


let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")


// http://stackoverflow.com/questions/30896231/why-convenience-keyword-is-even-needed-in-swift
//    - initialization
            // - convenience init
            // - designated init


// 
//- deinit
// 
//- computed property, stored property
// 
//- typealias
// 
//- type inference
// 
//- struct vs class
// 
//- mutating
// 
//- generic
//- property observer
// - didSet
// - willSet
//- computed property
//    - get, set
//- stored property
//    - basic
// 
//- introduction to POP
// - extension, protocol
//
// - optional default parameter
//- high order function
// - map, filter, reduce + flat map?
//    - usage
//    - implementation
// 
// - GCD(Grand Central Dispatch)
// 


