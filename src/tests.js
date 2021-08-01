/* eslint-disable camelcase,eqeqeq,no-prototype-builtins */
const {Cons, List, Nil} = require("./list");

// Do not modify!  When I test your code myself,
// I won't use this code below, so I won't be working
// with any of your modifications!
function runTest(test) {
    process.stdout.write(test.name + ": ");
    try {
        test();
        process.stdout.write("pass\n");
    } catch (error) {
        process.stdout.write("FAIL\n");
        console.log(error);
    }
}

function assertEquals(expected, received) {
    if (expected !== received) {
        throw Error(
            "\tExpected: " +
                expected.toString() +
                "\n" +
                "\tReceived: " +
                received.toString()
        );
    }
}

function test_nil_join() {
    const nil = new Nil();
    assertEquals("[]", nil.join(", "));
}

function test_nil_toString() {
    const nil = new Nil();
    assertEquals("[]", nil.toString());
}

function test_nil_instanceof_list() {
    const nil = new Nil();
    assertEquals(true, nil instanceof List);
}

function test_nil_has_no_head() {
    const nil = new Nil();
    assertEquals(false, nil.hasOwnProperty("head"));
}

function test_nil_has_no_tail() {
    const nil = new Nil();
    assertEquals(false, nil.hasOwnProperty("tail"));
}

function test_nil_isEmpty() {
    const nil = new Nil();
    assertEquals(true, nil.isEmpty());
}

function test_nil_length() {
    const nil = new Nil();
    assertEquals(0, nil.length());
}

function test_nil_filter() {
    const nil = new Nil();
    const f = function (e) {
        return true;
    };
    assertEquals("[]", nil.filter(f).toString());
}

function test_nil_map() {
    const nil = new Nil();
    const increment = function (e) {
        return e + 1;
    };
    assertEquals("[]", nil.map(increment).toString());
}

function test_cons_instanceof_list() {
    const list = new Cons(1, new Nil());
    assertEquals(true, list instanceof List);
}

function test_cons_join_single_element() {
    const list = new Cons(1, new Nil());
    assertEquals("[1]", list.join(":"));
}

function test_cons_join_two_elements() {
    const list = new Cons(1, new Cons(2, new Nil()));
    assertEquals("[1:2]", list.join(":"));
}

function test_cons_join_three_elements() {
    const list = new Cons(1, new Cons(2, new Cons(3, new Nil())));
    assertEquals("[1:2:3]", list.join(":"));
}

function test_cons_toString_single_element() {
    const list = new Cons(1, new Nil());
    assertEquals("[1]", list.toString());
}

function test_cons_toString_two_elements() {
    const list = new Cons(1, new Cons(2, new Nil()));
    assertEquals("[1, 2]", list.toString());
}

function test_cons_toString_three_elements() {
    const list = new Cons(1, new Cons(2, new Cons(3, new Nil())));
    assertEquals("[1, 2, 3]", list.toString());
}

function test_cons_head() {
    const list = new Cons(1, new Nil());
    assertEquals(1, list.head);
}

function test_cons_empty_tail() {
    const list = new Cons(1, new Nil());
    assertEquals("[]", list.tail.toString());
}

function test_cons_nonempty_tail() {
    const list = new Cons(1, new Cons(2, new Nil()));
    assertEquals("[2]", list.tail.toString());
}

function test_cons_isEmpty() {
    const list = new Cons(1, new Nil());
    assertEquals(false, list.isEmpty());
}

function test_cons_length_1() {
    const list = new Cons("a", new Nil());
    assertEquals(1, list.length());
}

function test_cons_length_2() {
    const list = new Cons("a", new Cons("b", new Nil()));
    assertEquals(2, list.length());
}

function test_cons_filter_has_element() {
    const list = new Cons(1, new Nil());
    const isOdd = function (e) {
        return e % 2 == 1;
    };
    assertEquals("[1]", list.filter(isOdd).toString());
}

function test_cons_filter_has_no_element() {
    const list = new Cons(2, new Nil());
    const isOdd = function (e) {
        return e % 2 == 1;
    };
    assertEquals("[]", list.filter(isOdd).toString());
}

function test_cons_filter_multi_1() {
    const list = new Cons(2, new Cons(4, new Nil()));
    const isOdd = function (e) {
        return e % 2 == 1;
    };
    assertEquals("[]", list.filter(isOdd).toString());
}

