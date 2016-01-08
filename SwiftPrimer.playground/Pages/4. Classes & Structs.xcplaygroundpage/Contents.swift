/*:
[Swift Initialization]: https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html
[Classes & Structs Reference]: https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html#//apple_ref/doc/uid/TP40014097-CH13-ID82

[Previous](@previous)
# **Classes**

----
[Classes & Structs Reference]

A class is a reference type.
Swift has strict initialization rules for classes with inheritance [Swift Initialization]
*/
class ReferenceType {
    var msg: String
    required init(msg: String) {
        self.msg = msg //all of a classes non optional variables must be initialized by the end of a required initializer
    }
    convenience init() {
        self.init(msg: "Hello World") //convenience initializers must call a required initializer from within the same class
    }
}

class SubClassOne : ReferenceType {}
//: If you don't provide any initializers, all of the superclass' initializers will be available
SubClassOne()
SubClassOne(msg: "Dad?")
/*:
Things get more complicated if a subclass offers its own initializers.  In this case, make note of:
+ A subclass must override any designated (required) initializers from it's super class
*/
class SubClassTwo : ReferenceType {
    let fruit: String
    required init(fruit: String) {
        self.fruit = fruit
        super.init(msg: "Dad?") // A class must initialize all of its variables before passing initialization to its super class
    }

    required init(msg: String) { //Subclasses must implement their superclasses required initializers if they have any intializers of their own
        self.fruit = "Apple"
        super.init(msg: msg)
    }
}

SubClassTwo(fruit: "Banana")
SubClassTwo(msg: "YOLO")
SubClassTwo()
/*:
# **Structs**

----

A struct is a value type.  They cannot be subclassed, as structs have no notion of inheritance.  Beyond that and their pass-by-value semantics they behave similar to classes.  They can be put in arrays (unlike Obj-C), contain functions, adhere to protocols etc.
*/
struct ValueType {
    var msg: String
    var fruit: String
}
//:  Structs are generated with implicit initializers for all their variables.  Even though we haven't defined one for ValueType, we can use:
ValueType(msg: "Dad?", fruit: "Pear")
//: They have innate support for restricting their functions based on mutable / immutable stats.  This is done by marking mutating functions with the `mutating` keyword and utilizing let vs var semantics
struct PandaBear {
    var name: String
    mutating func nameSteve() {
        name = "Steve"
    }
}
var pandaOne = PandaBear(name: "Greg")
pandaOne.nameSteve()

let pandaTwo = PandaBear(name: "Donald")
//compiler will not allow this 
//pandaTwo.nameSteve()

/*: 
# **Value vs Reference Types**

----

*/
var ref = ReferenceType(msg: "Dad?")
var ref2 = ref
ref2.msg = "It's me, son"
ref.msg == ref2.msg //true

var value = ValueType(msg: "Who?", fruit: "Lyche")
var value2 = value
value2.fruit = "Guava"
value.fruit == value2.fruit //false
//: This needs some improvement.  Short of it is that value types (structs) make superior models in many situations because you can be assured no other code is modifying the model at any time.  You can think of new struct references (like below) generating a copy of the struct instead of another reference to the same object like classes.  This leads to more reliable code.  This isn't exactly the case, but it's pretty close.  Swift actually implements Copy On Write semantics to reduce the overhead of working with structs.  In reality, the struct copy is only made when necessary, i.e. a mutation occurs

/*:
# **Advanced**
### Copy on Write

----

TODO
*/


