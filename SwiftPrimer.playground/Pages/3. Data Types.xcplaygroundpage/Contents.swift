//: [Previous](@previous)

/*:
# Data Types
Swift has a lot of data types
+ Class
+ Struct
+ Enum
+ Protocol
+ Tuple
+ Function
*/

typealias Food = String

protocol Pet {
    var owner: String {get set}
    var name: String {get set}
}

protocol Animal {
    func eat(food: Food)
}


class Dog : Pet, Animal {
    var owner: String
    var name: String
    func eat(food: Food) {
        //nom nom nom
    }
    
    init(owner: String, name: String ) {
        self.owner = owner
        self.name = name
    }
}

//: [Next](@next)
