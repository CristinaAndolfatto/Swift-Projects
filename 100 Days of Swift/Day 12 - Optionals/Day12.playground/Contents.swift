// MARK: 100 Days of Swift - Day 11 - Protocols and Extensions

/*
 The topic of this day are protocols and protocols-oriented-programming (POP)
 */

// MARK: Protocols

/*
 Protocols are a way of describing what properties and methods something MUST have -> like a certificate of capabilities that someone have to demonstrate
 
 You then tell Swift which types use a particular protocol – a process known as adopting or conforming to a protocol.
 */

// Example: we want to write a function that accepts something with an id property, but we don’t care precisely what type of data is used. so, the steps are: 1- create  a protocol that declare that who adopt it will have an id property. 2- create a class that adopts that protocol 3- create a method that accepts obejcts that conform to the "id" protocol

// Identifiable protocol: who adopts it, must have an id property
protocol Identifiable {
    // id: will have a getter and setter method
    var id : Int {get set}
}

// class account that conforms to the Identifiable protocol
class Account : Identifiable {
    // since the account declare as identifiable, you have to have a property id
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
}

// function that displays the ID of an Identifiable object
func displayID(of identifiable : Identifiable) {
    print("\(identifiable.id)")
}


// MARK: Protocol Inheritance

/*
 One protocol can inherit from another in a process known as protocol inheritance. Unlike with classes, you can inherit from multiple protocols at the same time before you add your own customizations on top.
 */

/*
 Example: We’re going to define three protocols:
1- Payable requires conforming types to implement a calculateWages() method
2- NeedsTraining requires conforming types to implement a study() method
3- HasVacation requires conforming types to implement a takeVacation() method
 */

// Payable
protocol Payable {
    func calculateWages()
}

// NeedsTraining
protocol NeedsTraining {
    func study()
}

// HasVacation
protocol HasVacation {
    func takeVacation()
}

// protocol Employee: if a class conforms to the Employee protocol, has to conform also to the previous protocols
protocol Employee : Payable, NeedsTraining, HasVacation { }


// MARK: Extensions

/*
 Extensions allows you to add methods to existing types to make them do things they weren’t originally designed to do
 */

// Example: We could add an extension to the Int type so that it has a squared() method that returns the current number multiplied by itself:
extension Int {
    func square() -> Int {
        return self*self
    }
}

let number = 8
// this will return the square of number
let numberSquared = number.square()

/*
 In extension, you cannot add properties but can use COMPUTED PROPERTIES
 */

extension Int {
    var isEven : Bool {
        // return true if the rest of the division with 2 is 0, false otherwise
        return self % 2 == 0
    }
    
}


// MARK: Protocol Extensions

/*
 Protocols let you describe what methods something should have but don’t provide the code inside. Extensions let you provide the code inside your methods, but only affect one data type – you can’t add the method to lots of types at the same time.
 
 Protocol extensions solve both those problems: they are like regular extensions, except rather than extending a specific type like Int you extend a whole protocol so that all conforming types get your changes.
 */

// Example: Swift’s arrays and sets both conform to a protocol called Collection, so we can write an extension to that protocol to add a summarize() method to print the collection neatly

// create an array and a set
var pythons = ["Eric", "Graham", "John", "Michael", "Terry"]
var beatles = Set(["John", "Paul", "George", "Ringo"])

// create a protocol extension
extension Collection {
    func summarize() {
        // print the number of elements in the collection
        print("There are \(count) of us:")
        // print each name of the collection
        for name in self {
            print(name)
        }
    }
}

// Both Array and Set will now have that method, so we can try it out:
pythons.summarize()
beatles.summarize()


// MARK: Protocol-Oriented-Programming

/*
 Protocol extensions can provide default implementations for our own protocol methods. This makes it easy for types to conform to a protocol, and allows a technique called “protocol-oriented programming” – crafting your code around protocols and protocol extensions.
 */

// Example: an Identifiable protocol -> Identifiable objects have to have an id property
protocol Identifiable2 {
    var id : String { get set }
    func identify()
}

// we can provide a default for the identify() method
extension Identifiable2 {
    func identify() {
            print("My ID is \(id).")
        }
}

// let's create a user class that conforms to the Identifiable2
class User : Identifiable2 {
    // the user have to had an id
    var id: String
    
    // initializer
    init(id: String) {
        self.id = id
    }
    
}

let twostraws = User(id: "twostraws")
twostraws.identify()

// MARK: Protocols and Extension Summary

/*
 - Protocols describe what methods and properties a conforming type must have, but don’t provide the implementations of those methods.
 - You can build protocols on top of other protocols, similar to classes.
 - Extensions let you add methods and computed properties to specific types such as Int.
 - Protocol extensions let you add methods and computed properties to protocols.
 - Protocol-oriented programming is the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide default method implementations.
 */
