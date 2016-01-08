/*:
[Previous](@previous)
# **Tuples**

----

Tuples are groupings of variables.  They can be very useful when associated information needs to be lumped together without defining a new class/struct, or a function needs to return multiple values, etc.
*/
let person = ("John", 42)
person.0 // "John"
person.1 // 42
//: Tuples can also have named variables
let _person = (name: "Jacob", age: 33)
_person.name // "Jacob"
_person.age // 33

//: Tuples without named variables can still be accessed in a sane fashion through "destructuring"
let (name, age) = person
name // "John"
age // 42

//: Some kinds of functions naturally use tuples, a good example is iterating a dictionary
let productQuantities : [String: Int] = [
    "Skateboards": 10,
    "Bikes": 22
]
for (key, value) in productQuantities {
    print("\(key): \(value)")
}
//: Or enumerating an array with index like from the first page
let alphabet = ["A", "B", "C"]
for (index, element) in alphabet.enumerate() {
    print("\(index):\(element)") //"0:A", "1:B", "2:C"
}
//: [Next](@next)
