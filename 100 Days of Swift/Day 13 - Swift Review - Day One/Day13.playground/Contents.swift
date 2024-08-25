// MARK: 100 Days of Swift - Day 13 - Swift Review, Day One

// MARK: Variables and Constants

/*
 Every program at a certain point have to store data in some way -> in Swift you can do it in two ways: with VARIABLES (keyword "var") and CONSTANTS (keyword "let")
 
 The differences between variables and constants, is contained in the names: variables store values that can change VS  constants values that cannot be change, and if you try to do it, Swift won't let you!
 
 -> so, which is the advantage? -> OPTIMIZATION: if you know that a value will never change, and you use a  constant variable, Swift will adopt some optimizations
 */

// MARK: Types of data

/*
 Swift is a typed language, meaning that every object in Swift MUST be of some type ->
 If you want to explicity declare the type of a variable, you can use TYPE ANNOTATION -> specify the type after the name with ":" and the type
 Example: let name: String = "Tim"
 
 -> most common data types:
    - Strings: array of chars
    - Integer: represents integer numbers
    - Float and Double: represents numbers with fractional component (two data types because it depends on the accuracy you want, but Apple recomendations is to always use Double!)
    - Boolean: can store wheter a value is true or false
 
 -> Type annotation adds complexity to the code, so it is always preferable to use type inference (which Swift has built in, and every time you declare a variable/constant without using type annotation, Swift try to infer the data type)
 */


// MARK: Operators

/*
 Basic operators for performing addition, substraction, mutiplication and division
 +
 some other operations
 */

var a = 10
a = a + 1
a = a - 1
a = a * 2
a = a / 2

/* there are also other forms to express the basic operators */

var b = 10
b += 1 // this adds 1: "+=" is an operator that means "add then assign to"
b -= 2 // this adds

/*  One more common operator you’ll see is called MODULUS, and is written using a percent symbol: % -> “divide the left hand number evenly by the right, and return the remainder.”
 -> 9 % 3 returns 0 because 3 divides evenly into 9, whereas 10 % 3 returns 1, because 10 divides by 3 three times, with remainder 1.
 */

/* N.B. "+" operator in case of strings will join them toghether */
var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2


// MARK: Comparison Operators

/* Swift has a set of operators that perform comparisons on values: >, <, >=, <=, ==, != */


// MARK: String Interpolation

/* String interpolation is smart to be able to handle different types of data */
var name = "Tim"
var age = 5
var latitude = 36.1667

print("Your name is \(name), your age is \(age), and your latitude is \(latitude)")

/*
 you cannot do this with the "+", because Swift won't allow you to interpolate a string with a number with that operator
 */

/* Moreover, you can literally include an entire expression between the () */
print("The double of your age is \(age * 2)")

// MARK: Arrays

/* Array are data structure that allows you to group items into a collection of data accessible by their index
 The first index of an array is 0
 */

var songs = ["Shake it Off", "You Belong with Me", "Back to December"]
songs[0]
songs[1]
songs[2]
type(of: songs) // this instruction give the result Array<String>.Type -> indicates that Swift inferred that the array of songs, because is made of strings, is of type Array<Strings> -> YOU CANNOT ADD A NUMBER OR ANOTHER TYPE TO THIS ARRAY!! BECAUSE IT IS OF TYPE STRING! -> FORM OF TYPE SAFETY!

/*
 But let's say you need to store different types of objects -> you can declare your array of type <Any>!
 */

var songsMix: [Any] = ["Belong to me", 22]

/*
 Creating an empty array of a certain type
 */
var songsNew = [String]()
songsNew.append("Belong to me")

/* N.B. if you do simply
 var songsNew : [String] -> this will only say that the variable songsNew will contain an array of strings but does not initialize or create any array -> so no RAM or memory allocated here
 */

/* Array operators: merge two arrays */
var song1 = ["Belong to me"]
var song2 = ["22"]
var album = song1 + song2

/* Array operators: add and assign */
album += ["Shake it off"]

// MARK: Dictionaries

/* Another type of data structure, here the items are collections of key-value pairs */
var album2 = [Int:String]() // empty dictionary with int keys and string values
var person = [
                "first": "Taylor",
                "middle": "Alison",
                "last": "Swift",
                "month": "December",
                "website": "taylorswift.com"
            ]

person["middle"]
person["month"]
// add another element with a certain key and a certain value
person["location"] = "USA"

// MARK: Conditional statements

/* To execute some code only with a certain condition */

/* if-else statement */
var action: String
var person1 = "hater"

if person1 == "hater" {
    action = "hate"
} else if person1 == "player" {
    action = "play"
} else {
    action = "cruise"
}

// you can also evaluate multiple conditions
var stayOutTooLate = true
var nothingInBrain = true

if stayOutTooLate && nothingInBrain {
    action = "cruise"
}

// MARK: Loops

/*
 to execute some code ripetively
 */

for i in 1...10 {
    print("You are at iteration \(i)")
}

// If you don't need to know what number you're on, you can use an underscore instead "_"

/* Looping over arrays */
var songs2 = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]
for song in songs {
    print("This is a song of TS album: \(song)")
}

/* While loops: to execute something until a condition is valid */
var counter = 0
while true {
    print("Counter is now \(counter)")
    counter += 1

    if counter == 556 {
        break // exit from the loop -> function with if-else and while!!
    }
}

/* n.b. : There is a counterpart to break called continue. Whereas breaking out of a loop STOPS execution immediately and continues directly AFTER the loop, continuing a loop only exits the CURRENT iteration of the loop -> so after it you will start a new one! */

// MARK: Switch-case

/*
 you tell Swift what variable you want to check, then provide a list of possible cases for that variable -> these have to be exauhistive! also with a default one -> you use the fallthrough keyword to make one case fall into the next one
 */

let liveAlbums = 2

switch liveAlbums {
case 0:
    print("You're just starting out")

case 1:
    print("You just released iTunes Live From SoHo")

case 2:
    print("You just released Speak Now World Tour")

default:
    print("Have you done something new?")
}
