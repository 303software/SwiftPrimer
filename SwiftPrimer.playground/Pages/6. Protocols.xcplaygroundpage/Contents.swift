/*:
[Protocol Reference]: https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID267
[WWDC Protocol Oriented Programming]: https://developer.apple.com/videos/play/wwdc2015-408/

[Previous](@previous)
# **Protocols**
### Swift is a protocol oriented language

----

Protocols are the bread and butter of effective coding in Swift.   They allow us to work more effectively with different types by grouping them according to their functionality.  At it's core, a protocol is a contract that implementing types cans state they adhere to.  

Consider this example of animals in a zoo.
*/
protocol Animal {
    var full: Bool {get}
    mutating func eat(food: String)
}
protocol Flying {
    func fly()
}
protocol Vocal {
    func makeNoise()
}

struct Dog : Animal, Vocal {
    var full: Bool = false
    mutating func eat(food: String) {
        print("dog tears at \(food)")
        full = true
    }
    func makeNoise() {
        print("Woof")
    }
}
struct Lion : Animal, Vocal {
    var full: Bool = false
    mutating func eat(food: String) {
        print("lion eviscerates \(food)")
        full = true
    }
    func makeNoise() {
        print("Roar")
    }
}
// Condors, the silent killer (?? sure)
struct Condor: Animal, Flying {
    var full: Bool = false
    mutating func eat(food: String) {
        print("condor swoops down on \(food)")
        full = true
    }
    func fly() {
        print("condor flies away majestically");
    }
}
struct Parakeet: Animal, Flying, Vocal {
    var full: Bool = false
    mutating func eat(food: String) {
        print("parkeet pecks at \(food)")
        full = true
    }
    func fly() {
        print("parakeet flies away awkwardly");
    }
    func makeNoise() {
        print("BAWK BAWK BAWK")
    }
}
//: Notice how we can treat the Animal protocol as a type of its own
var zoo: [Animal] = [
    Dog(full: false),
    Lion(full: false),
    Condor(full: false),
    Parakeet(full: false)
]
//: Interacting with the animals
// Hungry animals should make some noise
for animal in zoo where animal is Vocal && animal.full == false {
    (animal as! Vocal).makeNoise()
}
// Shit we forgot to feed the animals
for var animal in zoo where animal.full == false {
    animal.eat("Food")
}
// Oh no there's a hole in the top of the zoo!  The flying animals can escape!
let holeyZoo: [Animal] = zoo.flatMap {
    if let flying = $0 as? Flying {
        flying.fly()
        return nil //a nil value excludes this object from the new array
    } else {
        return $0 //this value is included in the new array
    }
}
/*:
The takeaway from all of this (very contrived) silliness is that protocols allow us to clump different types together and treat them as similar based on their functionality, not their identity.  If you need to make 1000 birds of different types fly, you should just be able to tell them to fly().  Each bird type can implement it's own unique way of actually flying, but since they all know how to fly(), we can treat them as a single type.

# Protocol Extensions
### Providing default behavior to a protocol
TODO
----

*/


//: [Next](@next)

