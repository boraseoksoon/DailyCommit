//: Playground - noun: a place where people can play

import UIKit

var str = "2017.11.04 : Coding for fun before going to see in theatre movie, 범죄도시"

/// strategy pattern
protocol PlatformProgrammable {
  func doProgramming()
}

class iOSCoding: PlatformProgrammable {
  func doProgramming() {
    print("iOS coding!")
  }
}

class AndroidCoding: PlatformProgrammable {
  func doProgramming() {
    print("Android coding!")
  }
}

class UnixServerCoding: PlatformProgrammable {
  func doProgramming() {
    print("Unix Server coding!")
  }
}

/// Client Side Progtocol
protocol MustCodable {
  func doCreateSomethingAwesome()
}

class Programmer: MustCodable {
  private var gotProgramming: PlatformProgrammable?
  public func updateGotProgramming(_ programming: PlatformProgrammable) -> Void {
    self.gotProgramming = programming
  }
  
  public func doCreateSomethingAwesome() {
    if let programming = self.gotProgramming {
      programming.doProgramming()
    } else {
      print("doing HTML!")
    }
  }
}

let someProgrammer = Programmer()

someProgrammer.doCreateSomethingAwesome()

someProgrammer.updateGotProgramming(iOSCoding())
someProgrammer.doCreateSomethingAwesome()

someProgrammer.updateGotProgramming(AndroidCoding())
someProgrammer.doCreateSomethingAwesome()

someProgrammer.updateGotProgramming(UnixServerCoding())
someProgrammer.doCreateSomethingAwesome()

//doing HTML!
//iOS coding!
//Android coding!
//Unix Server coding!



// properties
struct NumberObject {
  // stored property
    // lazy
  lazy var id = randomString(length: 10)
    // normal
  public var kind = "NumberObject"
  public var oldSum: Int = 0
  

  // computed property
    // using backing store
  private var _test: Int = 0
  var test: Int {
    get {
      return _test
    }
    set {
      _test = newValue
    }
  }
    // using set, get attributes
  var computedProperty: Int {
    get {
      return numA + numB
    }
    set {
      numA = newValue / 2
      numB = newValue / 2
    }
  }
  var sum: Int = 0 { willSet{} didSet{} }
  
  var backingStoreNumAForOldValue: Int?
  var backingStoreNumAForNewValue: Int?
  // property observer
  var numA: Int = 0 {
    willSet {
      backingStoreNumAForNewValue = newValue
    }
    didSet {
      print("numB : ", numB)
      print("oldValue : ", oldValue)
      sum = numB + oldValue
    }
  }
  public var numB: Int = 10
  
  func randomString(length: Int) -> String {
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len = UInt32(letters.length)
    
    var randomString = ""
    
    for _ in 0 ..< length {
      let rand = arc4random_uniform(len)
      var nextChar = letters.character(at: Int(rand))
      randomString += NSString(characters: &nextChar, length: 1) as String
    }
    
    return randomString
  }
}

var numberObject = NumberObject()

numberObject.numA = 100
numberObject.numA = 200
numberObject.numA
numberObject.sum

numberObject.computedProperty = 1000
numberObject.numA
numberObject.numB

numberObject.numA = 1000
numberObject.numA = 2000

numberObject.computedProperty

// FP concept
// high-order functions
  // filter
  // map
  // reduce
// currying
/// Takes a binary function and returns a curried version
func curry<A,B,C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> (C) {
  return { a in { b in f(a, b) } }
}

func sum(a: Int, b: Int) -> Int {
  return a + b
}

let curryResult = sum(a:3, b:6)

let curriedSum = curry(sum)
let curryResult2 = curriedSum(3)(6)
let sumWith3 = curriedSum(3)
let curryResult3 = sumWith3(100)





var tapped: ((Int) -> Void) = { value in
  print("tapped value : ", value)
}

tapped(10)

var closureArgumentTapped: ((Int) -> Void) -> Void = { closure in
  closure(10)
}

closureArgumentTapped({ parameterOfClosure in
  print("integer : ", parameterOfClosure)}
)

var closureBlock: (_ condition: Bool, _ success:() -> Void, _ failure: () -> Void) -> Void = {
  condition, success, failure in
  if condition {
    success()
  } else {
    failure()
  }
}

closureBlock(true, {
  print("when it is success")
}, {
  print("when it is failure")
})

func successBlockTest(at condition: Bool,
                      success:(Int) -> Void,
                      failure: () -> Int) -> Void {
  if condition {
    success(100)
  } else {
    let failReturn = failure()
    print("failReturn : ", failReturn)
  }
}

successBlockTest(at: false,
success: { value in
  print("success value : ", value)
}, failure: {
  return 5000
})


let result = curry({ (a:Int, b:Int) -> Int in return a + b })(5)(6)
result

curry(+)(5)(6) // => 11

let add: (Int) -> (Int) -> Int = curry(+)
add(5)(6) // => 11


let reducedResult = [1,2,3,4,5].filter { $0 % 2 == 0 }
                               .map { $0 * 100 }
                               .reduce(0, {sum, num in sum + num })
reducedResult
