// MARK: 100 Days of Swift - Day 10 - Classes and Inheritance

/*
 Classes are similar to structs, but they introduce an important feature called INHERITANCE -> ability to build a class from the foundation of another one
 
 There are however 5 main differences with structs:
 1 - classes does not have their own default memberwise initializer like structs -> it means that you MUST ALWAYS define your own initializer!
 2 - INHERITANCE: you can create a class based on another class -> you will be able to inherit all the properties and methods of the super class + you can also build other things upon it!
 3 - OBJECT COPYING: 
    CLASS: REFERENCE-typed objects -> when you copy an object from another, you create like a SHARED EXCELL FILE
-> if you modify the copy, you affect also the original object
                VS
    STRUCTS: INSTANCE-typed objects -> when you copy a struct from another, they behave like DIFFERENT EXCELL FILES -> you can get the structure/layout from the shared file, but the copy you are working on IS YOUR OWN one -> so if you make some modifications, these ones will NOT affect the original object
 
 4 - classes can have DEINITIALIZERS! -> this code gets run when an instance of a class is destroyed
 
 5 - DEALING WITH CONSTANTS:
  If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant.

 However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs. -> if you want that some variables inside a class are not changed, you have to declared them as LET
 
 */

// MARK: Creating Classes

/*
 The structure is the same of a struct, but the keyword is "class"
 */

// Example: a dog class
class Dog {
    // dog name
    var name : String
    // dog breed
    var breed : String
    
    // As a class, you have to define the initializer
    init(name : String, breed : String) {
        self.name = name
        self.breed = breed
    }
    
}

// create a new dog
var tim = Dog(name: "Tim", breed: "Cocker Spaniel")


// MARK: Class Inheritance

/*
 As anticipated, classes have a special feature called "inheritance" or "subclassing" -> i.e. you can build classes upon other classes and inherit properties and methods from the superclass
 
 The class you inherit is called SUPER or PARENT CLASS, the class that is inheriting is called CHILD CLASS

 */

// Example: we want to create a new class called Cocker, child of the superclass Dog, and we can also declare its own initzializer, since we know that the breed will always be "Cocker"

class Cocker:Dog {
    // we want to make our own initializer: we have to create a new initializer method
    init(name: String) {
        // we use the superclass init, but with the breed always set to "Cocker"
        super.init(name: name, breed: "Cocker")
    }
}

// create a new cocker
var bread = Cocker(name: "Bread")


// MARK: Overriding

/*
 As anticipated, child classes can modify and change methods they inherit from super classes using the "overriding" keyword
 
 Child classes can replace parent methods with their own implementations – a process known as overriding.
 
 */

// Example
class Dog2 {
    func makeNoise() {
        print("Woof!")
    }
}

class Cocker2:Dog2 {
    // since cocker bark a lot more, we override the method
    override func makeNoise() {
        print("Woof woof woof!")
    }
}

// Create a dog2 instance
var dog = Dog2()
dog.makeNoise() // this will print "Woof!"

var tim2 = Cocker2()
tim2.makeNoise() // this will print Woof woof woof!"


// MARK: Final Classes
/*
 Sometimes you want to disable others from building their own classes based on yours -> basically you use classes but you disable inheritance from them!
 
 In order to do so, you have to declare the class as "final"
 */

// Example: declare a new final class Dog3
final class Dog3 {
    var name: String
    var breed : String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// MARK: Copying Objects
/*
 Unlike structs, if you copy an object that is an instance of a class, if you make some changes in the copied one -> these changes will affect also the original object!!
 
 When you copy a class, both the original and the copy point to the SAME thing, so changing one does change the other
 
                        VS
 In structs, if you copy an object from another, the copy and the original will behave like different objects!! (if you change something in one, this changes will not be bringed also on the other one)
 */

// Example
class Singer {
    // name of the singer
    var name : String
    
    // initialize Singer
    init(name: String) {
        self.name = name
    }
}

struct Actor {
    // actor name
    var name : String
    
    // initializer
    init(name: String) {
        self.name = name
    }
}

// create a new singer
var ariana = Singer(name: "Ariana Grande")
// create a new singer that is a copy of ariana
var avril = ariana
avril.name = "Avril Lavigne"
print("This is ariana name: \(ariana.name)")
print("This is avril name: \(avril.name)")
// you will see that BOTH will have the name = Avril

// VS with structs

// create a new actor
var julia = Actor(name: "Julia Roberts")
var ilary = julia
ilary.name = "Ilary Blasi"
print("This is julia name: \(julia.name)")
print("This is ilary name: \(ilary.name)")
// you will see that the structs will have DIFFERENT names


// MARK: Deinitializers

/*
 Another difference between structs and classes is that class can have DEINITIALIZERS -> code to be run when a instance of an object is destroyed
 */

class Person {
    // person name
    var name : String
    
    init(name: String) {
        self.name = name
    }
    
    init() {
        print("A new person is born")
        self.name = "Unknown"
    }
    
    func printGreeting() {
            print("Hello, I'm \(name)")
        }
    
    // what to do when the instance of this class is destroyed
    deinit {
        print("\(self.name) is dead")
    }
}

// example: We’re going to create a few instances of the Person class inside a loop, because each time the loop goes around a new person will be created then destroyed:

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}


// MARK: Mutability
/*
 The final difference between classes and structs is the way they deal with constants. If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant.

 However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs.

 This difference means you can change any variable property on a class even when the class is created as a constan
 */

// MARK: Classes summary

/*
 
 - Classes and structs are similar, in that they can both let you create your own types with properties and methods.
 - One class can inherit from another, and it gains all the properties and methods of the parent class. It’s common to talk about class hierarchies – one class based on another, which itself is based on another.
 - You can mark a class with the final keyword, which stops other classes from inheriting from it.
 - Method overriding lets a child class replace a method in its parent class with a new implementation.
 - When two variables point at the same class instance, they both point at the same piece of memory – changing one changes the other.
 - Classes can have a deinitializer, which is code that gets run when an instance of the class is destroyed.
 - Classes don’t enforce constants as strongly as structs – if a property is declared as a variable, it can be changed regardless of how the class instance was created.
 */
