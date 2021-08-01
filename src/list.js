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
}

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

// It's undefined if it's loaded in the REPL with .load
if (module !== undefined) {
    module.exports = {Cons, List, Nil};
}
