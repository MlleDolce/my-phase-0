// 7.3: Algorithm Practice

// Add a file called algos.js to the phase-0-tracks/js folder.
// In algos.js, write a function that takes an array of words or phrases and returns the longest word or phrase in the array. 
// So if we gave your function the array of ["long phrase","longest phrase","longer phrase"], it would return "longest phrase". 
// This is a logical reasoning challenge, so try to reason through this based on what you already know, 
// rather than Googling the fanciest solution or looking up built-in sorting functions. 
// Note that "some string".length will do what you expect in JS.
// Add driver code that tests your function on a few arrays.

// 3:19pm

// Pseudo-Code

// 1. Write body of function with function's name.  The function will take an array as a parameter.
//			var longestPhrase = function(myArray) { }
// 2.  Create a sample array to work from.  myArray
//			myArray = [true, "concert management", "extended techniques are awesome", "3 concerts per month"]
// 3.  Write a loop to find the length of each phrase in the array.
//			for (i = myArray.length - 1; i < myArray.length; i++) {
 //				console.log(myArray[i].length);
//			}

// 3.  Find a way to compare the length of each phrase in the array. 
 //		a.) Create a placeholder variable for comparison that will update 
 // 		it's value at the end of each loop.  When first stated, make sure the placeholder variable is OUTSIDE loop and start it with the 
 // 		first item of the array.
//				var longPhrase = myArray[0]
//		b.) Compare the length of each array item in the loop to the placeholder length:
//				if (myArray[i].length > longPhrase.length);
//		c.)	If this comparison returns TRUE, then update the placeholder value at the end of each loop:
//				{ var longPhrase = myArray[i] }
//		d.) When loop is complete, return the value of longPhrase.  Do this outside of the loop:
//				return longPhrase 
var arrayContainer = {}
var myArray = ["Pianos have 88 keys", "concert management", "extended techniques are awesome", "3 concerts per month"]

var longestPhrase = function(myArray) {

	var longPhrase = myArray[0]
	//console.log(longPhrase.length)

	for (i = 1; i < myArray.length; i++) {
			if (myArray[i].length > longPhrase.length) {
				var longPhrase = myArray[i];
			}
	};
	console.log("The longest phrase in the array is" + " '" + longPhrase + "' at" + " " + longPhrase.length + " characters");
}

var compareObjects = function(object1, object2) {
	
}

arrayContainer.myArray = myArray
console.log(arrayContainer)
longestPhrase(myArray)

 