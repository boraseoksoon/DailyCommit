import UIKit

print("Fun coding for Swift 5 Result Type.")

enum AnErrorType: Error {
    case failureReason1
    case failureReason2
}

func failableFunction() -> Result<Int, AnErrorType> {
    if true {
        return .failure(.failureReason2)
    }
    return .success(1)
}

switch failableFunction() {
case .success(let integerResult):
    print("success \(integerResult), it's been a while Swift.")
case .failure(let error):
    switch error {
    case .failureReason1:
        print("failure1")
    case .failureReason2:
        print("failure2")
    }
}

func resultFunction(complete: @escaping (Result<Int, AnErrorType>) -> Void) -> Void {
    if false {
        complete(.failure(.failureReason1))
    }
    complete(.success(44))
}

resultFunction { result in
    switch result {
    case .success(let val):
        print("successWith value : \(val)")
    case .failure(let err):
        print("err : %@", err)
    }
}






