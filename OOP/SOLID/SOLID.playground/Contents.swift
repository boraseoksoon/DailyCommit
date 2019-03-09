import UIKit


// (1) The Single Responsibility Principle (SRP)
// problematic case
/*
class Handler {
    func handle() {
        let data = requestDataToAPI()
        let array = parse(data: data)
        saveToDB(array: array)
    }
    
    private func requestDataToAPI() -> Data {
        // send API request and wait the response
        return Data()
    }
    
    private func parse(data: Data) -> [String] {
        // parse the data and create the array
        return [String]()
    }
    
    private func saveToDB(array: [String]) {
        // save the array in a database (CoreData/Realm/...)
    }
}
*/


// the class structure SRP applied.
/**
 This principle helps you to keep your classes as clean as possible. Moreover, in the first example you couldn’t test requestDataToAPI, parse and saveToDB directly, since those were private methods. After the refactor, you can easily do it testing APIHandler, ParseHandler and DBHandler.
 */
class Handler {
    let apiHandler: APIHandler
    let parseHandler: ParseHandler
    let dbHandler: DBHandler
    
    init(apiHandler: APIHandler, parseHandler: ParseHandler, dbHandler: DBHandler) {
        self.apiHandler = apiHandler
        self.parseHandler = parseHandler
        self.dbHandler = dbHandler
    }
    
    func handle() {
        let data = apiHandler.requestDataToAPI()
        let array = parseHandler.parse(data: data)
        dbHandler.saveToDB(array: array)
    }
}

class APIHandler {
    
    func requestDataToAPI() -> Data {
        // send API request and wait the response
        return Data()
    }
}

class ParseHandler {
    
    func parse(data: Data) -> [String] {
        // parse the data and create the array
        return [String]()
    }
}

class DBHandler {
    
    func saveToDB(array: [String]) {
        // save the array in a database (CoreData/Realm/...)
    }
}


// (2) The Open-Closed Principle (OCP)
/*
If you want to create a class easy to maintain, it must have two important characteristics:
Open for extension: You should be able to extend or change the behaviours of a class without efforts.
Closed for modification: You must extend a class without changing the implementation.
*/

/*
class Logger {
    
    func printData() {
        let cars = [
            Car(name: "Batmobile", color: "Black"),
            Car(name: "SuperCar", color: "Gold"),
            Car(name: "FamilyCar", color: "Grey")
        ]
        
        cars.forEach { car in
            print(car.printDetails())
        }
        
        let bicycles = [
            Bicycle(type: "BMX"),
            Bicycle(type: "Tandem")
        ]
        
        bicycles.forEach { bicycles in
            print(bicycles.printDetails())
        }
    }
}

class Car {
    let name: String
    let color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    func printDetails() -> String {
        return "I'm \(name) and my color is \(color)"
    }
}

class Bicycle {
    let type: String
    
    init(type: String) {
        self.type = type
    }
    
    func printDetails() -> String {
        return "I'm a \(type)"
    }
}
*/

/**
We can solve this problem creating a new protocol Printable, which will be implemented by the classes to log. Finally, printData will print an array of Printable.
In this way, we create a new abstract layer between printData and the class to log, allowing the print of other classes like Bicycle and without changing the printData implementation.
*/
protocol Printable {
    func printDetails() -> String
}

class Logger {
    
    func printData() {
        let cars: [Printable] = [
            Car(name: "Batmobile", color: "Black"),
            Car(name: "SuperCar", color: "Gold"),
            Car(name: "FamilyCar", color: "Grey"),
            Bicycle(type: "BMX"),
            Bicycle(type: "Tandem")
        ]
        
        cars.forEach { car in
            print(car.printDetails())
        }
    }
}

class Car: Printable {
    let name: String
    let color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    func printDetails() -> String {
        return "I'm \(name) and my color is \(color)"
    }
}

class Bicycle: Printable {
    let type: String
    
    init(type: String) {
        self.type = type
    }
    
    func printDetails() -> String {
        return "I'm a \(type)"
    }
}
