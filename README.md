# COMP 333 - Assignment 2: Prototype-based Inheritance and Virtual Dispatch in JavaScript

**Course Title:** Concepts of Programming Languages<br/>
**Semester:** Summer 2021<br/>
**Due:** Wednesday, August 4 at 11:59 PM<br/>

## Goals for This Assignment

By the time you have completed this work, you should be able to:

-   Understand a code's specification from a test suite
-   Work with the basics of the syntax of JavaScript
-   Use prototype-based inheritance to reuse code
-   Use virtual dispatch to encode different behaviors

## Step-by-Step Instructions

### Step 1: Get JavaScript Working

For this assignment, you'll be using JavaScript. It's possible to make this assignment work in any Web browser, though it may require some modification to make the output reasonable. It's recommended to use [Node.js](https://nodejs.org/en/) as your implementation, which can be installed on all major platforms. Node.js can also be run directly in the browser [here](https://repl.it/languages/nodejs), if you prefer.

#### Working with Node.js

To work with node from the command line, you can do the following:

1. Go to the directory containing the file (using the cd command)
2. Start node.js with the `node` command
3. Within the node.js prompt, type `.load list.js` and hit enter. This will read your program.
4. Run the tests by typing `runTests()` and hitting enter. This will execute the `runTests()` function in this file.

### Step 2: Implement a Singly-Linked List

A significant of code has been provided in [`list.js`](list.js), including a test suite of significant size. Your goal with this assignment is to get all the tests passing, without modifying any of the testing code. Note that the tests themselves are a rich source of information, both in terms of defining what you need to implement (i.e., they serve as a specification), and how JavaScript works.

In this assignment, you'll be defining code for an immutable singly-linked list. Lists are constructed with two kinds of objects:

-   A `Cons` object represents a non-empty list. It holds a single
    element of the list, along with the rest of the list.
-   A `Nil` object represents an empty list, containing no elements,
    and no other elements.

These objects are not wrapped around anything; if you take a list, you take `Cons` or `Nil` objects.

This list is intended to be used in an immutable way. This means for example, there is an `append` operation, but `append` does not modify the list it was called on. Instead, `append` will return a new list, representing the result of the append. For example, if we append `[1, 2]` onto `[3, 4, 5]`, `append` will return a new list representing `[1, 2, 3, 4, 5]`, and the original lists `[1, 2]`, and `[3, 4, 5]` will be unchanged.

Your goal with this assignment is to get all the tests to pass, without modifying any of the testing code. There are enough unit tests that they serve as a (possibly incomplete) specification of what the code needs to do. Some of the provided tests pass out of the box without any changes you need to do on your end.

#### Hints

1. The behaviors for `append`, `contains`, `length`, `filter`, and `map` differ depending on whether or not they are called on `Cons` or `Nil`. Some tests force you to use virtual dispatch to encode this difference.
2. Singly-linked lists are a recursive data structure, and the methods can most naturally be implemented with recursion.
3. My reference solution contains less than 50 lines of code. If you start needing dramatically more than 50 lines, talk to me to make sure you're on the right track.

### Step 3: Turn in Your Code

You need to upload the following files:

-   `list.js`

In addition, if you collaborated with anyone else, be sure to create a `collaborators.txt` file and write the names of the people you collaborated with in the file, one per line. Please submit this file along with the other files.

You can turn in the assignment multiple times, but only the last version you submitted will be graded.
