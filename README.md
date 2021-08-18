# COMP 333 - Assignment 3: Higher-Order Functions, Algebraic Data Types, and Pattern Matching in Swift

**Course Title:** Concepts of Programming Languages<br/>
**Semester:** Summer 2021<br/>
**Due:** Wednesday, August 25 at 11:59 PM<br/>

## Goals for This Assignment

By the time you have completed this work, you should be able to:

* Work with the basics of the syntax of Swift
* Define a list with an algebraic data type (`enum` in Swift)
* Deconstruct algebraic data types with pattern matching (`switch` in Swift)
* Define methods which take higher-order functions

## Step-by-Step Instructions

### Step 1: Get Swift Working

For this assignment, you'll be using Swift. You can either install Swift from [this link](https://swift.org/download/#releases), or run it in the browser [here](http://online.swiftplayground.run/). Binaries are available for Ubuntu Linux and Mac OS X. Exactly which method you use doesn't matter; it will work the same either way.

### Step 2: Implement a Singly-Linked List

A significant of code has been provided in `main.swift`, including a test suite of significant size. As with assignment 1, you are tasked with writing a singly-linked list. However, this time around, you'll be doing this in Swift. Instead of using dynamic dispatch to select between `cons` and `nil` behavior, you'll be using pattern matching via `switch`. Additionally, you'll also be defining key list-based operations which work with higher-order functions, namely `filter` and `map`. The comments in the file provide further details. Note that the tests themselves are a rich source of information, both in terms of defining what you need to implement (i.e., they serve as a specification), and how Swift works.

### Step 3: Turn in Your Code

You need to upload the following files:

* `main.swift`

In addition, if you collaborated with anyone else, be sure to create a `collaborators.txt` file and write the names of the people you collaborated with in the file, one per line. Please submit this file along with the other files.

You can turn in the assignment multiple times, but only the last version you submitted will be graded.
