[Back](12_looping_basics.md)

#13. Looping Through Arrays

Running a loop a fixed number of times has limited use.  Usually we want to say something like, "Run this piece of code as many times as there are people in this phone book."  Let's apply this idea to a simple array of strings:

```javascript
var dogs = ["husky", "great dane", "labrador retriever", "chihuahua", "terrier"];
```

If we wanted to print out each of these strings to the console, for example, we could write something like this:

```javascript
console.log(dogs[0]);
console.log(dogs[1]);
console.log(dogs[2]);
console.log(dogs[3]);
console.log(dogs[4]);
```

But that is pretty bulky and ugly. We can use a `for` loop to do the same thing, but in less code:

```javascript
for (var i = 0; i < dogs.length; i++) {
  console.log(dogs[i]);
}
```

Code inside a block (`{ like this }`) can see variables defined outside itself, which means we can use variables to determine what to print. In this case, we are indexing into an array referenced by the variable `dogs`.

Since our `for` loop defines an incrementor `i` which starts at `0` (just like the index on an array, if you noticed), we can use that same variable to access elements within the array: `dogs[i]`. Thus, each iteration of the loop will print the subsequent element in the array.

Try this out in the browser console for yourself.

### It's all in the .length

We already know that JavaScript does not have an `each()` method to match Ruby's `Array#each`, but that doesn't mean that we can't perform the same function.  If you think about it, `each` is just a method that says "do something as many times as there are elements in this array".  In Ruby, it just does little extra work for us and passes each element to the block in turn. JavaScript is the same, except that we have to use array indexing to access the element each time.

As an example, let's say that we want to sort an array of integers into two arrays: odds and evens.  In order to accomplish this, we have to iterate through each element in the source array, determine whether it is odd or even, and the shove it into the appropriate destination array.  We need a loop that will execute *as many times as there are elements in the array*.  Take a look at how we would write this, and try it out in the browser console:

```javascript
// First, we set up the source and destination arrays
var integers = [3,8,1,6,2,0,5,7];
var odds     = [];
var evens    = [];

// Then define the loop
for (var n = 0; n < integers.length; n++) {
  if (integers[n] % 2 === 0) {
    evens.push(integers[n]);
  } else {
    odds.push(integers[n]);
  }
}

console.log(integers);
console.log(odds);
console.log(evens);
```

Experiment with this loop and create your own until you feel comfortable with the syntax.

### for ... in ...

There is another way to write `for` loops in JavaScript that is a bit closer to looping in Ruby.

Instead of writing `for` with a series of statements outlining the parameters of the loop (intial value, conditional, incrementor/decrementor), we can use the `for (x in y)` syntax, where `x` is a variable representing an incrementable value and `y` represents an object with a `length` property, such as `Array`. Let's try it out on a simple array. Run this in the browser console:

```javascript
var nums = [6,0,1,9,3];

for (i in nums) {
  console.log(i);
}
```

The `i` variable still acts as an incrementor, just like the longhand syntax (`for (var i=0; i<n; i++)`) above.  Did you expect it to hold the value of each element in the array?  Nope, sorry.

`for...in` will look for any enumerable properties available to the object, including any in the prototype chain. This can introduce unintended data into your loop! Run this code in your console to see an example:

```Javascript
testArray = [1,2,3,4,5]

for (i in testArray) {
  console.log(testArray[i])
} 
// outputs 1 2 3 4 5 as expected

// now lets add a property to the prototype chain

Array.prototype.newProp = "I live in the Array prototype!"

for (i in testArray) {
  console.log(testArray[i])
} 
```

To combat this we can either use the long form `for` loop, or you can add this line to make sure that the `for..in` loop does not try to look up the prototype chain.

```Javascript
testArray = [1,2,3,4,5]

Array.prototype.newProp = "I live in the Array prototype!"

for (i in testArray) {
  if (testArray.hasOwnProperty(i))
    console.log(testArray[i])
} 
```
Click [next](14_each_map_select_max.md) to go to the next section.

### References

[MDN: JS Reference: for Statement](https://developer.mozilla.org/en/JavaScript/Reference/Statements/for)<br>
[MDN: JS Reference: for ... in Statement](https://developer.mozilla.org/en/JavaScript/Reference/Statements/for...in)<br>
