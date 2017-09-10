//: Playground - noun: a place where people can play

import UIKit

var str2: String? = "switch more"
var str: String? = "Pattern Matching + Where clause"
var str3: String? = nil

if let s1 = str, let s2 = str2, s1 != s2 {
  print("right condition!")
} else {
  print("something is wrong")
}

// pattern matching : 
// reference : https://soooprmx.com/archives/6251

/*
1. identifier-pattern
2. value-binding-pattern
3. tuple-pattern
4. enum-case-pattern
5. optional-pattern
6. type-casting-pattern
7. expression-pattern
*/

let a = 42
var b = 43

// 1. identifier-pattern
// 이패턴은 그냥 변수/상수이름을 그냥 쓰는 것을 의미한다. 실제 매칭은 좌변을 평가한 값을 우변에 매칭하는 것이다.

if case a = b {
  print("a : \(a) is equal to b : \(b).")
} else {
  print("a : \(a) is NOT equal to b : \(b).")
}


// 2. value-binding-pattern
// 이 패턴은 옵셔널 바인딩과는 다르게, 우변의 값을 좌편의 이름에 바인딩한다. 이 때 우변은 옵셔널이 아니어도 상관없다.
if case let value = b {
  print("just assigned")
} else {
  print("assign failed")
}

// where is removed for if binding in Swift >= 3.0
// if case let x = b, where x == a {

//  단순 값의 바인딩 패턴은 항상 매칭하므로 where 가드를 적용했다.
if case let x = b, x == a {
  print("conditional assign")
} else {
  print("x is not equal a, so failed to assign")
}

// 3. tuple-pattern
// 튜플 패턴은 튜플 형태의 표시를 의미한다. 다음 예제는 두번째 요소가 0인 모든 튜플에 매칭하는 패턴을 검사한다.
let tuple = (4, 4)
if case (_, 0) = tuple {
  print("tuple is on the X axis.")
}

// where was removed
// if case let (x , y) = a where x == y {
if case let (x , y) = tuple, x == y {
  print("a is on the line f(x) = x.")
}

// 4. enum-case 패턴
// enum-case 패턴은 우변의 값이 enum 타입의 특정 case에 해당하는지를 보는 것이다.
enum Either {
  case Left(Int, Int)
  case Right(Double, Double)
}

var either = Either.Left(13, 169)
if case .Left = either {
  print("either is .Left type")
}

var either2 = Either.Left(14, 169)
// where is removed
if case .Left(let x, let y) = either2, x % 2 == 0 && y % 2 != 0 {
  print("either is .Left type and its first element is even and second element is not even number.")
}
if case .Left(let x, _) = either2, x % 2 == 0 {
  print("either is .Left type and its first element is even number.")
}

// 5. optional 패턴
// 옵셔널 패턴은 식별자뒤에 ?가 붙은 식이다. 이는 nil이 아닌 옵셔널 값에 매칭한다. 가장 간단한 패턴은 다음과 같다.

let p: Int? = 10
let q: Int = 10
if case q? = p {
  print("p is not nil, and its wrapped value is equal to q.")
}

if case let x? = p {
  print("optional binding prototype model : ", x)
}

// 위 패턴은 아래의 옵셔널 바인딩 패턴과 동일하게 동작한다.

if let x = p {
  print("optional binding : ", x)
}

//튜플 패턴과 결합하는 경우에 한가지 고려할 점은 (Int?, Int?) 타입과 (Int, Int)? 타입은 다르다는 것이다.
//전자는 두 개의 정수형 옵셔널의 짝으로 된 튜플이고 튜플 자체는 옵셔널이 아니다. 후자의 경우에는 반대로 튜플 자체가 옵셔널이며,
//각각의 원소는 옵셔널이 아니다.

let k: (Int?, Int?) = (4, 8)
// k -> (Optional(4), Optional(8))

// where is removed
// if case let (x?, y?) = k where x * 2 == y {
if case let (x?, y?) = k, x * 2 == y {
  print("k.0 * 2 == k.1")
}

let l: (Int, Int)? = (4, 8)
// l -> Optional((4, 8))

// where is removed
// if case let (x, y)? = l where x * 2 == y {
if case let (x, y)? = l, x * 2 == y {
  print("l is not nil and is pair of \(x) and \(y)")
}

let m: (Int?, Int?)? = (4, 8)
if case let (x?, y?)? = m {
  print("tuple (\(x) and \(y)) has been optional binding!")
}

// 6) type-casting

