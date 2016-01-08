//: [Previous](@previous)
/*:
# **Enums**

----

Swift Enums are pretty cool and way more powerful than their Obj-C counterparts.  They can associate values, adhere to protocols, be added to arrays etc.  Enums are useful in situations where an object can have a known, limited number of permutations
*/
enum FamilyMember {
    case Parent
    case Grandparent
    case Sibling
    
    var greeting: String {
        switch self {
        case .Parent:
            return "Hi"
        case .Grandparent:
            return "Hello"
        case .Sibling:
            return "Sup"
        }
    }
}

let dad = FamilyMember.Parent
//say hi
print(dad.greeting)

//: By default Swift Enums don't have a raw value representation like Objective C enums (where they are all ints).  You can change that by adhering to the RawRepresentable protocol through a type
enum MobileOS: String {
    case Android //The enum's name is used as the raw value in this case
    case IOS = "iOS"
}
//: Enums can also have associated values
enum Result {
    case Success(Int)
    case Failure()
}

func doSomething(input: Int) -> Result {
    guard input < 10 else {
        return .Failure()
    }
    return .Success(input)
}
//: You'll see this pattern used with generics very often in situations with a possible error return **cough cough Alamofire**
switch doSomething(5) {
case .Success(let value):
    print("we did it reddit value:\(value)")
case .Failure:
    print("Facepalm")
}
//: [Next](@next)
