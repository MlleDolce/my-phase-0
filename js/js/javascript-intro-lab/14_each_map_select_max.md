[Back](13_looping_through_arrays.md)

# 14. Each, Map, Select, Max

We've already learned that JavaScript does not provide looping methods in the same way that Ruby does. The question, then, is "how would we reproduce Ruby-like looping methods in JavaScript?".

This last lesson provides some examples of JavaScript implementations for the Ruby Array methods `#each`, `#map`, `#select`, and `#max`.  

In the interest of simplicity, the new implementations will be global functions, not methods of the JavaScript `Array` global object.  They will not be an *exact* match of the Ruby method. 

See if you can figure out how each works, and then tinker with it on your own in the browser console.

### Each

```javascript
// Array#each
var each = function(array, func) {
  for (var i=0; i < array.length; i++) {
    func(array[i]);
  }
};
```

The `each()` function defined above takes two arguments: an array and a function.  `each()` then iterates through every element in the array and passes it to the function `func` (we can't use the word `function` for a parameter since it is a reserved word).

What is the purpose of the `func` parameter?  In Ruby, you might call `Array#each` like this:

```ruby
[1,2,3,4].each { |n| puts n }
```

The `{ |n| puts n }` is the block of code passed to `each`.  JavaScript does not have a separate object for blocks, so we instead use a **callback function**: a function called as an argument from another function.  The parameter `func` stands in for a function which will be called with the argument `array[i]`.  

Here is an example of how you could use this function:

```javascript
// Define an array
var bugs = ["beetle", "spider", "yellow jacket", "firefly"];

// Execute the each() function, passing it a callback function
each(bugs, function(x) { console.log(x); });
```

### Map

Ruby's `Array#map` method will pass each element in an array to a block, and then return a new array of the modified elements.  Here is how we can accomplish this in JavaScript:

```javascript
var map = function(array, func) {
  var results = [];
  
  for (var i=0; i < array.length; i++) {
    results.push(func(array[i]));
  }
  
  return results;
};
```

Using `map()` would then look something like this:

```javascript
// Source array:
var nums = [5,12,2,81,30];

// Function to use:
var timesTwo = function(x) { return x * 2 };

var numsTimesTwo = map(nums, timesTwo);
numsTimesTwo; // => [10, 24, 4, 162, 60]
```

Note the use of the `return` keyword in the argument function.  If left out, every function call in the loop would  return `undefined`, giving us an array of `undefined` elements.

### Select

`select` is similar to `map` except that we use the callback function to provide a truthy or falsey value for the conditional statement.

```javascript
var select = function(array, func) {
  var results = [];
  
  for (var i=0; i < array.length; i++) {
    if (func(array[i])) {
      results.push(array[i]);
    }
  }
  
  return results;
};
```

Try using select on the following arrays to filter out unwanted values:

```javascript
// Select the schools with names that have an 'r' in them:
var schools = ["Berkeley", "Notre Dame", "Chicago", "Stanford", "Tulane"];

// Select the multiples of 5:
var numbers = [4,10,39,105,73,20,15];

// Select the sub-arrays that contain less than 3 elements
var grid = [ [0,1,0,0],
             [1,0,1],
             [1,1,0,0,1],
             [0,1],
             [1,0,0,0] ];
```
### Max

Finally, `Array#max`: the simplest of the four.  No need to pass a callback function, since all we are doing is returning the largest number.

```javascript
var max = function(array) {
  var biggest = array[0];
  
  for (var i=0; i < array.length; i++) {
    if (array[i] > biggest) {
      biggest = array[i];
    }
  }
  
  return biggest;
};
```