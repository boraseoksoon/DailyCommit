//: Playground - noun: a place where people can play

import UIKit
import Foundation

// Sequence, Generator
// IteratorProtocol is Generator previously.
struct MyRangeGenerator: IteratorProtocol {
    let end: Int
    var current: Int
    
    // 1
    typealias Element = Int
    
    init(start: Int, end: Int) {
        self.current = start
        self.end = end
    }
    
    // 2
    mutating func next() -> MyRangeGenerator.Element? {
        if self.current > end { return nil }
        let currentValue = self.current
        self.current+=1
        
        return currentValue
    }
}

struct MyRange: Sequence {
    let start: Int
    let end: Int
    
    // 1
    typealias Generator = MyRangeGenerator
    
    init(start: Int, end: Int) {
        self.start = start
        self.end = end
    }
    
    // 2
    // generate() is replaced with makeIterator now.
    func makeIterator() -> MyRange.Generator {
        // return MyRangeGenerator(start: self.start, end: self.end)
        return Generator(start: self.start, end: self.end)
    }
}

//for value in MyRange(start: 10, end: 20) {
//    print(value)
//}
// 콘솔에는 10, 11, 12 .... , 20 까지 숫자가 찍힌다.

// This is formal expression.
class WordIterator: IteratorProtocol {
    var word: String
    var index: String.Index
    
    init(_ word: String) {
        self.word = word
        index = self.word.startIndex
    }
    
    func next() -> Character? {
        if (index < self.word.endIndex) {
            let character = self.word[index]
            index = self.word.index(after: index)
            return character
        } else { return nil }
    }
}

class FormalWord: Sequence {
    var word: String
    init(_ word: String) { self.word = word }
    
    func makeIterator() -> WordIterator {
        return WordIterator(self.word)
    }
}

//for word in FormalWord("Apple Coffee WeWork Great Study Computer Science") {
//    print(word)
//}

struct WordsIterator: IteratorProtocol {
    var words: String
    var index: String.Index
    
    init(_ words: String) {
        self.words = words
        index = self.words.startIndex
    }
    
    mutating func next() -> Character? {
        if (index < self.words.endIndex) {
            let character = self.words[index]
            index = self.words.index(after:index)
            return character
        } else {
            return nil
        }
    }
}

struct WordsGenerator: Sequence {
    var words: String
    init(_ words: String) {
        self.words = words
    }
    
    func makeIterator() -> WordsIterator {
        return WordsIterator(self.words)
    }
}

class WordsIteratorTest: IteratorProtocol {
    var words: String
    var index: String.Index
    
    init(words: String, index: String.Index) {
        self.words = words
        self.index = index
    }
    
    convenience init(words: String) {
        self.init(words: words, index: words.startIndex)
        self.words = words
    }
    
    func next() -> Character? {
        if (index < self.words.endIndex) {
            let characterToReturn = self.words[self.index]
            self.index = self.words.index(after: self.index)
            return characterToReturn
        } else { return nil }
    }
}

class WordGeneratorTest: Sequence {
    var words: String

    init(_ words: String) {
        self.words = words
    }
    
    func makeIterator() ->  WordsIteratorTest {
        return WordsIteratorTest(words: words)
    }
}

for w in WordGeneratorTest("abc def") {
    print(w)
}

// This is concise expression.
class Word: Sequence {
    var word: String
    
    init(_ word: String) { self.word = word }
    
    func makeIterator() -> AnyIterator<Character> {
        var index = word.startIndex
        
        return AnyIterator {
            if (index < self.word.endIndex) {
                let character = self.word[index]
                index = self.word.index(after: index)
                return character
            } else { return nil }
        }
    }
}

//let word = Word("Apple Coffee WeWork Great Study Computer Science")
//for character in word {
//    print("\(character)")
//}

// Generic




// Operator Overloading
infix operator ∩: SetOperatorPrecedence

precedencegroup SetOperatorPrecedence {
    associativity: left
    higherThan: MultiplicationPrecedence
}

extension Set {
    static func ∩(lhs: Set, rhs: Set) -> Set {
        return lhs.intersection(rhs)
    }
}

let set1: Set = [1, 2, 4, 6]
let set2: Set = [1, 20, 3, 6]

let intersection2 = set1.intersection(set2)
let setResult = set1 ∩ set2

let intersection3 = ["Screwdriver", "Pliers", "Saw"] ∩ ["Screwdriver", "Pliers2", "Saw2", "Whatever"]

// prefix operator
// Operator definition
prefix operator ++

prefix func ++ (value: Int) -> Int {
    return value + 2
}

