// MARK: 100 Days of Swift: Day 3
// Operators and Conditions

// MARK: Arithmetic Operators: Swift has a bunch of operators that led you perform some operations on numbers

var firstScore = 12
var secondScore = 3

// Sum
let sum = firstScore + secondScore
// Difference
let diff = firstScore - secondScore
// Multiplication
let mult = firstScore * secondScore
// Division
let divide = firstScore / secondScore
// Remainder of division
let remainder = firstScore % secondScore

// MARK: Operators Overload
// Swift supports operator overloading: what an operator does, depends on the values you use it with. For example, + sums integer but also:
// Interpolate strings
let string1 = "Ciao"
let string2 = "Tim"
let string3 = string1 + string2 // "Ciao Tim"
// Join arrays
let arr1 = ["Tim", "Seba", "Cri"]
let arr2 = ["John", "Jim", "Joe"]
let arr3 = arr1 + arr2 // ["Tim", "Seba", "Cri", "John", "Jim", "Joe"]

// MARK: Shorthands Operators
// Swift has shorthand operators that combine one operator with an assignment, so you can change a variable in place. These look like the existing operators you know – +, -, *, and /, but they have an = on the end because they assign the result back to whatever variable you were using.

// sum in place
var int1 = 5
int1 += 1 // now int1 = 6

// Similarly, you can add one string to another using +=:

var str4 = "Ciao"
str4 += "Tim" // now str4 = "Ciao Tim"

//MARK: Shorthands Operators
// Used to compare values

// this check if the values are equal
firstScore == secondScore
// this check if the values are different
firstScore != secondScore

// This check if the first is lower than the second
firstScore < secondScore
// this checks if the first is higher or equal
firstScore >= secondScore

// Each of these also work with strings, because strings have a natural alphabetical order
"Taylor" <= "Swift"

// MARK: Conditions
// You can use operators to check for conditions and execute some code based on that

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("You lost")
}

// you can also chain conditions with if-else if-else
if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

// MARK: Combining operators
// Swift has two special operators that let us combine conditions together:
// - && -> “and”
// - || -> “or”

// check that the age of two people are both over a certain value
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("you can drive")
} else {
        print("You cannot drive")
}

// The alternative to && is ||, which evaluates as true if either item passes the test

if age1 > 18 || age2 > 18 {
    print("Only one can drive")
} else {
    print("Both of you cannot drive")
}

// MARK: Ternary operator
// There is also another operator, the ternary operator: this works with three values at once, which is where its name comes from
// It checks a condition specified in the first value, and if it’s true returns the second value, but if it’s false returns the third value.

// So:
// - FIRST VALUE: condition
// - "?"
// - SECOND VALUE: output if condition is satisfied
// - ":"
// - THIRD: output if condition is NOT satisfied

// Example: if the card sum is 21, set the value of result to "Blackjack", otherwise set the result to "You lost"
let cardSum = 21
let result = cardSum==21 ? "BlackJack" : "You lost"

// Example: print based on the value of condition
let card1 = 11
let card2 = 10
print(card1 == card2 ? "Cards are the same" : "Cards are different")

// MARK: Switch case statement
// Switch case is used if you have to check several values and do different things based on that
// Hint: if you have more than 3 cases, it is better to use it for code simplicity

let weather : String = "rain"
// You set it like this:
// switch valueToCheck {
// case value1:
// do something
// case value2:
// do something else
// defalut:
// do this if you do not find a match with previous cases
// }
switch weather {
case "sun":
    print("The weather is sunny")
case "rain":
    print("It is raining")
default:
    print("I do not know the weather")
}

// Swift will only run the code inside each case. If you want execution to continue on to the next case, use the fallthrough keyword like this:
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough // go to next case
default:
    print("Enjoy your day!")
}

// MARK: Range operators
// Swift gives us two ways of making ranges: the "..<" and "..." operators. The half-open range operator, "..<", creates ranges up to but excluding the final value, and the closed range operator, "...", creates ranges up to and including the final value
let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
