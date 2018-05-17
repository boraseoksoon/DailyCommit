//: Playground - noun: a place where people can play

import UIKit

/**
 Question:
  implement to get prime number given natural numbers,
  and use and design proper OOP design using abstract factory, factory, strategy pattern using this algorithm.
 */

import CoreFoundation

class ParkBenchTimer {
  
  let startTime:CFAbsoluteTime
  var endTime:CFAbsoluteTime?
  
  init() {
    startTime = CFAbsoluteTimeGetCurrent()
  }
  
  func stop() -> CFAbsoluteTime {
    endTime = CFAbsoluteTimeGetCurrent()
    
    return duration!
  }
  
  var duration:CFAbsoluteTime? {
    if let endTime = endTime {
      return endTime - startTime
    } else {
      return nil
    }
  }
}

var str = "sieve of eranthoses"

protocol PrimeCountable {
  var until: Int { get set }
  func getPrimeNumbers(until: Int) -> [Int?]
}

struct SieveOfEranthoses: PrimeCountable {
  var until: Int
  
  func getPrimeNumbers(until: Int) -> [Int?] {
    print(">>> using Plain SieveOfEranthoses!")
    var naturalNumbers: [Int?] = (2...until).map { $0 }
    for (i, v1) in naturalNumbers.enumerated() {
      for (j, v2) in naturalNumbers.enumerated() {
        if v1 != v2 {
          if let v1 = v1, let v2 = v2 {
            if v2 % v1 == 0 {
              naturalNumbers[j] = nil
            }
          }
        }
      }
    }
    
    return naturalNumbers
  }
}

//print(Double(10).squareRoot())
//print(sqrt(Double(10)))

struct OptimizedSieveOfEranthoses: PrimeCountable {
  var until: Int
  
  func getPrimeNumbers(until: Int) -> [Int?] {
    print(">>> using OptimizedSieveOfEranthoses!")
    var naturalNumbers: [Int?] = (2...until).map { $0 }
    for (i, v1) in naturalNumbers.enumerated() {
      if Double(i) < Double(until).squareRoot() {
        for (j, v2) in naturalNumbers.enumerated() {
          if v1 != v2 {
            if let v1 = v1, let v2 = v2 {
              if v2 % v1 == 0 {
                naturalNumbers[j] = nil
              }
            }
          }
        }
      }
    }
    
    return naturalNumbers
  }
}

let timer = ParkBenchTimer()

let until = 100
let sieve = SieveOfEranthoses(until:until)
let result1 = sieve.getPrimeNumbers(until: sieve.until).flatMap { $0 }
result1

print("The task took \(timer.stop()) seconds.")
//The task took 4.78897106647491 seconds.

let timer2 = ParkBenchTimer()

let prime = OptimizedSieveOfEranthoses(until:until)
let result2 = prime.getPrimeNumbers(until: prime.until).flatMap { $0 }
result2

print("The task took \(timer2.stop()) seconds.")
//The task took 0.433058977127075 seconds.


// Same Time Complexity in theory but Significant Time Lapse Difference


// + factory pattern
protocol Printable {
  func print(until: Int) -> [Int]
}

// factory, abstract factory, strategy pattern
protocol PrintNumberable: Printable {
  func printNumber(until: Int) -> [Int]
}

struct PrimeMachine: PrintNumberable {
  var until: Int
  private var _primeNumberCounter: PrimeCountable!
  public var primeNumberCounter: PrimeCountable! {
    get {
      return _primeNumberCounter
    }
    set {
      _primeNumberCounter = newValue
    }
  }
  
  init(until: Int) {
    self.until = until
    self.primeNumberCounter = SieveOfEranthoses(until: until)
  }
  
  mutating func setPrimeNumberCounter(countWay: PrimeCountable) {
    self.primeNumberCounter = countWay
  }
  
  func print(until: Int) -> [Int] {
    return primeNumberCounter!.getPrimeNumbers(until: 100).flatMap { $0 }
  }
  
  func printNumber(until: Int) -> [Int] {
    return print(until: until)
  }
}

struct NaturalMachine: PrintNumberable {
  var until: Int
  
  func print(until: Int) -> [Int] {
    return (0...until).map { $0 }
  }
  
  func printNumber(until: Int) -> [Int] {
    return print(until: until)
  }
}