// Example
let value2 = 10
let result2 = ++value2      // 12

// infix operator overloading
precedencegroup SuperPowerPrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator ^^: SuperPowerPrecedence

// Operator definition
public func ^^ (value1: Double, value2: Double) -> Double {
    return pow(pow(value1, value2), value2)
}

let value = 10.0
let power = 2.0

// result = 100000
let result = value ^^ power


// postfix operator overloading
postfix operator +++

postfix func +++ (value: Int) -> Int {
    return value + 2
}

// Example
var value3 = 10
var result3 = value3+++      // 12

let abc = 10000+++
abc

// error
//var string: String = "TEST"
//string+++




// default value
var someOptional: String? = "10"
let unwrappedValue = someOptional ?? "default value"
let unwrappedValue2 = someOptional != nil ? someOptional! : "default value"
// someOptional = nil
let unwrappedValue3 = someOptional != nil ? someOptional! : "default value"

extension Optional {
    func or <T> (defaultValue:T) -> T {
        switch(self) {
            case .none:
                return defaultValue
        case .some(let value):
                return value as! T
        }
    }
}

someOptional.or(defaultValue:"defaultValue")

// subscript test

// class works fine.
class ClassSubstriptTest {
    private(set) var test = [0,1,2,3,4,5,6,7]
    
    subscript(index: Int) -> Int {
        get {
            return test[index]
        }
        
        set {
            test[index] = newValue
        }
    }
}

var classSubscriptTest = ClassSubstriptTest()
classSubscriptTest[1]
classSubscriptTest[1] = 1111

struct SubstriptTest {
    private(set) var test = [0,1,2,3,4,5,6,7]
    
    subscript(index: Int) -> Int {
        get {
            return test[index]
        }
        
        set {
            test[index] = newValue
        }
    }
}

var subscriptTest = SubstriptTest()
subscriptTest[0]
subscriptTest[0] = 100




// init
// designated init
// convenience init
enum Err : Error  {
    case ZeroShouldBeBiggerThanZeroRuntimeError(msg: String)
}

class Base {
    var id: Int = 0
    var name: String
    var kind: String
    
    init(id: Int, name: String) {
        self.name = name
        self.id = id
        self.kind = "Base"
    }
    
    init(id: Int, kind: String) {
        self.name = "hardcode_name"
        self.id = id
        self.kind = kind
    }
    
    init() {
        self.name = "hardcode_name"
        self.kind = "hardcode_kind"
    }
    
    init?(id: Int, name: String, kind: String) throws {
        guard id > 0 else {
            throw Err.ZeroShouldBeBiggerThanZeroRuntimeError(msg: "error!")
        }
        
        self.id = id
        self.name = name
        self.kind = kind
    }
    
//    convenience init(name: String) {
//        self.init()
//        self.name = name
//    }
    
    convenience init(name: String) {
        // self.methodAllowd() // it is NOT allowed
        self.init(id: 10, name: name)
        self.methodAllowd() // it is allowed
        self.name = name
    }
    
    convenience init(kind: String) {
        // self.methodAllowd() // it is NOT allowed
        
        // fire another convenience
        self.init(name: "conveninece")
        self.kind = kind
        self.methodAllowd() // it is allowed
    }
    
    func methodAllowd() {
        print(self.name)
    }
}

class Rectangle: Base {
    var sideLength: Int
    var area:Int {
        get {
            return sideLength * sideLength
        }
        set {
            self.sideLength = newValue / self.sideLength
        }
    }
    
    override init() {
        sideLength = 10
        super.init()
        self.name = "hardcoded_name2"       // super class property should be access after super.init() call.
    }
    
    convenience init(sideLength: Int) {
        self.init()
        self.sideLength = sideLength
        // super.init(id: 0, name: "fromRectangle")    // error. convenience init should never call super init.
    }
}

let base = Base(kind: "conveninece")

if let base2 = try? Base(id: -1, name: "try?", kind: "test") {
    print(base2 ?? "whut1")
} else {
    print("error happens!")
}

if let base2 = try! Base(id: 1, name: "try!", kind: "test") {
    print(base2.id)
    print(base2.name)
} else {
    print("error happens!")
}

let base3 = try! Base(id: 2, name: "try!", kind: "test")
//print(base3.id)     // base3 is optional. whut...
//print(base3.name)
print(base3?.id ?? "whut2")
print(base3?.name ?? "whut3")


// subscript
struct SubscriptStruct {
    private(set) var count = ["One","Two","Three","Four","Five","Six"]
    subscript(index:Int) -> String {
        get {
           return count[index]
        }
        set {
            count[index] = newValue
        }
    }
}

