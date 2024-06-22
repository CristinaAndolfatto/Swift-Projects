// MARK: 100 Days of Swift - Day 8 - Structs Pt 1

/*
 Structs let us create our own data types out of several small types 
 => It is like combining basic types in order to create some complex structures that represents something you need for your app
 => For example, you might put three strings and a boolean together and say that represents a user in your app:
- a string for the name
- a string for the email address
- a string for the password
- a boolean indicating if the user is logged in or not
 */

// MARK: Creating Structs
// We’re going to create a Sport struct that stores its name as a string 
// => Variables inside structs are called properties, so this is a struct with one property
// N.B. you can also assign default values for properties

struct Sport {
    // Property storing the sport name
    var name : String
}

// now we can create an instance of the Sport struct and use it:
var volleyBall = Sport(name: "Volleyball")
print(volleyBall.name)

// We made both name and volleyball variable, so we can change them just like regular variables:
volleyBall.name = "Pallavolo"
print(volleyBall.name)

// MARK: Computed Properties
// You can also declare properties that are computed, for example from other struct properties

// Properties that are declared as they are are called STORES vs the one that are based on the running of some code are called COMPUTED

// Example:
struct Sport2 {
    // these are stored properties
    var name: String
    var isOlympicSport: Bool
    // this is a computed property -> MUST HAVE THE TYPE DECLARED! + must be a VAR
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

// We can try it out by creating a new instance of Sport:

let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)


// MARK: Property Observers

// We can tell Swift what to do BEFORE or AFTER a computed variable is set using the "didSet" or "willSet" keywords
// Example: we want to create a struct that represents the progress of an operation. The struct properties are: the name of the process, and the progress percentage as Int
// Now we want that each time there is a chasnge in the progress status, the object will tell the system to print the progress
struct Progress {
    // name of the process
    var name : String
    // progress of the process
    var amount : Int {
        // what to do each time amount is changed
        didSet {
            print("\(amount) reached! :)")
        }
        // what to do before change amount
        willSet {
            print("progressing..")
        }
    }
}

var progress1 = Progress(name: "Installation", amount: 0)
// this will activate willSet and then didSet
progress1.amount = 1
progress1.amount = 2

// another example
struct BankAccount {
    var name: String
    var isMillionnaire = false
    var balance: Int {
        // everytime the balance change, check if the bank account become millionare
        didSet {
            if balance > 1_000_000 {
                isMillionnaire = true
            } else {
                isMillionnaire = false
            }
        }
    }
}


// MARK: Methods
/* Structs can have functions inside them, and those functions can use the properties of the struct as they need to. Functions inside structs are called methods, but they still use the same func keyword.
 */

// Example: a city struct with an Int representing the population and a method that lead the city to collect taxes
struct City {
    var name : String
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
// now we can create a city with a name and a certain population
let london = City(name: "London", population: 9_000_000)
// we can collect taxes and save the result into an Int var
var taxes = london.collectTaxes()
print("\(london.name) has collected \(taxes) taxes")

// MARK: Mutating Methods
/*
 If a struct has a variable property but the instance of the struct was created as a constant, that property can’t be changed – the struct is constant, so all its properties are also constant regardless of how they were created.
 
 Swift does not know if you are going to create a constant or a variable with your constant, so if you want to modify the property of a struct with a method, you have to declare it as MUTATING
 */

// Example: a struct that represents a person and a method that change the person name and make it anonymous
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
    
    mutating func changeName(with newName : String) {
        name = newName
    }
}

// let's use the Person struct
var tim = Person(name: "Tim")
tim.makeAnonymous()
print(tim.name) // here "anonymous will be printed"
// try to change the name
tim.changeName(with: "Cristina") // here Cristina will be the new name of Tim
print(tim.name)

// MARK: Property and Methods of Strings
// Strings are structs, so they have their own methods
// Example
let string = "Do or do not, there is no try."
// Count the number of chars, it is a property of the string
var stringLength = string.count
// hasPrefix() method: returns true if the string starts with specific letters
var isStartingWithA = string.hasPrefix("A")
// You can uppercase a string by calling its uppercased() method:
var STRING = string.uppercased()
// Sort the letters of the string into an array of chars
var sorted = string.sorted()

// MARK: Properties and Methods of Arrays
// Like strings, also arrays are structs with some properties and methods
// Example:
var toys = ["Woody"]

// Number of elements inside an array
var num = toys.count

// Add a new item using append()
toys.append("Ball")

// Locate items inside an array, using firstIndex() method
toys.firstIndex(of: "Woody")

// You can also sort arrays
var sortedToys = toys.sorted()

// Remove an item by its index in the array -> here we try to find the index of the first element equal to Woody, and if there is we remove it, otherwise we remove the element at index 1
toys.remove(at: toys.firstIndex(of: "Woody") ?? 1)




