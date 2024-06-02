//MARK: ARRAYS
// Arrays are collections of objects
// Objects are ORDERED, starting from INDEX 0 to the last object.
// The objects has to be of the same type.
// You declare an array using the square brackets " [] ", with each item separated by commas.
// You can then access to a single element using its index
// If you want to declare a array of declared types, you can use brackets with the type inside (i.e.: [String], [Int], etc)

// Create an array of strings with declared type
var family : [String] = ["Cristina", "Tim", "Sebastian"]

// Access and save the last name into a variable
var dad = family[family.count-1]

// You can also create an empty array of strings so to fill in later
var arrayOfStringsEmpty : [String] = []

// You can add an element to an existing array of the correct type using "append()" function or "+=" operator
family.append("Ludovica")
family += ["Christian"]

// You can also insert at a particular index
family.insert("Luna", at: 2)

// You can remove and retrieve the item at a particular index
var dog2 = family.remove(at: 2)

// You can also iterate through arrays elements using a for loop
for member in family {
    print(member)
}

// MARK: SETS
// Sets are collection of objects like arrays with 2 main differences:
// - items are NOT ORDERED; they are stored in random order
// - items CANNOT BE DUPLICATE
// You can create sets of any type of object that is HASHABLE (it mean that can be ), that mean that the type must provide a way to compute a hash value for itself.
// A hash value is an Int value that’s the same for all objects that compare equally, such that if object a == object b, the hash value of object a is equal to the hash value of object b.

//You can create sets directly from arrays, like this:
var set1 = Set(family)

// You can create a an empty set of a defined type
var members = Set<String>()
// You can insert a member into a set using the insert() function
members.insert("Joe")

//MARK: TUPLES
// Tuples allows you to store multiple values into a single one. They are like variables with superpowers. They are different from arrays since:
// 1 - You can’t add or remove items from a tuple; they are fixed in size.
// 2- You can’t change the type of items in a tuple; they always have the same types they were created with.
// 3- You can access to tuple values by numerical index or naming them
var familyTuple = (Dad: "Sebastian", Mom: "Cristina", Dog:"Tim")
var dad2 = familyTuple.Dad
var mom = familyTuple.2

// MARK: When should you use an array, a set, or a tuple in Swift?
// - If you want to store a list of all words in a dictionary for a game, that has no duplicates and the order doesn’t matter so you would go for a set
// - If you want to store all the articles read by a user, you would use a set if the order didn’t matter (if all you cared about was whether they had read it or not), or use an array if the order did matter.
// - If you want to store a list of high scores for a video game, that has an order that matters and might contain duplicates (if two players get the same score), so you’d use an array.
// - If you want to store items for a todo list, that works best when the order is predictable so you should use an array.
// - If you want to hold precisely two strings, or precisely two strings and an integer, or precisely three Booleans, or similar, you should use a tuple.

//MARK: DICTIONARIES
// Dictionaries are collections of values just like arrays, but rather than storing things with an integer position you can access them using a "key", that can be anything you want

// A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique key, which acts as an identifier for that value within the dictionary. Unlike items in an array, items in a dictionary don’t have a specified order. You use a dictionary when you need to look up values based on their identifier, in much the same way that a real-world dictionary is used to look up the definition for a particular word.

// Example of a dictioary containing all the heights of our family
var heightDict = [
    "Dad" : 1.65,
    "Mom" : 1.70,
    "Dog" : 1.10
]

// Store the height of Dad
var heightOfDad = heightDict["Dad"]

// You can also create an empty dictionary of a particular type
var emptyDict : [String : String] = [:]
// Add a value
emptyDict["Value1"] = "This is the first item"

// You can iterate over the key-value pairs in a dictionary with a for-in loop. Each item in the dictionary is returned as a (key, value) tuple, and you can decompose the tuple’s members into temporary constants or variables as part of the iteration:
for (member, height) in heightDict {
    print("\(member) is \(height) tall")
}

// What if you request for the value of a key that does not exist? You can provide a default value as below in case the key does not exist
var dog2Height = heightDict["Bread", default: 1.50]

// MARK: HOW TO CREATE EMPTY COLLECTIONS
// You can create empty collections that you can fill later
// The trick is to write the type followed by empty parenthesis
// For Sets and Dictionaries, you have to use the keyword Set or Dictionary, followed by <Data type> and the empty parenthesis

// Empty Array of integers
var emptyArr = [Int] ()

// Empty Tuple
var emptyTuple = (Int) ()

// Empty set of integers
var emptySet = Set<Int> ()

// Empty dictionary of Int:Int
var emptyDict2 = Dictionary<Int,Int> ()
emptyDict2[1] = 1
emptyDict2[3] = 3


// MARK: ENUMS
// Enumerators are collection types useful when you want to store multiple values of the same var in order to access it easily later
// For eexample, if you want to store the result of an operation, you can define an enum called Result like below
enum Result {
    case success
    case failure
}

// example: let's create  a var storing a failure result
let result = Result.failure

// you can decide what to do based on the operation success or failure
switch result {
case .failure:
    print("The operation was not successful")
case .success:
    print("Everything went good")
default:
    print("Not able to understand")
}

// Enums can also store ASSOCIATED VALUES attached to each case. This lets you attach additional information to your enums so they can represent more nuanced data.

// Example: we want to store some activities type
enum Activity {
    case bored
    case running(destination: String)
    case walking(destination : String)
    case talking(topic: String)
}
// now we can filter based on some activity infos
let activity1 = Activity.talking(topic: "History")

switch activity1 {
case .talking(topic: "History"):
    print("People are talking about history")
case .talking(topic: "Maths"):
    print("Peolpe are talking about maths")
default:
    print("Do not know what they are doing")
    
}

// You can also associate RAW VALUES to different enum cases
enum Planets: Int {
    case Mercury
    case Earth
    case Mars
    case Junon
}
// In this way, each enum case will have assigned a value starting from 0
// I can access to a certain value based on its raw value
let earth = Planets(rawValue: 1)

// You can also assign default raw values, swift will put the rest
enum Planets2: Int {
    case Mercury = 1
    case Earth
    case Mars
    case Junon
}