var structTest = SubscriptStruct()
structTest.count
structTest[0]
structTest[1]
structTest[1] = "TEST"
structTest[1]

class Daysofaweek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "saturday"]
    subscript(index: Int) -> String {
        get {
            return days[index]
        }
        set(newValue) {
            self.days[index] = newValue
        }
    }
}
var ppp = Daysofaweek()
print(ppp[0]) // prints sunday
ppp[0] = "Monday"
print(ppp[0]) // prints Monday

struct subexample {
    let decrementer: Int
    subscript(index: Int) -> Int {
        return decrementer / index
    }
}
let division = subexample(decrementer: 100)

print("The number is divisible by \(division[9]) times")
print("The number is divisible by \(division[2]) times")

// lazy property
// stored property
// computed property
// property observer


// iteration
let dict = ["key1" : [1,2,3,4,5], "key2" : [6,7,8,9,10]]

for (key, value) in dict {
    for o in value {
        print("\(key) : \(o)")
    }
}

let list = ["test1", "test2", "test3", "test4", "test5"]

for i in list {
    print(i)
}

for (index, l) in list.enumerated().reversed() {
    print("!!! \(index), \(l)")
}

struct CircleTest {
    var pi = 3.14
    var radius: Double?
    // var diameter
    var area: Double {
        get {
            return radius! * radius! * pi
        }
        
        set(newArea) {
            radius = newArea / 3.14 / radius!
            print("pi: \(area / radius! / radius!)")
        }
    }
}

var circleTest = CircleTest()
circleTest.radius = 3
circleTest.area
circleTest.area = 100
circleTest.radius

circleTest.area = 100
circleTest.radius
circleTest.radius = 100.34
circleTest.area
circleTest.area = 31613.882984
circleTest.area
circleTest.radius

// area formula => radius * radius * 3.14

// radius formula => (area / 3.14) / radius = radius

// pi

// area = radius * radius * 3.14
// area / radius / 3.14

// struct
struct Counter {
    // making the setter private,
    // so only the increment function can change it!
    private(set) var count: Int
    
    init(count: Int = 0) {
        self.count = count
    }
    
    // the mutating keyword approach
    mutating func increment() {
        count += 1
    }
    
    // the functional approach
    func counterByIncrementing() -> Counter {
        let newCount = count + 1
        return Counter(count: newCount)
    }
}

struct Circle
{
    var rad: Double = 0.0
    let pi: Double = 3.14
    var area: Double
    {
        get {
            return rad * rad * pi
        }
        set(newArea) {
            rad = newArea * 10
        }
    }
}

var sample = Circle()
sample.area = 9         // set block is called
sample.rad
var ans = sample.area   // when get block is called,area is computed and returned to variable ans
sample.area

struct PropertyTest {
    private var _num: Int = 0
    var num: Int {
        get { return _num }
        set { _num = newValue }
    }
}

var p = PropertyTest()
p.num
p.num = 10
p.num

// computed property
class PropertyTestClass {
    var backingStoreNumA: Int = 0
    var numA: Int {
        get {
            return backingStoreNumA
        }
        
        set {
            numC = newValue + numB
            backingStoreNumA = newValue
        }
    }
    
    var backingStoreNumB: Int = 0
    var numB: Int {
        get {
            return backingStoreNumB
        }
        set {
            numC = numA + newValue
            backingStoreNumB = newValue
        }
    }
    var backingStoreNumC: Int = 0
    public private(set) var numC: Int {
        get {
            return numA + numB
        }
        
        set {
            backingStoreNumC = newValue
        }
    }
}

let ptc = PropertyTestClass()
ptc.numC

ptc.numA = 10
ptc.numB = 20
ptc.numC

ptc.numB = 50
ptc.numC
// ptc.numC = 100
ptc.numA
ptc.numB

// ptc.numC = 1000

// didSet, willSet, set, get
class Foo {
    var myProperty: Int = 0 {
        didSet {
            print("[Foo]didSet The value of myProperty changed from \(oldValue) to \(myProperty)")
        }
        
        willSet {
            print("[Foo]willSet The value of myProperty changed from \(myProperty) to \(newValue)")
        }
    }
}

class Foo2 {
    // backing store
    var myPropertyValue: Int = 0
    var myProperty: Int {
        get {
            print("get!")
            return myPropertyValue
        }
        set {
            print("[Foo2]set The value of myProperty changed from \(myPropertyValue) to \(newValue)")
            myPropertyValue = newValue
        }
    }
}


let foo = Foo()
foo.myProperty = 10
let foo2 = Foo2()

