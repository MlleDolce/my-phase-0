// 08.12.16 Wednesday
// Completed Releases 1 & 2

// 7.3: Algorithm Practice

// Add a file called algos.js to the phase-0-tracks/js folder.
// In algos.js, write a function that takes an array of words or phrases and returns the longest word or phrase in the array. 
// So if we gave your function the array of ["long phrase","longest phrase","longer phrase"], it would return "longest phrase". 
// This is a logical reasoning challenge, so try to reason through this based on what you already know, 
// rather than Googling the fanciest solution or looking up built-in sorting functions. 
// Note that "some string".length will do what you expect in JS.
// Add driver code that tests your function on a few arrays.

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
var firstArray = ["Pianos have 88 keys", "concert management", "extended techniques are awesome", "3 concerts per month"]

function longestPhrase (myArray) {

	var longPhrase = myArray[0]
	//console.log(longPhrase.length)

	for (var i = 1; i < myArray.length; i++) {
			if (myArray[i].length > longPhrase.length) {
				var longPhrase = myArray[i];
			}
	};
	console.log("The longest phrase in the array is" + " '" + longPhrase + "' at" + " " + longPhrase.length + " characters");
}

//Release 1: Find Key-Value Pair
function compareObjects (obj1, obj2) {
  Arr1 = []
  Arr2 = []
  var flag = false

  for (var prop in obj1)
  	Arr1.push(prop + ": " + obj1[prop]);
  for (var prop in obj2)
  	Arr2.push(prop + ": " + obj2[prop]);

  for (var x = 0; x < Arr1.length; x++)
   	compareKey = Arr1[x];
    for (var y = 0; y < Arr2.length; y++)
   	    if (Arr2[y] == compareKey)
   	      flag = true;
   	return console.log(flag);
}

//Release 2: Generate Random Test Data

function randChar() {
	alph = "abcdefghijklmnopqrstuvwxyz";
	return alph.charAt(Math.floor(Math.random() * (alph.length + 1)));
}

function randomArray(length) {
	alph = "abcdefghijklmnopqrstuvwxyz";
	rand10 = Math.ceil(Math.random() * 10);
	randArray = [];
	for (var i = 0; i < length; i++) {
	  randWord = "";
	  //console.log(randWord);
	  //console.log("loop: " + (i + 1) + randWord + " ");
      for (var y = 0; y < rand10; y++) {
    	randWord += randChar();
    }
      randArray.push(randWord);
      //console.log(randWord);
    }
  return randArray;
}

//Release 0, Driver Code:
console.log("**********************************************************")
console.log("Release 0:")

arrayContainer.firstArray = firstArray;
console.log(arrayContainer);
longestPhrase(firstArray);

//Release 1, Driver code:
console.log("**********************************************************")
console.log("Release 1:")

var dog1 = {name: "Remy", age: 1};
var dog2 = {name: "Molly", age:2};
compareObjects(dog1, dog2);

//Release 2, Driver code:
console.log("**********************************************************")
console.log("Release 2:")

console.log(randChar())
console.log(randomArray(3))
console.log(randomArray(5))


for (var i=0; i < 10; i++) {
	console.log(". . . . . . . . . . . . . . . . . . . . . . . . . . .")
	console.log("Loop #: " + (i+1))
	console.log(randomArray(3));
	console.log(longestPhrase(randomArray(3)));
	//console.log(". . . . . . . . . . . . . . . . .")
}




 