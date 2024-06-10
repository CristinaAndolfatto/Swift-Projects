// MARK: 100 days of Swift - Day 5 - Functions and everything else

// MARK: Writing Functions
// Functions let us re-use code, which means we can write a function to do something interesting then run that function from lots of places, without repeating the same code all over and over

// Example: Write a function that prints help information for users of our app
// You can use the func keyword

func printGreetings() {
   let message = """
Hello folk!
This is my app.
Thank you  for using it :)
"""

    // print the message
    print(message)
}

// We can now run that using printGreetings() by itself:
printGreetings()
// Usually, you say that you CALL the function

// MARK: Accpeting parameters
// Functions become more powerful when they can be customized each time you run them. Swift lets you send values to a function that can then be used inside the function to change the way it behaves

// Example: modify the printGreetings functio to accept the string as a param
// You can insert inside the parenthesis the name of the param to use inside the function body and the type as below
func printGreetings(message : String) {
    print(message)
}

// Example of function call
printGreetings(message: "Welcome to my App without anything else")


// MARK: Returning values
// As well as receiving data, functions can also send back data. To do this, write a dash then a right angle bracket after your function’s parameter list, then tell Swift what kind of data will be returned.
// Inside the function, you have to use the return keyword

// Example: write a square() function to return the square of the parameter value
func square(number : Int) -> Int {
    return number * number
}
// Call the function ans assign the returned value to a constant variable
let fourSquare = square(number: 4)

// MARK: Parameter labels
// Swift let us to give to parameters two names: one for the parameter to be used outside the function and one inside the function
// So, you can create two names for each parameter, one to be used externally when calling the function, and one to be used internally inside the function. This is as simple as writing two names, separated by a space

// Example below with to for the outer name and name for the inner name
func greetings(to name : String) {
    print("Hello \(name)")
}

// when you call the function, you can use the "to" parameter
greetings(to: "Tim")

// MARK: Omitting parameter names
// You may have noticed that for some functions, for example print(), we do not call any parameter name, we simply pass the value
// You can reach this behavious omitting the outer parameter name, using the "_" like below:
func sayHelloTo(_ name : String) {
    print("Hi \(name)")
}
// now you can use the method without using the outer parameter name
sayHelloTo("Tim")

// MARK: Default parameters values
// You can give your own parameters a default value just by writing an = after its type followed by the default you want to give it. So, we could write a greet() function that by default print a greeting, otherwise you assign to the parameter another value

func greet(_ name : String = "Tim") {
    print("Hi \(name)")
}

// This greets Tim as Tim is the default value for the parameter name
greet()

// This instead greets Cristina
greet("Cristina")

// MARK: Variadic functions
// If a function is defined as variadic, it means that it can accept a potentially infinite number of parameters of that type
// You can make any parameter variadic by writing ... after its type. So, an Int parameter is a single integer, whereas Int... is zero or more integers – potentially hundreds.

// Inside the function, Swift converts the values that were passed in to an array of integers, so you can loop over them as needed.

// Example: create a function that greet whatever number of people
func greets(_ people : String...) {
    for person in people {
        print("Hi \(person)")
    }
}
// Say hi to all the people inserted
greets("Cristina", "Tim", "Sebastian")

// MARK: Throwing functions
// Sometimes functions can throw errors, based on wrong input or internal errors
// You can add the word "throws" before the function returning type to label that the function can throw errors
// Internally, you can use the keyword "throw" when something goes wrong

// First of all, however, you have to define an enum that represents your errors that have ALWAYS be an extension of built-in Swift's protocol Error -> you have always to adehere to the Error protocol
// In this way, you define that your custom error is a type representing an error value that can be thrown.

// Example: this custom error represents some errors that a function that tries to set your password can throw
enum passwordError : Error {
    // if the psw is too simple
    case obvious
    // if the psw is already used
    case alreadyUsed
    // number of chars < 15
    case invalidLength
}

// Example: function that try to set a psw you indicate in the input param
// This function returns a bool equal to true if the password is valid, false otherwise
func setPassword(to psw : String) throws -> Bool {
    // if the password is too simple
    if psw == "password" {
        throw passwordError.obvious
    }
    
    // check if the password contains at least 15 chars
    if psw.count <= 15 {
        throw passwordError.invalidLength
    }
    // we fake that the function returns true always
    return true
}

// MARK: Calling Throwing functions

// Swift WON'T LET YOU CALL A THROWING FUNCTION LIKE A NORMAL FUNCTION
// You have to use the "do - try - catch" pattern to correctly handle and manage exceptions

// The pattern is like the following:

// do {
//       try CALL THE FUNCTION
//     }
// catch ERROR TYPE {
//      DEFINE WHAT TO DO WHEN THE ERROR TYPE IS CATCHED
// }

// Example with the password function

// default value for the setted psw
var myPsw = ""
// osw inserted by the user (can come for example from a textfield)
var insertedPsw = "Ciao"
// bool indicating if the psw was correctly setted
var pswSetted = false

do {
    // try to set the psw
    if (try setPassword(to: insertedPsw)) {
        // if everything is correct, set the psw with the one inserted by the user
        myPsw = insertedPsw
        // update the fact we have setted the psw correctly
        pswSetted = true
    }
    
} catch passwordError.invalidLength {
    print("You need more chars")
} catch passwordError.alreadyUsed {
    print("You already used this psw")
} catch passwordError.obvious {
    print("The password is too obious. Come on")
}


// MARK: In-Out Parameters

// All parameters in functions in Swift are CONSTANTS
// YOU CANNOT CHANGE A FUNCTION PARAMETER VALUE

// If you want to change the value of an input parameter, you have to declare it as inout + when you call the function you have to put the "&" before the param

// Example: a function that compute the double in place
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 2
// Call the function, declared you want to use myNum as the inout parameter
doubleInPlace(number: &myNum)

