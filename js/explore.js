// 7.1: Release 4

// 1.  In phase-0-tracks/js, create a file called explore.js.
// 2.	Ruby has lots of handy functions like .reverse, but in JavaScript, we mostly have to write our own. 
// 		In comments, pseudocode a function that takes a string as a parameter and reverses the string. 
// 		reverse("hello"), for example, should return "olleh". 
// 		This isn't a task specific to JavaScript -- your pseudocode should be in plain English and use phrases like "for each" instead of JavaScript-specific terms. 
// 		Remember that you can add strings in JavaScript, so '' + 'a' would result in the string 'a'. 
// 		Take your time. This is the most valuable skill in programming: being able to think through a problem logically.

// 3.  Under your commented pseudocode, implement your function in JavaScript. Test it with driver code if you like. 
//		Anytime you'd like to run your code, you can run node explore.js from the js folder in your terminal, similar to how you run Ruby programs.
// 4.	Add driver code that calls the function in order to reverse a string of your choice (as long as it's not a palindrome!), 
//		and stores the result of the function in a variable.
// 5.	Add driver code that prints the variable if some condition is true. The condition can be a silly one, like 1 == 1.

// Pseudo-code

// 1. Write a javascript function that will take a string as a parameter.  Call it 'reverse'
var reverse = function(string) {
// 2.  Create a block of code for this function includes a 'for' loop with a reverse counting incrementor to print out the index numbers.
		var arrayReverse = []
		for (i = string.length - 1; i >= 0; i--) {
// 3. Create an array to push each character index created from the 'for' loop:
			arrayReverse.push(string[i]);
		};
// 4. Print out the array to make sure that the loop is working:
		// { console.log(arrayReverse);
// 5. Join each item of the new array together to create a new string.
		  { return arrayReverse.join('');
		}
}

var reverseString = reverse("Hello")
if (1 === 1) {
	console.log('' + reverseString);
}

