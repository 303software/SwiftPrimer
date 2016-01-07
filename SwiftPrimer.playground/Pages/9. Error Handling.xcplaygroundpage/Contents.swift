//: [Previous](@previous)

/*:
#Error Handling
[Swift Error Handling Rationale]: https://github.com/apple/swift/blob/master/docs/ErrorHandlingRationale.rst

Got a while to learn stuff? [Swift Error Handling Rationale]
Swift propagates errors in a way that is 

+ Typed
+ Automatic
+ Marked
+ Statically Enforced

If you want to understand each of these terms and how they relate to both Swift and other languages, read the error handling rationale.

Java is a reasonably good analog for Swift Error Handling.  As is Rust.  The concept of try/catch alone is ubiquitous in many modern languages.
*/

//: At its core, Swift uses the very lightweight ErrorType protocol.  It's best used on Swift enums in personal implementations, although NSError also adheres to ErrorType

enum Error : ErrorType {
    case NetworkError
    case HumanError
    case ExplosionError
}

//: Functions that can throw are marked with the 'throws' keyword
func couldError(input: Int) throws -> Int {
    guard input < 100 else {
        throw Error.ExplosionError
    }
    return input
}

/*:
## Proper Error Handling
+ Blocks containing throwing code are designated with 'do'
+ Throwing calls are marked with 'try'
+ Errors are caught with 'catch'
+ Cleanup is done with 'defer' (somewhat similar to Java's finally)
*/

do {
    defer {
        //defer blocks are executed whenever control flow leaves the current scope (they can be used with any kind of scope, not just 'do' blocks).  In this situation, they are very useful for cleaning up resources regardless of error state.
        print("cleaned up")
    }
    let a = try couldError(100)
    print(a)
} catch let error {
    print(error)
}


/*:
## Quick And Dirty Error Handling
Just because these functions exist in the language doesn't mean you should use them.  Probably 9/10 times the full error handling syntax is instead appropriate
*/

//: Creates an optional out of the result
let optionalResult = try? couldError(100) //nil
let forcedResult = try! couldError(50) // try it with 100, it'll crash the app



5





//: [Next](@next)
