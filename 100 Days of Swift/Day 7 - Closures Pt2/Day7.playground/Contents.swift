// MARK: 100 days of Swift - Day 7 - Closures Part 2

// MARK: Using closures as parameters when they accept parameters
// A closure can also accepts its own parameters and return other types than Void
// We’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can go ahead and fill the () with the types of any parameters that your closure should accept.

// Example: function that takes an input a string and a closure
func fix(item: String, payBill: (Int) -> Void) {
    print("I've fixed your \(item)")
    payBill(450)
}
// Call the function with the first input and then use a trailing closure for the second input
fix(item: "roof") { (bill: Int) in
    print("You want $\(bill) for that? Outrageous!")
}

// MARK: Using closures as parameters when they accept parameters AND RETURN VALUES

// As for accepting parameters, closures can also return value
// We’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can replace that Void with any type of data to force the closure to return a value.

// Example: create a function travel() that accepts only a closure as parameter that as an input parameter of type string and that return a string
func travel( action: (String) -> String ) {
    print("I'm getting ready to go.")
    // this variable is of string type and depends on the action closure
    let description = action("London")
    print(description)
    print("I arrived!")

}

// Use the travel function, the action closure is the one that takes as input a string destination and return a string with the destination input
travel(action: { (destination: String) -> String in
    return "I am driving to \(destination)"
    
})

// Another example: a function that takes as input an array of numbers and, for each number of this array, apply a function "algorithm" that takes as input one Int and return another Int
func manipulate(numbers: [Int], using algorithm: (Int) -> Int) -> [Int] {
    // result array: empty array of Int
    var resultArray : [Int] = [Int]()
    // for each number in numbers, compute the function "algorithm" and append the manipulated number in the result array
    for number in numbers {
        let result = algorithm(number)
        print("Manipulating \(number) produced \(result)")
        resultArray.append(result)
    }
    
    return resultArray
}

// In this case, the algorithm is a function that compute the square of a number. As a consequence, this function "manipulate" compute for each number in input numbers array the square of the number and save it in the squareNumbers variable
var squareNumbers = manipulate(numbers: [1, 2, 3]) { (number) -> Int in
    return number * number
}

// MARK: Closures short hand
// Once you declared the closure input and output parameters, when you call the function, Swift let you:
// - get rid of the input parameter type
// - get rid of the return type "-> (String)"
// - if the return is immediately made of one line, you can get rid also of the return keyword
// - you can also get rid of the parameters names, Swift will name them automatically; in order to do so, you have to use "$" followed by a number starting from 0, which represents "the first parameter, the second parameter, etcc"

// Example: get rid of the input parameter type
travel(action: { destination -> String in
    return "Going to \(destination)"
})

//  Example: get rid of the return type
travel(action: { destination in
    return "Going to \(destination)"
    
})

// Example: if the return is immediately made of one line, you can get rid also of the return keyword
travel(action: { destination in
    "Going to \(destination)"
})

// Example: you can also get rid of the parameters names, Swift will name them automatically; in order to do so, you have to use "$" followed by a number starting from 0, which represents "the first parameter, the second parameter, etcc"
travel(action: {
    "Going to \($0)"
})
// or also, even shorter
travel {"Going to \($0)"}

// MARK: Closures with multiple parameters
// Closures can also take multiple parameters as input

// Example: This time our travel() function will require a closure that specifies where someone is traveling to, and the speed they are going. This means we need to use (String, Int) -> String for the parameter of the input closure

func travelWithSpeed(destination : String, speed: Int, _ createStringWithDestinationAndSpeed: (String, Int) -> String) -> String {
    
    let destinationString = createStringWithDestinationAndSpeed(destination, speed)
    
    return destinationString
    
}

// Use the travelWithSpeed function: the closure will take the input of the function and create a string with the destination and the speed
let destinatioString = travelWithSpeed(destination: "London", speed: 90) {
    (destination, speed) in
    return "We are going to \(destination) with speed \(speed)"
}

// MARK: Returning closures
// As you can take a closure as input in a function, you can also return closures from a function

// The syntax for this is a bit confusing a first, because it uses -> twice: once to specify your function’s return value, and a second time to specify your closure’s return value.

// Example: we’re going to write a travelWithClosure() function that accepts no parameters, but returns a closure. The closure that gets returned must be called with a string, and will return nothing.

func createTravelWithClosure() -> (String) -> Void {
    return {
        (destination : String) in
        print("We are going to \(destination)")
    }
}
// Now returnedClosure is a closure that accepts a string input parameter and that return void and print a sentence with the input parameter
let returnedClosure = createTravelWithClosure()
returnedClosure("London with this new travelWithClosure function")

// Another example
func createTravelMethod(distance: Int) -> (String) -> Void {
    if distance < 5 {
        return {
            print("I'm walking to \($0).")
        }
    } else if distance < 20 {
        return {
            print("I'm cycling to \($0).")
        }
    } else {
        return {
            print("I'm driving to \($0).")
        }
    }
}
// call the function: a closure will returned
let travelMethod = createTravelMethod(distance: 15)
// Use the closure as a normal function
travelMethod("London")


// MARK: Capturing values inside functions
// Closure capturing happens if we create values in travel() that get used inside the closure. For example, we might want to track how often the returned closure is called:
func travelWithCapture() -> (String) -> Int {
    // initialize a counter
    var counter = 0
    
    return {
        print("Going to \($0)")
        // + 1 to the counter
        counter += 1
        return counter
    }
}

// Now everytime we call the closure returned by the travelWithCapture function, the counter variable inside the function will increase
// Example: here closureThatCounts is a closure created by the travelWithCapture function that accepts a string as input and everytime returns the value of the counter
let closureThatCounts = travelWithCapture()
// now counter1 represents the first time that the counter is increased and is equal to 1
var counter1 = closureThatCounts("London")
// now the counter is increased another time and is equal to 2, and so on...
var counter2 = closureThatCounts("London")

// Another example: this function create a closure that accepts an int value and add it to the sum variable + print the sum variable value
func makeAdder() -> (Int) -> Void {
    var sum = 0
    return {
        sum += $0
        print("Sum is now \(sum)")
    }
}
// So now adder is a closure that can be called with an input parameter
let adder = makeAdder()
adder(5)
adder(3)

// MARK: Closures summary
/*
 You’ve made it to the end of the sixth part of this series, so let’s summarize:

 -You can assign closures to variables, then call them later on;
 -Closures can accept parameters and return values, like regular functions;
 -You can pass closures into functions as parameters, and those closures can have parameters of their own and a return value;
 -If the last parameter to your function is a closure, you can use trailing closure syntax;
 -Swift automatically provides shorthand parameter names like $0 and $1;
 -If you use external values inside your closures, they will be captured so the closure can refer to them later;
 */