enum MachineSeries {
  case prime
  case natural
}

struct NumberMachineFactory: MachineSeriealizable {
  func createMachine(identifier: MachineSeries) -> Printable {
    switch identifier {
    case .natural:
      return NaturalMachine(until: 100)
    case .prime:
      return PrimeMachine(until: 100)
    }
  }
}

// factory, abstract factory, strategy pattern
protocol PrintStringable: Printable {
  func printNumberAsString(until: Int) -> [String]
}

struct PrimeStringMachine: PrintStringable {
  var until: Int

  private var _primeNumberCounter: PrimeCountable!
  public var primeNumberCounter: PrimeCountable! {
    get {
      return _primeNumberCounter
    }
    set {
      _primeNumberCounter = newValue
    }
  }
  
  init(until: Int) {
    self.until = until
    self.primeNumberCounter = SieveOfEranthoses(until: until)
  }
  
  public mutating func setPrimeNumberCounter(countWay: PrimeCountable) {
    self.primeNumberCounter = countWay
  }
  
  func print(until: Int) -> [Int] {
    return primeNumberCounter.getPrimeNumbers(until: 100).flatMap { $0 }
  }
  
  func printNumberAsString(until: Int) -> [String] {
    return print(until: 100).flatMap { String($0) }
  }
}

struct NaturalStringMachine: PrintStringable {
  var until: Int
  func printNumberAsString(until: Int) -> [String] {
    return print(until: until).flatMap { String($0) }
  }
  
  func print(until: Int) -> [Int] {
    return (0...until).map { $0 }
  }
}

struct StringMachineFactory: MachineSeriealizable {
  func createMachine(identifier: MachineSeries) -> Printable {
    switch identifier {
    case .natural:
      return NaturalStringMachine(until: 100)
    case .prime:
      return PrimeStringMachine(until: 100)
    }
  }
}

enum FactorySeries {
  case string
  case number
}

// + abstract factory pattern
protocol MachineSeriealizable {
  func createMachine(identifier: MachineSeries) -> Printable
}

protocol Machinenable {
  static func selectMachineStyle(style: FactorySeries) -> MachineSeriealizable
}

struct MachineFactory: Machinenable {
  static func selectMachineStyle(style: FactorySeries) -> MachineSeriealizable {
    switch style {
    case .number:
      return NumberMachineFactory()
    case .string:
      return StringMachineFactory()
    }
  }
}

print("start of strategy pattern test")
if let naturalMachine = MachineFactory.selectMachineStyle(style: .number).createMachine(identifier: .natural) as? PrintNumberable {
  if var primeMachine = MachineFactory.selectMachineStyle(style: .number).createMachine(identifier: .prime) as? PrimeMachine {
    let until = 100
    print("before strategy")
    primeMachine.printNumber(until: until)
    primeMachine.setPrimeNumberCounter(countWay: OptimizedSieveOfEranthoses(until: until))
    print("after strategy")
    primeMachine.printNumber(until: until)
    print("roll back strategy")
    primeMachine.setPrimeNumberCounter(countWay: SieveOfEranthoses(until: until))
    primeMachine.printNumber(until: until)
    naturalMachine.printNumber(until: until)
    // let machineArray = [naturalMachine, primeMachine]
    
//    machineArray.forEach {
//      if $0 is NaturalMachine { print("natural : ", $0.printNumber(until: until)) }
//      if $0 is PrimeMachine { print("prime : ", $0.printNumber(until: until)) }
//    }
  }
}
print("end of strategy pattern test")

if let naturalMachine = MachineFactory.selectMachineStyle(style: .string).createMachine(identifier: .natural) as? PrintStringable {
  if let primeMachine = MachineFactory.selectMachineStyle(style: .string).createMachine(identifier: .prime) as? PrintStringable {
    let until = 100
    primeMachine.printNumberAsString(until: until)
    naturalMachine.printNumberAsString(until: until)
// let machineArray = [naturalMachine, primeMachine]
    
//    machineArray.forEach {
//      if $0 is NaturalMachine { print("natural : ", $0.printNumberAsString(until: until)) }
//      if $0 is PrimeMachine { print("prime : ", $0.printNumberAsString(until: until)) }
//    }
  }
}

// + strategy pattern