function test_cons_filter_multi_2() {
    const list = new Cons(2, new Cons(5, new Nil()));
    const isOdd = function (e) {
        return e % 2 == 1;
    };
    assertEquals("[5]", list.filter(isOdd).toString());
}

function test_cons_filter_multi_3() {
    const list = new Cons(3, new Cons(4, new Nil()));
    const isOdd = function (e) {
        return e % 2 == 1;
    };
    assertEquals("[3]", list.filter(isOdd).toString());
}

function test_cons_filter_multi_4() {
    const list = new Cons(3, new Cons(5, new Nil()));
    const isOdd = function (e) {
        return e % 2 == 1;
    };
    assertEquals("[3, 5]", list.filter(isOdd).toString());
}

function test_cons_filter_multi_5() {
    const list = new Cons(
        1,
        new Cons(
            5,
            new Cons(
                2,
                new Cons(6, new Cons(3, new Cons(7, new Cons(4, new Nil()))))
            )
        )
    );
    const f = function (e) {
        return e < 6;
    };
    assertEquals("[1, 5, 2, 3, 4]", list.filter(f).toString());
}

function test_nil_nil_append() {
    const nil1 = new Nil();
    const nil2 = new Nil();
    assertEquals("[]", nil1.append(nil2).toString());
}

function test_cons_map_1() {
    const list = new Cons(1, new Nil());
    const increment = function (e) {
        return e + 1;
    };
    assertEquals("[2]", list.map(increment).toString());
}

function test_cons_map_2() {
    const list = new Cons(1, new Cons(2, new Nil()));
    const increment = function (e) {
        return e + 1;
    };
    assertEquals("[2, 3]", list.map(increment).toString());
}

function test_cons_map_3() {
    const list = new Cons(2, new Cons(5, new Nil()));
    const multBy3 = function (e) {
        return e * 3;
    };
    assertEquals("[6, 15]", list.map(multBy3).toString());
}

function test_cons_map_4() {
    const list = new Cons(
        "alpha",
        new Cons("beta", new Cons("gamma", new Nil()))
    );
    const identity = function (e) {
        return e;
    };
    assertEquals("[alpha, beta, gamma]", list.map(identity).toString());
}

function test_nil_cons_append() {
    const nil = new Nil();
    const list = new Cons(1, new Cons(2, new Nil()));
    assertEquals("[1, 2]", nil.append(list).toString());
}

function test_cons_nil_append() {
    const list = new Cons(1, new Cons(2, new Nil()));
    const nil = new Nil();
    assertEquals("[1, 2]", list.append(nil).toString());
}

function test_cons_cons_append_1() {
    const list1 = new Cons(1, new Cons(2, new Nil()));
    const list2 = new Cons(3, new Cons(4, new Cons(5, new Nil())));
    assertEquals("[1, 2, 3, 4, 5]", list1.append(list2).toString());
}

function test_cons_cons_append_2() {
    const list1 = new Cons(1, new Cons(2, new Nil()));
    const list2 = new Cons(3, new Cons(4, new Cons(5, new Nil())));
    assertEquals("[3, 4, 5, 1, 2]", list2.append(list1).toString());
}

function test_nil_contains() {
    const nil = new Nil();
    assertEquals(false, nil.contains(1));
}

function test_cons_contains_first() {
    const list = new Cons(1, new Cons(2, new Cons(3, new Nil())));
    assertEquals(true, list.contains(1));
}

function test_cons_contains_second() {
    const list = new Cons(1, new Cons(2, new Cons(3, new Nil())));
    assertEquals(true, list.contains(2));
}

function test_cons_contains_nowhere() {
    const list = new Cons(1, new Cons(2, new Cons(3, new Nil())));
    assertEquals(false, list.contains(4));
}

function test_nil_and_cons_have_different_prototypes() {
    const nil = new Nil();
    const cons = new Cons(1, new Nil());
    assertEquals(
        false,
        Object.getPrototypeOf(nil) == Object.getPrototypeOf(cons)
    );
}

function getGrandparent(obj) {
    return Object.getPrototypeOf(Object.getPrototypeOf(obj));
}

function test_nil_and_cons_have_same_grandparent_prototypes() {
    const nil = new Nil();
    const cons = new Cons(1, new Nil());
    assertEquals(getGrandparent(nil), getGrandparent(cons));
}

