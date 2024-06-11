// MARK: 100 days of Swift - Day 6 - Closures Part 1

// MARK: Creating closures
// Swift lets us use functions just like any other type such as strings and integers. This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters.

// Functions used in this way are called closures, and although they work like functions they are written a little differently.
// Just declare them as a variable and enclose the body inside {}
let driving = {
    print("I'm driving in my car")
}

// That effectively creates a function without a name, and assigns that function to driving. You can now call driving() as if it were a regular function, like this:

driving()

// MARK: Accepting parameters in a closure
// When you create closures, they don’t have a name or space to write any parameters. That doesn’t mean they can’t accept parameters, just that they do so in a different way: they are listed inside the open braces.

// To make a closure accept parameters, list them inside parentheses just after the opening brace, then write in so that Swift knows the main body of the closure is starting
let driving1 = { (place: String) in
    print("I'm going to \(place) in my car")
}

driving1("London")

// MARK: Returning values from closures
// Closures can also return values, and they are written similarly to parameters: you write them inside your closure, directly before the "in" keyword
// We want a closure that returns a string rather than printing the message directly, so we need to use -> String before in, then use return just like a normal function:

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

//We can now run that closure and print its return value:

let message = drivingWithReturn("London")
print(message)

// MARK: Closures as parameters

// Because closures can be used just like strings and integers, you can pass them into functions. The syntax for this can hurt your brain at first, so we’re going to take it slow.

// First, here’s our basic driving() closure again

let driving = {
    print("I'm driving in my car")
}

// If we wanted to pass that closure into a function so it can be run inside that function, we would specify the parameter type as () -> Void. That means “accepts no parameters, and returns Void” – Swift’s way of saying “nothing”.

// So, we can write a travel() function that accepts different kinds of traveling actions, and prints a message before and after:

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

// We can now call that using our driving closure, like this:

travel(action: driving)

// MARK: Trailing closures
//  IF the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.

// To demonstrate this, here’s our travel() function again. It accepts an action closure so that it can be run between two print() calls:

func travel1(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

// Because its last parameter is a closure, we can call travel() using trailing closure syntax like this:

travel1() {
    print("I'm driving in my car")
}

//In fact, because there aren’t any other parameters, we can eliminate the parentheses entirely:

travel1 {
    print("I'm driving in my car")
}

