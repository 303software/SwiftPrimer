/*:

[Previous](@previous)
# Optionals
[Optionals Reference]:https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID330

[Optionals Reference]

Optionals denote whether a variable can accept nil as a possible value or not.  ! and ? are used to denote optional status.  Note that nil is not a pointer reference as in Objective-C, but the absence of a value.  Unlike Obj-C, an Int can be nil for example
*/
let optional1 : Int? = nil //marked as optional by ?
let optional2 : Int? = 42
let nonOptional : Int = 42 //this can never be nil

//: Optionals must be unwrapped to use, 'if let' statements help do this in a clean, safe way
if let value = optional1 {
    //optional1 is nil so this will never be executed
}
if let value = optional2 {
    print(value) //42
}
//: 'if let' statements can be chained
if let v1 = optional1,
    let v2 = optional2 {
        //optional1 is nil, this will never be executed
}
//: 'if let' statements can include where clauses
if let value = optional2 where value > 7 {
    print(value) //42
}
//: 'guard' statements can also use 'let' but with an important distinction.  The variable is available to the scope surrounding the guard statement, not inside it.
func optionalInput(input: Int?) -> Int? {
    guard let i = input else {
        //can't access i here
        return nil
    }
    //can access i here
    return i
}
//: There is also a shorthand ternary statement for optionals.  It is very useful for establishing defaults
let optionalSetting: String? = nil
let setting = optionalSetting ?? "Default Setting"

/*:
Optionals can also be force unwrapped if you are sure they won't be nil.  Use force unwraps very sparingly, a nil value will crash your application at runtime with an uncatchable logic error.  'if let' statements are much safer.  Use a `!` to force unwrap an optional
*/
print(optional2!) //try it with optional1, it will throw a runtime error

/*:
An optional can also be marked as implictly unwrapped.  Implicitly unwrapped optionals can be nil, but are assumed to never be.  If this sounds dangerous, you're very right as they remove the compilers ability to ensure you are dealing with an optional correctly.  You'll see these used predominantly in IBOutlets, as a way to attach properties post initialization.  Try to avoid using them yourself as much as possible.  They are very dangerous.  An implictly unwrapped optional is declared with a '!' in the type signature instead of `?`
*/
let implictlyUnwrapped: String! = nil //accessing this variable will throw a run time exception, try print(implictlyUnwrapped)
let noCrashUnwrapped: String! = "whew" //used exactly like a normal (non optional) variable.  try print(noCrashUnwrapped)


/*:
## Advanced
For later reflection :)

Optionals aren't magic.  They have a very succint, generic enum based definition.  It looks something like this.  The compiler just adds a lot of convenience to working with them via the ? and ! operators
*/
enum _Optional<T> {
    case Some(T)
    case None
}
//: Using the real definition, these two are equivalent
let anotherOptional: Optional<String> = "yolo"
let _anotherOptional: String? = "yolo"
//: These two expressions are also equivalent
if let value = anotherOptional {
    print(value);
} else {
    print("No Value")
}
switch anotherOptional {
case .Some(let value):
    print(value)
case .None:
    print("No Value")
}



//: [Next](@next)