function test_nil_grandparent_prototype_has_join() {
    const nil = new Nil();
    assertEquals(true, getGrandparent(nil).hasOwnProperty("join"));
}

function test_nil_grandparent_prototype_has_toString() {
    const cons = new Cons(1, new Nil());
    assertEquals(true, getGrandparent(cons).hasOwnProperty("toString"));
}

function test_nil_and_cons_have_different_isEmpty() {
    const nil = new Nil();
    const cons = new Cons(1, new Nil());
    assertEquals(false, nil.isEmpty == cons.isEmpty);
}

function test_nil_and_cons_have_different_append() {
    const nil = new Nil();
    const cons = new Cons(1, new Nil());
    assertEquals(false, nil.append == cons.append);
}

function test_nil_and_cons_have_different_contains() {
    const nil = new Nil();
    const cons = new Cons(1, new Nil());
    assertEquals(false, nil.contains == cons.contains);
}

function test_nil_and_cons_have_different_length() {
    const nil = new Nil();
    const cons = new Cons(1, new Nil());
    assertEquals(false, nil.length == cons.length);
}

function test_nil_and_cons_have_different_filter() {
    const nil = new Nil();
    const cons = new Cons(1, new Nil());
    assertEquals(false, nil.filter == cons.filter);
}

function test_nil_and_cons_have_different_map() {
    const nil = new Nil();
    const cons = new Cons(1, new Nil());
    assertEquals(false, nil.map == cons.map);
}

// eslint-disable-next-line no-unused-vars
function runTests() {
    // ---begin tests for nil---

    // instanceof
    runTest(test_nil_instanceof_list);

    // join
    runTest(test_nil_join);

    // toString
    runTest(test_nil_toString);

    // head
    runTest(test_nil_has_no_head);

    // tail
    runTest(test_nil_has_no_tail);

    // isEmpty
    runTest(test_nil_isEmpty);

    // length
    runTest(test_nil_length);

    // append
    runTest(test_nil_nil_append);
    runTest(test_nil_cons_append);

    // contains
    runTest(test_nil_contains);

    // filter
    runTest(test_nil_filter);

    // map
    runTest(test_nil_map);
    // ---end tests for nil---

    // ---begin tests for cons---

    // join
    runTest(test_cons_join_single_element);
    runTest(test_cons_join_two_elements);
    runTest(test_cons_join_three_elements);

    // toString
    runTest(test_cons_toString_single_element);
    runTest(test_cons_toString_two_elements);
    runTest(test_cons_toString_three_elements);

    // instanceof
    runTest(test_cons_instanceof_list);

    // head
    runTest(test_cons_head);

    // tail
    runTest(test_cons_empty_tail);
    runTest(test_cons_nonempty_tail);

    runTest(test_cons_isEmpty);

    // length
    runTest(test_cons_length_1);
    runTest(test_cons_length_2);

    // append
    runTest(test_cons_nil_append);
    runTest(test_cons_cons_append_1);
    runTest(test_cons_cons_append_2);

    // contains
    runTest(test_cons_contains_first);
    runTest(test_cons_contains_second);
    runTest(test_cons_contains_nowhere);

    // filter
    runTest(test_cons_filter_has_element);
    runTest(test_cons_filter_has_no_element);
    runTest(test_cons_filter_multi_1);
    runTest(test_cons_filter_multi_2);
    runTest(test_cons_filter_multi_3);
    runTest(test_cons_filter_multi_4);
    runTest(test_cons_filter_multi_5);

    // map
    runTest(test_cons_map_1);
    runTest(test_cons_map_2);
    runTest(test_cons_map_3);
    runTest(test_cons_map_4);
    // ---end tests for cons---

    // ---begin tests relating to prototypes---
    runTest(test_nil_and_cons_have_different_prototypes);
    runTest(test_nil_and_cons_have_same_grandparent_prototypes);
    runTest(test_nil_grandparent_prototype_has_join);
    runTest(test_nil_grandparent_prototype_has_toString);
    runTest(test_nil_and_cons_have_different_isEmpty);
    runTest(test_nil_and_cons_have_different_append);
    runTest(test_nil_and_cons_have_different_contains);
    runTest(test_nil_and_cons_have_different_length);
    runTest(test_nil_and_cons_have_different_filter);
    runTest(test_nil_and_cons_have_different_map);
    // ---end tests relating to prototypes---
}

module.exports = {runTests};