foo2.myProperty
foo2.myProperty = 100
foo2.myProperty


// default operator equality
// ==(!=) : value equality
// ===(!==) : referency equality

class MyClass: Equatable {
    var myProperty: String
    
    init(s: String) {
        myProperty = s
    }
}

func ==(lhs: MyClass, rhs: MyClass) -> Bool {
    return lhs.myProperty == rhs.myProperty
}

let myClass1 = MyClass(s: "Hello")
let myClass2 = MyClass(s: "Hello")
let myClass3 = myClass1

myClass1 == myClass2 // true
myClass1 != myClass2 // false
myClass1 === myClass2 // false
myClass1 !== myClass2 // true

myClass1 == myClass3
myClass1.myProperty
myClass3.myProperty = "Changed"
myClass1 == myClass3
myClass1.myProperty
myClass1 != myClass3

myClass1 === myClass3
myClass1 !== myClass3


/* iteration */
for index in 0..<5 {
    print(index)
}

for index in stride(from: 5, to: 1, by: -1) {
    print(index)
}

// backward
for index in (0..<5).reversed() {
    print(index)
}

for index in stride(from: 5, through: 1, by: -1) {
    print(index)
}

// collection iteration
let animals = ["horse", "cow", "camel", "sheep", "goat"]

// using stride
for index in stride(from:0, through:animals.count - 1, by:2) {
    print("~~~ \(index) : \(animals[index])")
}

for index in stride(from: animals.count - 1, through: 1, by: -1) {
    print("\(index) : \(animals[index])")
}

// using for in.
for (index, animal) in animals.enumerated() {
    print("!!! \(index), \(animal)")
}

for (index, animal) in animals.enumerated().reversed() {
    print("!!!! \(index), \(animal)")
}

// swift dictionary iteration
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
    // "Solo": 1
]

var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        print("@@ kind: \(kind), number : \(number), numbers : \(numbers)")
        if number > largest {
            largest = number
        }
    }
}

largest

/* operator overloading */
struct DefaultStruct {
    var num: Int
    var str: String
}

postfix operator *!

postfix func *!(structValue: inout DefaultStruct) -> DefaultStruct {
    structValue.num = structValue.num * structValue.num * structValue.num
    return structValue
}

var dd = DefaultStruct(num: 10, str: "test")
dd*!
dd.num
dd.str


//
struct MyType {
    var a = 0
    var b = 0
}

postfix operator **

postfix func ** (data: inout MyType) -> MyType {
    data.a = data.a * data.a
    data.b = data.b * data.b
    return data
}

postfix operator ***

postfix func *** (data: inout MyType) -> MyType {
    data.a = data.a * data.a * data.a
    data.b = data.b * data.b * data.b
    return data
}

var q = MyType(a: 10, b: 10)
q**    // { a 100, b 100 }

q.a
q.b

var aa = MyType(a: 10, b: 10)
aa***
aa.a
aa.b

// 
struct MyStruct {
    var num = 0
    var str = ""
}

/*
func ==! (left: MyStruct, right: MyStruct) -> Bool {
    if (left.num == right.num) {
        return true
    }
    return false
}
*/

extension MyStruct {
    static func == (left: MyStruct, right: MyStruct) -> Bool {
        if (left.num == right.num && left.str == right.str) {
            return true
        }
        return false
    }
}

var a = MyStruct(num: 10, str: "a")
var b = MyStruct(num: 100, str: "b")
var c = MyStruct(num: 100, str: "b")
var d = MyStruct(num: 10, str: "a")

if a == b {
    print("a == b")
}

if a == d {
    print("a == d")
}

if b == c {
    print("a == c")
} else {
    print("a != c")
}

postfix func ++ (value: inout MyStruct) -> MyStruct {
    return MyStruct(num: value.num + 1, str: value.str)
}

prefix func ++ (data: inout MyStruct) -> MyStruct {
    data.num += 1
    return data
}

let aaa = a++
aaa.num
++a
a.num

struct CustomStruct {
    var num: Int?
    var id: Int?
}
// operator overloading
prefix operator ^^
prefix func ^^ (data: inout CustomStruct) -> CustomStruct {
    data.num = data.num! * data.num! - 1000
    return data
}

postfix operator ^^
postfix func ^^ (data: inout CustomStruct) -> CustomStruct {
    data.num = data.num! * data.num! + 100
    return data
}

// let cannot allow cc to be changed.
var cc = CustomStruct(num: 100, id: 100)
cc

cc.num = 1000
cc.id = 1

cc^^
cc.num

var pp = CustomStruct(num: 20, id: 20)
^^pp
pp.num



