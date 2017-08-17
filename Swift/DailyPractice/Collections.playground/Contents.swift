//: Playground - noun: a place where people can play

import UIKit



// Collections

/*********
//
//
//
//  List
//
//
*********/

// 선언
var array = [Int]()
var array2 = Array<Int>()
var array3 : Array<Int>

// 기본값으로 배열 생성하기
var threeDoubles = Array(repeating: 0.0, count: 3)

//두개의 다른 배열을 더하여 만들기
//이때 역시 더할 수 있는 배열은 같은 자료형을 가진 배열만이 가능하다.
// var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles


//배열의 접근과 수정
//배열의 메소드와 프로퍼티 서브스크립트 문법 ( [ ] )을 통해 접근과 수정을 할 수 있다.
//접근

var shoppingList = ["Eggs", "Milk"]

print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

var firstItem = shoppingList[0]
firstItem = shoppingList.first!


//추가
shoppingList.append("Flour")

shoppingList += ["Baking Powder"] // shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

shoppingList.insert("Maple Syrup", at: 0)



//수정
shoppingList[0] = "Six eggs"
shoppingList[4...6] = ["Bananas", "Apples"]

let sixEggs = shoppingList.remove(at: 0)
let butter = shoppingList.removeLast()

//반복
for item in shoppingList.sorted() {
    print("list iteration : \(item)")
}

for (index, value) in shoppingList.enumerated() {
    print("list iteration with index Item \(index + 1): \(value)")
}


/*********
 //
 //
 //
 //  Set
 //
 //
 *********/

//
//Set
//
//순서없이 같은 타입의 고유한 값을 저장한다.
//
//Set 에 저장하기 위해서는 반드시 hashable 해야한다.
//해쉬값은 Int 이며
//a == b 이면, 모든 객체에 대해 같은지 비교한다.
//
//Swift 의 모든 기본타입인 String, Int, Float, Double, Bool 은 hashable 하고
//관련 값이 없는 열거형 조건(case) 값 또한 기본적으로 해쉬가 가능하다.
//
//
//선언

var set = Set<Character>()
var set2 : Set<Character>

//위 방법 말고도 배열 표현식으로 생성할 수도 있다.

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

//접근
// var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}


//수정
favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}


//반복
for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}


//집합 연산

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted() // 합집합
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

oddDigits.intersection(evenDigits).sorted() // 교집합
// []

oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // 차집합
// [1, 9]

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // 교집합의 여집합
// [1, 2, 9]


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)  // house 가 farm 의 subset
// true

farmAnimals.isSuperset(of: houseAnimals)    // farm 이 house 의 superset
// true

farmAnimals.isDisjoint(with: cityAnimals)   // 공통된게 하나도 없음 (분리되어있음)
// true





/*********
 //
 //
 //
 //  Dictionary
 //
 //
 *********/
var emptyDict: [String: String] = [:]
var responseMessages = [200: "OK",
                        403: "Access forbidden",
                        404: "File not found",
                        500: "Internal server error"]
var testDict = Dictionary<String, String>()

//Dictionary
//
//dictionary 의 Key 타입은 세트의 값 타임처럼
//반드시 Hashable 해야한다.
//
//
//선언

var dictionary = [Int : String]()
var dictionary2 = Dictionary<Int, String>()
var dictionary3 : Dictionary<Int, String>

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//
////접근
//
//var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

print("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}


//수정
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

airports["APL"] = "Apple International"
// "Apple International" is not the real airport for APL, so delete it

airports["APL"] = nil

//반복

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// YYZ: Toronto Pearson // LHR: London Heathrow

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
} // Airport code: YYZ // Airport code: LHR

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//to Array
//
//특정 순서로 딕셔너리의 키 또는 값을 반복하기 위해
//keys 또는 values 프로퍼티에서 sorted() 메소드를 사용한다.

let airportCodes = [String](airports.keys)
// airportCodes is ["YYZ", "LHR"]

let airportNames = [String](airports.values)
// airportNames is ["Toronto Pearson", "London Heathrow"]
