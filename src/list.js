// COMP 333 Assignment 2
//
// WORKING WITH NODE
// You will need node.js (https://nodejs.org/en/) installed and working
// to run this.  It's also possible, with some tweaking, to get it working
// in a Web browser.  In that case, you probably will want to replace
// `console.log` with some output routine.
//
// To work with node from the command line, you can do the following:
// 1.) Go to the directory containing the file (using the cd command)
// 2.) Start node.js with the `node` command
// 3.) Within the node.js prompt, type `.load list.js` and hit enter.
//     This will read your program.
// 4.) Run the tests by typing `runTests()` and hitting enter.
//     This will execute the `runTests()` function in this file.
//
// ASSIGNMENT: IMMUTABLE SINGLY-LINKED LIST IMPLEMENTATION
// In this assignment, you'll be defining code for an immutable
// singly-linked list.  Lists are constructed with two kinds of objects:
// - A `Cons` object represents a non-empty list.  It holds a single
//   element of the list, along with the rest of the list.
// - A `Nil` object represents an empty list, containing no elements,
//   and no other elements.
// These objects are not wrapped around anything; if you take a list,
// you take `Cons` or `Nil` objects.
//
// This list is intended to be used in an immutable way.  This means
// For example, there is an `append` operation, but `append` does
// not modify the list it was called on.  Instead, `append` will
// return a new list, representing the result of the append.  For
// example, if we append `[1, 2]` onto `[3, 4, 5]`, `append` will
// return a new list representing `[1, 2, 3, 4, 5]`, and the
// original lists `[1, 2]`, and `[3, 4, 5]` will be unchanged.
//
// Your goal with this assignment is to get all the tests to pass,
// without modifying any of the testing code.  There are enough
// unit tests that they serve as a (possibly incomplete) specification
// of what the code needs to do.  Some of the provided tests pass
// out of the box without any changes you need to do on your end.
//
// HINTS:
// 1.) The behaviors for `append`, `contains`, `length`, `filter`,
//     and `map` differ depending on whether or not they are called
//     on `Cons` or `Nil`. Some tests force you to use virtual
//     dispatch to encode this difference.
// 2.) Singly-linked lists are a recursive data structure, and
//     the methods can most naturally be implemented with recursion.
// 3.) My reference solution contains less than 50 lines of code.
//     If you start needing dramatically more than 50 lines, talk
//     to me to make sure you're on the right track.
//

// join
//
// Parameters:
// - A List of elements
// - A delimeter to separate them by
// Returns a single string, which results from calling
// toString on each element, separated by the delimeter.
//
// For example:
// join(new Nil(), ", ")                     // "[]"
// join(new Cons(1, new Nil()), ", ")        // [1]
// join(new Cons(2, new Cons(3, new Nil())), // [2, 3]
//
function join(list, delim) {
    let retval = "[";
    while (list instanceof Cons && !(list.tail instanceof Nil)) {
        retval += list.head.toString() + delim;
        list = list.tail;
    }
    if (list instanceof Cons) {
        retval += list.head.toString();
    }
    retval += "]";
    return retval;
} // join

function List() {}

List.prototype.join = function (delim) {
    return join(this, delim);
};
List.prototype.toString = function () {
    return this.join(", ");
};

function Cons(head, tail) {
    this.head = head;
    this.tail = tail;
}

Cons.prototype = new List();
Cons.prototype.isEmpty = function () {
    return false;
};

function Nil() {}

Nil.prototype = new List();
Nil.prototype.isEmpty = function () {
    return true;
};
