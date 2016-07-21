// 7.2: Data Structures


// Release 0: Work with Arrays
//		1. Create a file called data_structures.js.
//		2. In your new file, declare two separate arrays:
//				a.) an array of four colors
//				b.) an array of four horse names
//		3. Write additional code that adds another color to the colors array, and another horse name to the horses array.

var horseColors = ["red", "beige", "speckled", "black"]
var horseNames = ["Bob", "Dan", "Melissa", "Kate"]

horseNames.push("Sam")
//console.log(horseNames)



// Release 1: Build an Object
// Hashlike (key-value) behavior: https://repl.it/CA4b/36

// We need to assign colors to horses. In data_structures.js, add code that will use your two arrays to create an object. 
// The keys of your object should be horse names, and the values should be colors. 
// Your solution should be something that would work for any number of colors/horses, as long as the two arrays are the same length. 
// This is a logical reasoning step -- try to think it through instead of Googling it.

// pseudocode:
// 1.  Create new object called horseDatabase
    	var horseDatabase = new Object()
// 2. Write code that could assign a single key and variable to our database
//    horseDatabase[horsename] = value
// 3. Write a for loop to incorporate both arrays into our object
for (i = 0; i < horseColors.length; i++) {
	horseDatabase[horseNames[i]] = horseColors[i]; 
}
// 4. Print new object horseDatabase to see if for loop worked:
console.log(horseDatabase)



// Release 2: Build Many Objects Using a Constructor

// Java tutorial, Classlike behavior: https://repl.it/CA4q/2

// Horses are great, but times are a-changin', and we need to add an option for faster transportation that we can create with an assembly line. 
// At the bottom of your data_structures.js file, write a constructor function for a car. 
// Give it a few different properties of various data types, including at least one function. 
// Demonstrate that your function works by creating a few cars with it.

function Car(make, model, year, color) {

	console.log("Our new car:", this);

	this.make = make;
	this.model = model;
	this.year = year;
	this.color = color;

	this.beep = function() { console.log("*beeps horn three times*")};

	console.log("CAR INITIALIZATION COMPLETE");
}

console.log("Let's build a car ...")
var car1 = new Car("Honda", "CRV", 2006, "Black");
console.log(car1);
console.log("Our car can beep:");
car1.beep();
console.log("----");

console.log("Let's build another car...");
var car2 = new Car("Toyota", "RAV", 2011, "White")
console.log(car2.model);
console.log("This new car can beep, too:");
car2.beep();
console.log("----")

// Release 3: Research on Your Own

// If you wanted to loop through the keys and values of an object, how would you do that? 
//		a.) keys:
// 		Create a for-loop. the 'property' could be any placeholder name you like.  
//		This will print out every single key of the object.  eg:
		for (var property in horseDatabase) { console.log(property)}
//		b.) values (just like in a ruby hash, we access the value by using the variable name in bracket notation within the object/hash):
		for (var property in horseDatabase) { console.log(horseDatabase[property])}


// (There are a few ways to accomplish this, and some gotchas that can happen depending on your approach.)
// Are there advantages to using constructor functions to create objects? Disadvantages? 
//		Advantages: 
//		-Allows you to create many types of a given object very easily without having to repeat yourself over again with each new instance.
// 		An object constructor is great for more complicated object types with different behaviors.  
//		-A constructor ALSO allows you to give a class a prototype

//		Disadvantages:
//		-constructors are slower than object literals, because they need to be executed
//		-literal notation is simpler and easier.  If an object does not require the complexities
//			of a constructor function, literal notation would be preferable


 