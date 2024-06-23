// MARK: 100 Days of Swift - Day 9 - Structs Pt 2

/*
 Now we are going to explore some more deeper topics about structs, including access control, static properties and laziness -> laziness is very important for optimization purpouses
 */

// MARK: Initializers
// Initializers are special methods that provide different ways to create your struct

// All structs come with one by default, called their MEMBERWISE INITIALIZER –> this asks you to provide a value for each property when you create the struct.

// N.B. : INITIALIZERS HAVE TO PROVIDE A VALUE FOR ALL THE STRUCT PROPERTIES
// Example below: the third property is set based on the previous two value, it is not in the init() input parameters but it is set inside the method so it is valid
struct Character {
    
    // name
    var name : String
    // actor
    var actor : String
    // probability to die
    var probablyGoingToDie : Bool
    
    init(name: String, actor: String) {
        // set the name of the instance to input param name
        self.name = name
        // set the actor of the instance to input param actor
        self.actor = actor
        // if the actor name is Sean Bean, the character will probably die so set the probablyGoingToDie property to true, otherwise false
        if self.actor == "Sean Bean" {
            // set the probablyGoingToDie property of the instance to true
            self.probablyGoingToDie = true
        }
        else {
            // set the probablyGoingToDie property of the instance to false
            self.probablyGoingToDie = false
        }
    }
    
    
}

// Example: we create a user struct, which will have a default initializer where you have to specify all the properties, whereas we will create a new one that will set those properties with some values
struct Person {
    var name : String
    var age : Int
    var sex : String
    
    // The default initializer is something like this
    /*
    init(name: String, age: Int, sex: String) {
        self.name = name
        self.age = age
        self.sex = sex
    }
     */
    // we create also this if we want to specify property values
    init(name: String, age: Int, sex: String) {
        self.name = name
        self.age = age
        self.sex = sex
    }
    
    // we create an init() method that by default set the person name to Tim, sex to male and age to 8 years old
    init() {
        self.name = "Tim"
        self.age = 8
        self.sex = "Male"
    }
}

// now we create a person using that struct and the custom initializer
var person1 = Person()
print(person1.name) // verufy is set to Tim

var person2 = Person(name: "Cristina", age: 30, sex: "Female")
print(person2.name) // this will be set to Cristina


// MARK: Referring to the current instance

/*
 Inside methods there is a special constant called "self"
 This let you points to whatever INSTANCE of the struct is currently used
 
 Useful also inside initializers to distinguish between the property of the instance object (self.parameterName) and the parameter value (parameterName present in the input function parameters)
 */

// MARK: LAZY PROPERTIES

// Important for performance optimization: if you declare a property as "lazy" with the "lazy" keyword, that property will be created only when accessed at least once from an instance object

// N.B. Lazy properties MUST have an initializer!!

// Example: we create a struct FamilyTree and a struct Person, which may or not may have a FamilyTree -> if we declare that property as "lazy", the property will be created only if we try to access it from an instance of the class Person

struct FamilyTree {
    // number of leafs
    var numberOfLeafs : Int
    // color of the tree
    var treeColor : String
    
    // if we do not pass any param, set the prop to default values
    init() {
        self.numberOfLeafs = 100
        self.treeColor = "Green"
    }
    
    // if we pass some params, set the correspondent prop to that values
    init(numberOfLeafs: Int, treeColor: String) {
        self.numberOfLeafs = numberOfLeafs
        self.treeColor = treeColor
    }
}

struct PersonWithTree {
    // person name
    var name: String
    // familyTree: we use the default initializer
    lazy var familyTree : FamilyTree = FamilyTree()
    
    // initializer without passing any FamilyTree
    init(name : String) {
        self.name = name
    }
    
    // initializer passing the FamilyTree
    init(name: String, familyTree : FamilyTree) {
        self.name = name
        self.familyTree = familyTree
    }
    
}

// we create a person -> in the beginning, the familyTree lazy prop is not created
var cristina = PersonWithTree(name: "Cristina")
// now, if we access to the familyTree prop, that prop will be created
print(cristina.familyTree)

// MARK: Static Properties and Methods

/*
 Each property we created so far, belonged to the different single instances of the struct -> i.e. -> we've declared and defined our structures, but then each struct instance had its own property and property values
 
    HOWEVER
 
 We can declare that some properties/methods belongs to the struct itself, regardless the different struct instances
 
 To do so, you have to define the property as "static" -> in this way, that property is shared among all the instances of the struct because it belongs to the struct itself
 
 To access it, you have to use the struct name + "." + property name -> YOU CANNOT ACCESS IT FROM STRUCT INSTANCES, IT IS A PROPERTY OF THE CLASS ITSELF
 */

// Example: we crrate a struct student which will take count of the class size as a static property: each time a new instance of student is created, we add +1 to the class size static property

struct Student {
    // student name
    var name : String
    // class size
    static var classSize : Int = 0
    
    // Initializer: input param is the student name, each time a new instance of this struct is created, we add +1 to the class size parameter
    init(name : String) {
        // set the instance name
        self.name = name
        // add 1 to the static property
        Student.classSize += 1
    }
}

// create a new instance of the class
var tim = Student(name: "Tim")
print("The class now have \(Student.classSize) students")
var sebastian = Student(name: "Sebastian")
print("The class now have \(Student.classSize) students")


// MARK: Access Control

/*
 You might want to control which type of code can access some properties or not
 
 You can make a property not directly accessible from outside by declaring it as "private" – trying to write "struct.propertyname" simply won’t work -> you need to create a GETTER method to get that value
 
 N.B. if you declare a property as "private" inside a struct, you HAVE TO PROVIDE A INIT METHOD -> Swift is not able to define the standard default init method
 */

struct PersonWithID {
    // declare this property as private so from the outside you have to use the getID method to read it
    private var id : String
    
    // init method to set the ID value
    init(id: String) {
        self.id = id
    }
    
    // method that retrieve the id of the struct instance
    func getID() -> String {
        return self.id
    }
    
}

// Example
var matteo = PersonWithID(id: "MTT")
// matteo.id won't work, you have to use the method to access the property
var matteoID = matteo.getID()

/* STRUCT PT2 SUMMARY
 -You can create your own types using structures, which can have their own properties and methods.
 -You can use stored properties or use computed properties to calculate values on the fly.
 -If you want to change a property inside a method, you must mark it as mutating.
 -Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
 -Use the self constant to refer to the current instance of a struct inside a method.
 -The lazy keyword tells Swift to create properties only when they are first used.
 -You can share properties and methods across all instances of a struct using the static keyword.
 -Access control lets you restrict what code can use properties and methods.
 
 */
