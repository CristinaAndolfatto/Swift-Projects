// MARK: Loops
// Loops are useful to run some code until a condition is satisfied

// MARK: For loops
// For loop will loop over arrays and ranges, and each time the loop goes around it will pull out one item and assign to a constant (take a look at memory management!)

let numbers = 1...10
// print each number in numbers
for number in numbers
{
    print("Item in numbers: \(number)")
}

// You can do the same with arrays
let albums = ["Red", "1989", "Reputation"]
// print each album in the array of albums
for album in albums {
    print("\(album) is on Apple Music")
}

// if you do not want to use the constant, you can use underscore: "_"
// Print "Ciao" for 5 times
for _ in 1...5 {
    print("Ciao")
}

// MARK: While loops
// Give a condition to check, while loop code will go around and around until the condition fails.

var count = 5
var idx = 0
while count > 0 {
    // Count one iteration
    idx += 1
    print("Iteration number \(idx)")
    // Substract 1 until the count variable reaches 0
    count -= 1
}

// MARK: Repeat loop
// repeat loop is identical to a while loop, except the condition to check comes at the end
count = 5
idx = 0
repeat {
    // Count one iteration
    idx += 1
    print("Iteration number \(idx)")
    // Substract 1 until the count variable reaches 0
    count -= 1
} while count > 0

// NOTE: Because the condition comes at the end of the repeat loop, the code inside the repeat loop will always be executed at least once, VS while loops check their condition before their first run (so it may never be executed if condition fails)

// MARK: Exiting loops
// You can exit a loop at any time using the break keyword

// Example:
var countDown = 10

// without break
while countDown >= 0 {
    print(countDown)
    countDown -= 1
}

print("Blast off!")
// break at countdown == 4
while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}

// MARK: Exiting multiple loops
// You can create loops inside loops. If so, it is called a "nested loop".
// If you want to exit, you can name them (put a label on each loop) so to break the one that you want like below:

outerloop: for i in 1...10 {
    for j in 1...10 {
        let prod = i * j
        print("\(i)*\(j)=\(prod)")
        
        // if the product equals 50
        if prod == 50 {
            print("Found the first 2 number with product equal to 50")
            // exit from the external loop, so exit both loops
            break outerloop
            // N.B. With a regular break, only the inner loop would be exited – the outer loop would continue where it left off.
        }
    }
}


// MARK: Skipping items
// Break exit the current loop. If you simplywant to skip and go to the next iteration, you can use the keyword "continue"

// Example: write a loop from 1 through 10, then use Swift’s remainder operator to skip any numbers that are odd:
for i in 1...10 {
    // if the number is odd, skip and go to next iteration
    if i % 2 == 1 {
        continue
    }
    // otherwise, if the number iseven, print it
    print("\(i)")
}


// MARK: Infinite loops
// It’s common to use while loops to make infinite loops: loops that either have no end or only end when you’re ready. All apps on your iPhone use infinite loops, because they start running, then continually watch for events until you choose to quit them.
// To make them, just put "true" as condition of the while loop (it will always be true)
// Be sure to have an exit condition

var counter = 0

while true {
    print(" ")
    counter += 1
    // print 276 times
    if counter == 275 {
        // exit from the while loop and break it
        break
    }
}
