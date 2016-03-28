[Back](3_variables.md)

#4. Functions vs. Methods

JavaScript, unlike Ruby, makes a clear distinction between functions and methods. This section will cover some of the characteristics of each and how to recognize one from the other.

#### What is a Function?

The best definition of a **function** is "a chunk of code that does stuff". If that's not good enough for you, then maybe you'd prefer the definition from MDN:

>Generally speaking, a function is a "subprogram" that can be called by code external (or internal in the case of recursion) to the function. Like the program itself, a function is composed of a sequence of statements called the function body.  Values can be passed to a function, and the function can return a value. [Link to source](https://developer.mozilla.org/en/JavaScript/Reference/Functions_and_function_scope)

Access to functions is determined by the scope in which they were defined. If you define a function in the global scope, it will be available throughout your program. If you define it within an object or another function, it will only be available from within the context of that object or function.

#### What is a Method?

We use the word **method** to refer to a function that is defined within the context of an object. For example, `toUpperCase()` is a method defined by the `String` object. It will only work when called on a string object.

JavaScript defines methods for its core global objects (`String`, `Array`, `Object`, etc.) which we can use on any objects of that type. In a browser environment, there are a vast number of other methods JavaScript provides for working with objects like `document`, `window`, `location`, and more.

You can also define your own methods for built-in objects or for new objects of your own design.

Click [next](5_function_basics.md) to go to the next section.