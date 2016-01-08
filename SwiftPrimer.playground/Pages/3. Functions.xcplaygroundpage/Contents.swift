/*:
[Function Reference]: https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html
[Closure Reference]: https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html#//apple_ref/doc/uid/TP40014097-CH11-ID94

[Previous](@previous)
# **Functions**
### So many ways to define and call them
+ [Function Reference]
+ [Closure Reference]

----

Void return values can be ommited
*/
func doSomething() -> Void {}
func doSomethingElse() {} //these are the same

//: Parameters are named, but by default the first parameter name is ommited
func add(a: Int, b: Int) -> Int {
    return a + b
}
add(2, b:5)
//: This looks weird though.  A parameter can be referred to something different inside the function to outside.  So add could be rewritten as
func _add(a: Int, to b: Int) -> Int {
    return a + b
}
_add(2, to:5)
//: _ is used throughout Swift to indicate an unused value.  In this case it can be used to remove an external function param entirely.  We could rewrite add again as
func __add(a: Int, _ b: Int) -> Int {
    return a + b
}
__add(2, 5)
//:  Not that the first parameter in a (non init) function is always implictly unnamed, as if it had an _ in front of it

//: Functions can have other functions as parameters
func transformInt(input: Int, fn: (Int) -> Int) -> Int {
    return fn(input)
}
//: In descending verbosity, these are all equivalent function calls
transformInt(5, fn: { (input: Int) -> Int in
    return input * 2
})
//: Not how the Swift compiler can infer type information that is left out.
transformInt(5, fn: { input in
    return input * 2
})
//: You can use a special notation for functions that use another function as their last parameter
transformInt(5) { input in
    return input * 2
}
//: In addition to naming parameters, you can refer to them by their ordinality in the closure
transformInt(5) { return $0 * 2 }
//: As a special case, a closure with only one statement can be assumed to return that statement
transformInt(5) { $0 * 2 }

//: Functions can capture and modify variables from outside their scope.  A function that captures variables is called a closure
var b = 0
let closure = {
    b = 1
}
closure()
b // 1

//: A closure creates a strong reference to any variables it captures.  This is a good thing, but can lead to retain cycles if you are not careful.  In this example, fn retains a reference to self and self retains a reference to fn.  Neither will ever be released.
class MemoryNightmare {
    var fn: () -> Void = {}
    init() {
        self.fn = {
            self.doStuff()
        }
    }
    func doStuff() {
        print("shit")
    }
}
//:  This is where capture lists come in to the rescue!  In this case we're telling Swift to capture self in the closure as a weak reference.  Memory crisis averted.  You'll notice self becomes an optional since a weak reference can be nil.  'unowned' is another option.  unowned references don't need to be treated as optionals, but could potential be nil and will crash the app if accessed when nil
class MemorySafe : MemoryNightmare {
    override init() {
        super.init()
        self.fn = { [weak self] in
            self?.doStuff()
        }
    }
}

/*: 
# **Advanced**
### Currying

----

[Currying in Swift]: https://robots.thoughtbot.com/introduction-to-function-currying-in-swift
Not going to get at length into currying, but if you're into a mindfuck let's start partially applying functions.
More info: [Currying in Swift]
*/
func multiply(a: Int)(_ b: Int) -> Int {
    return a * b
}
multiply(5)(4) //20
//: That's a funny syntax, but it lets us partially apply a function
let timesFive = multiply(5)
timesFive(4) //20
//: Currying is a core feature of functional languages

//: [Next](@next)
