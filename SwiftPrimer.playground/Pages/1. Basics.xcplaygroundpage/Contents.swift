/*: 
[Basics Reference]: https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309

[Previous](@previous)
# **Basics**

----

[Basics Reference]
# **Types**
Swift is a strongly typed language with type inference.  This means you don't always have to explictly declare your types, the compiler will infer it for you.
*/
let string1 : String = "yes"
let string2 = "yes" //compiler infers this is a string
//: Types can be aliased for ease of use or conceptual clarity
typealias Quantity = Int
let quantity : Quantity = 42
/*:
# **Mutability**

----

Swift has two different variable declaration keywords depending on the intended mutability.  Try and play with these.
The default for variables should be immutable unless there is a valid reason for mutation.  Immutable variables are much easier for humans to reason about and the compiler to optimize for.

*/
let immutable = 33 //cannot be reassigned
var mutable = 42 //can be reassigned
//: Using var vs let will change the available methods on value types like collections
var mutableArray = [1, 2, 3]
mutableArray.append(4)
let immutableArray = [1, 2, 3]
//immutableArray.append(5) //not allowed
/*:
# **Control Flow**

----

If statements don't require parenths
*/
if 1+1 == 2 {}
//: Swift 2.0 introduced the 'guard' keyword.  It's used primarily to protect against invalid inputs.  Use it for such, it promotes code clarity.
func doublesIfUnderFive(input: Int) -> Int? {
    guard input < 5 else {
        return nil;
    }
    return input * 2
}
//: You can construct sequences on the fly.  x...y will create a sequence from x to y inclusive of both.  You can also use < or >.  These loops are equivalent
for i in 0...2 {
    print(i) // 0, 1, 2
}
for i in 0..<3 {
    print(i) // 0, 1, 2
}
//: Traditional array based 'for in' loops are also supported
let alphabet = ["A", "B", "C"]
for letter in alphabet {
    print(letter) //A, B, C
}
//: Or get weirder and enumerate with an index.  The (index, element) structure is a Tuple, we'll get to them later
for (index, element) in alphabet.enumerate() {
    print("\(index):\(element)") //"0:A", "1:B", "2:C"
}
//: You can also qualify your for loops with a where clause
for i in 0...10 where i % 2 == 0 { //get only the even numbers between 0-10
    print(i)
}
//: Or use the stride method for the same functionality
for i in 0.stride(through: 10, by: 2) {
    print(i)
}
//: C style loops work as well, although there is talk of removing them from the language as antiquated with Swift 3.0
for (var i=0; i<3; i++ ) {
    print(i)
}
//: [Next](@next)
