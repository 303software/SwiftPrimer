/*:
[Generics Reference]: https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Generics.html#//apple_ref/doc/uid/TP40014097-CH26-ID179

[Previous](@previous)
# **Generics**

----

[Generics Reference]

Generics allow us to write flexible functions and types that work with multiple different other types.  Java developers will be familiar.
Let's create a stack struct to illustrate the problem generics solve.
*/
struct IntStack {
    private var array: [Int] = []
    mutating func pop() -> Int? {
        guard array.count > 0 else {
            return nil
        }
        return array.removeFirst()
    }
    mutating func push(input: Int) {
        array.insert(input, atIndex: 0)
    }
}

var stack = IntStack()
stack.push(1)
stack.push(2)
stack.push(3)
stack.pop() //3
//: Nifty.  But what if we want to do the same with strings or Floats?  We could define new `StringStack` and `FloatStack` structs, but that seems like a lot of effort.  Instead, let's use generics
struct GenericStack<T> {
    private var array: [T] = []
    mutating func pop() -> T? {
        guard array.count > 0 else {
            return nil
        }
        return array.removeFirst()
    }
    mutating func push(input: T) {
        array.insert(input, atIndex: 0)
    }
}

var intStack = GenericStack<Int>()
intStack.push(1)
intStack.push(2)

var stringStack = GenericStack<String>()
stringStack.push("hello")
stringStack.push("DAD?")
//compiler won't allow this: stringStack.push(33)

import Foundation
var requestStack = GenericStack<NSURLRequest>()
requestStack.push(NSURLRequest(URL: NSURL(string: "http://www.reddit.com")!))
let request = requestStack.pop()! //Compiler knows this is a NSURLRequest,  no casting necessary.
//: etc etc etc You get the point

//: You can also constrain generic types
struct Printer<T: CustomStringConvertible> {
    let obj: T
    func printWrappedObj() {
        print(obj)
    }
}

/*:
# **Advanced**
There's so much more to go over with generics, this needs more updating
*/
//: [Next](@next)
