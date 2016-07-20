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


 