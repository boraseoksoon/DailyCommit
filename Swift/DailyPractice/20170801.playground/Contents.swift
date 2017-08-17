//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



enum MyError: Error {
    case runtimeError(msg: String)
    case otherError(msg: String)
}


func errorTest(isError: Bool) throws -> Void {
    if isError {
        throw MyError.runtimeError(msg: "check error test")
    }
    
    print("no error!")
}


// plain try
do {
    errorTest(isError: true)
} catch(runtimeError) {
    print("runtime error caught!")
    
} catch {
    print("another error!")
}

// try!
try! errorTest(isError: false)

// try?
if let test = try? errorTest(isError: true) {
    print("test is "\(test))
} else {
    print("optional binding failure!")
}