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

// region: List
function List() {}

List.prototype.join = function (delim) {
    return join(this, delim);
};
List.prototype.toString = function () {
    return this.join(", ");
};
// endregion: List

// region: Cons
function Cons(head, tail) {
    this.head = head;
    this.tail = tail;
}

Cons.prototype = new List();

Cons.prototype.append = function (list) {
    return this;
};

Cons.prototype.contains = function (value) {
    return false;
};

Cons.prototype.filter = function (callbackFn) {
    return this;
};

Cons.prototype.isEmpty = function () {
    return false;
};

Cons.prototype.length = function () {
    return 1 + this.tail.length();
};

Cons.prototype.map = function (callbackFn) {
    return this;
};
// endregion: Cons

// region: Nil
function Nil() {}

Nil.prototype = new List();

Nil.prototype.append = function (list) {
    return list;
};

Nil.prototype.contains = function () {
    return false;
};

Nil.prototype.filter = function () {
    return this;
};

Nil.prototype.isEmpty = function () {
    return true;
};

Nil.prototype.length = function () {
    return 0;
};

Nil.prototype.map = function () {
    return this;
};
// endregion: Nil

// It's undefined if it's loaded in the REPL with .load
if (module !== undefined) {
    module.exports = {Cons, List, Nil};
}
