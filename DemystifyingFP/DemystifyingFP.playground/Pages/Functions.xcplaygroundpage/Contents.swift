import Foundation
import Combine
/*:
 # What is Functional Programming?
 
 Functional Programming is programming with functions
 */
func sum(_ x: Int, _ y: Int, _ z: Int) -> Int {
    x + y + z
}
/*:
 ## Total
 
 A function provides an output for every possible input.
 */
enum DivisionError: Error {
    case dividendIsZero
}

func divide(_ x: Double, _ y: Double) -> Result<Double, DivisionError> {
    guard y != 0 else {
        return Result.failure(DivisionError.dividendIsZero)
    }
    return Result.success(x / y)
}

/*:
 ## Deterministic
 
 A function always returns the same value for a given input.
 */
func makeFilename(prefix: String, extension ext: String, now: Date = Date()) -> String {
    return "\(prefix)-\(now).\(ext)"
}

/*:
 ## Pure
 
 A function only computes its result and performs no side effect.
 */
func greet(name: String) -> Void {
    print("Hello 1 \(name)!")
}

greet(name: "Swift Community")



func greet2(name: String) -> AnyPublisher<Void, Never> {
    Future { promise in
        print("Hello 2 \(name)!")
        promise(.success(()))
    }.eraseToAnyPublisher()
}

greet2(name: "Swift Community")




func greet3(name: String) -> AnyPublisher<Void, Never> {
    Deferred {
        Future { promise in
            print("Hello 3 \(name)!")
            promise(.success(()))
        }
    }.eraseToAnyPublisher()
}

greet3(name: "Swift Community").sink { _ in }

/*:
 ### Quiz
 
 How many times does this code print "Hello 2 Swift Community!"?
 */
greet2(name: "Swift Community").flatMap { _ in
    greet2(name: "Swift Community")
}.sink { _ in }

/*:
 What about this one?
 */
let publisher = greet2(name: "Swift Community")
publisher.flatMap { _ in
    publisher
}.sink { _ in }

/*:
 And this one?
 */
greet3(name: "Swift Community").flatMap { _ in
    greet3(name: "Swift Community")
}.sink { _ in }

/*:
 And finally this one?
 */
let publisher2 = greet3(name: "Swift Community")
publisher2.flatMap { _ in
    publisher2
}.sink { _ in }

//: [Next](@next)