//타입 캐스팅 패턴은 is 패턴과 as 패턴 두 가지가 있다.
//  
//is-pattern: is Type
//as-pattern: pattern as Type
//is 패턴은 간단히 좌면을 is 타입, 우변은 검사할 값으로 둬서 우변이 해당 타입에 매치하는지 본다. 
//as 패턴은 as 왼쪽의 패턴에 먼저 매치한 후, 매치가 성공하면 해당 패턴을 as 오른쪽의 타입으로 캐스팅해본다. 
// 캐스팅에 성공하면 통과, 성공하지 못하면 실패로 간주한다.

var c: Any = 23
if case is Int = c {
  print("c is Integer")
}

c = 23.4
if case let x as Double = c {
  print("c is Double")
}

c = "23.4"

if case let x as Double = c  {
  // 값 바인딩 패턴엔 매치하지만 이후 as 패턴에 매치 실패한다.
  print("this is never printed")
}

if case let x = c as? Double {
  print("test proceeds!")
}

if let x = c as? Double {
  print("test proceeds2!")
}

//7) expression 패턴
//
//표현식 패턴은 가장 단순하게는 같은 값인지 보는 것이다. 실제로는 Swift 표준 라이브러리에 정의된 ~= 연산자에 의해서 검증한 결과를 매치한다.
let t = 8
if case (1...10) = t {
  print("t is between 1 and 10")
}

// same thing
if (1...10) ~= t {
  print("t is between 1 and 10")
}

func ~= (pattern: String, value: Int) -> Bool {
  return pattern == "\(value)"
}

let u = 128
if case "128" = u {
  print("It is 128.")
}


//if case let x = c as! Double {
//  print("test proceeds2!")
//}


// FizzBuzz solved by switch in Swift.

for i in 1 ... 100 {
  switch (i % 3, i % 5) {
  case (0, 0):
    print("Fizz Buzz")
  case (0, _):
    print("Fizz")
  case (_, 0):
    print("Buzz")
  default:
    print(i)
  }
}

for i in 1...100 {
  switch i {
    case let val where val % 3 == 0 && val % 5 == 0:
      print("FizzBuzz")
    case let val where val % 3 == 0:
      print("Fizz")
    case let val where val % 5 == 0:
      print("Buzz")
    case let val:
      print("value : \(val)")
      // it will stop fall through to default.
    default:
      print(i)
  }
}

let switchTest = 10

switch switchTest {
  case 1,2,3,4:
    print("in 1 section")
  case 5,6,7,8:
    print("in 2 section")
  case 9,10:
    print("in 3 section")
  default:
    print("in 4 section")
}

let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
  possibleIntegerValue = 1
case "2", "٢", "二", "๒":
  possibleIntegerValue = 2
case "3", "٣", "三", "๓":
  possibleIntegerValue = 3
case "4", "٤", "四", "๔":
  possibleIntegerValue = 4
default:
  break
}

if let integerValue = possibleIntegerValue {
  print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
  print("An integer value could not be found for \(numberSymbol).")
}



enum Result<T> {
  case success(T)
  case failure(Error)
}

var testVar = "hot cold warm"

// binding value in switch
switch testVar {
  case let value where value.hasPrefix("hot") && value.hasSuffix("cold"):
    print("got'cha! = \(value)")
  default:
    print("wrong?")
}

// enum
enum XYZ {
  case X
  case Y
  case Z
}

let x = XYZ.Z

switch x {
case .X, .Y where false:
  print("x or y")
case .Z:
  print("z")
default:
  print("default")
}


print("Iterator in Swift for fun coding")

struct IteratorClass: IteratorProtocol {
  var current: Optional<Int>
  var end: Int?
  var incrementBy: Int?
  
  init(current: Int, end: Int, by: Int) {
    self.current = current
    self.end = end
    self.incrementBy = by
  }
  
  mutating func next() -> Int? {
    guard self.current! < self.end! else {
      self.current = 0
      return nil
    }
    let increment: Optional<Int> = self.incrementBy
    self.current! += increment!
    return Optional.some(self.current!)
  }
}

struct SequenceClass: Sequence {
  var start: Int
  var end: Int
  var incrementBy: Int
  
  init(start: Int, end: Int, by: Int) {
    self.start = start
    self.end = end
    self.incrementBy = by
  }
  
  func makeIterator() -> IteratorClass {
    return IteratorClass(current: self.start, end: self.end, by: self.incrementBy)
  }
}

let sequence = SequenceClass(start: 0, end: 100, by: 10)

for i in sequence {
  print("i : ", i)
}

for i in sequence {
  print("i : ", i)
}

var generator = sequence.makeIterator()

for i in sequence {
  print("i : ", i)
}

while let val = generator.next() {
  print(val)
}

for i in sequence {
  print("i : ", i)
}

while let val = generator.next() {
  print(val)
}

while let val = generator.next() {
  print(val)
}
while let val = generator.next() {
  print(val)
}
while let val = generator.next() {
  print(val)
}
