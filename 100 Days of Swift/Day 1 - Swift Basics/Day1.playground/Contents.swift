// MARK: 100 Days of Swift

// MARK: VARIABLES
// Swift enable you to create variables, which are memory locations where you can store values
// Variables are non constant element, which means you can declare them and then modify their values

// Variable declaration
var str = "Hello, playground"

// Variables assignment: the value of the variable str now changes to a new one
str = "Hello, Cristina"


// MARK: STRINGS
// Swift is what’s known as a type-safe language, which means that every variable must be of one specific type.

// The str variable holds a string of letters that spell “Hello, playground”, so Swift assigns it the type String

var greeting = "Hello, playground"

// If you want to create a multiline string, you have two ways:
// WAY 1 - Use the following declaration: """
// insert multiline string here
// """
// Notice that the char """ has to be on a single line alone, so you have to start and end with a triple quotes symbol
var multiStr1 = """
This goes
over multiple
lines
"""
// WAY 2 - If don’t want line breaks to actually be in your string, end each line with a \ like:
var multiStr2 = """
This goes \
on multiple \
lines
"""

// STRING INTERPOLATION: if you want to include in your string the value of a variable, you can use string interpolation like below:
var age = 85
var str2 = "My grandma is \(age) years old"

// MARK: INTEGERS & DOUBLES
// Integers represent whole numbers.
// Doubles stands for "double precision floating point number" which indicates a fractional value

// This create an Int
var number1 = 2
// This creates a Double
var number2 = 2.36

// MARK: BOOLEANS
// Booleans simply store two type of values: true or false

var bool1 = true
var bool2 = false

// MARK: CONSTANTS
// Sometime you want to create a variable, assign to it a value and never change it. In this case, you can use the let keyword to declare a constant
let myName = "Cristina"

// If you try to change myName, Xcode will refuse to run your code. It’s a form of safety: when you use constants you can no longer change something by accident.

// MARK: TYPE ANNOTATIONS
// Swift assigns each variable and constant a type based on what value it’s given when it’s created.
// Once you have create a variable, and Swift has infer its type, you cannot change it to something else.
// This is called type inference: Swift is able to infer the type of something based on how you created it.

// If you want you can be explicit about the type of your data rather than relying on Swift’s type inference, like this:
let album: String = "Reputation"
let year: Int = 1995
let height: Double = 2.78
let isRock: Bool = true
