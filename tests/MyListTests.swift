@testable import MyList
import XCTest

extension MyList: Equatable where A: Equatable {
    public static func == (lhs: MyList, rhs: MyList) -> Bool {
        lhs.equals(otherList: rhs, compareInner: ==)
    }
}

class MyListTests: XCTestCase {
    // region isEmpty tests
    func test_isEmpty_empty() {
        let list: MyList<Int> = MyList.empty

        XCTAssertEqual(true, list.isEmpty())
    }

    func test_isEmpty_cons() {
        let list = MyList.cons(1, MyList.empty)

        XCTAssertEqual(false, list.isEmpty())
    }

    // endregion

    // region append tests
    func test_append_empty_empty() {
        let list1: MyList<Int> = MyList.empty
        let list2: MyList<Int> = MyList.empty

        XCTAssertEqual(MyList<Int>.empty, list1.append(other: list2))
    }

    func test_append_empty_cons_1() {
        let list1: MyList<Int> = MyList.empty
        let list2 = MyList.cons(1, MyList.empty)

        XCTAssertEqual(MyList.cons(1, MyList.empty), list1.append(other: list2))
    }

    func test_append_empty_cons_2() {
        let list1: MyList<Int> = MyList.empty
        let list2 = MyList.cons(1, MyList.cons(2, MyList.empty))

        XCTAssertEqual(MyList.cons(1, MyList.cons(2, MyList.empty)), list1.append(other: list2))
    }

    func test_append_cons_1_empty() {
        let list1 = MyList.cons(1, MyList.empty)
        let list2: MyList<Int> = MyList.empty

        XCTAssertEqual(MyList.cons(1, MyList.empty), list1.append(other: list2))
    }

    func test_append_cons_2_empty() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
        let list2: MyList<Int> = MyList.empty

        XCTAssertEqual(MyList.cons(1, MyList.cons(2, MyList.empty)), list1.append(other: list2))
    }

    func test_append_cons_1_cons_1() {
        let list1 = MyList.cons(1, MyList.empty)
        let list2 = MyList.cons(2, MyList.empty)

        XCTAssertEqual(MyList.cons(1, MyList.cons(2, MyList.empty)), list1.append(other: list2))
    }

    func test_append_cons_1_cons_2() {
        let list1 = MyList.cons(1, MyList.empty)
        let list2 = MyList.cons(2, MyList.cons(3, MyList.empty))

        XCTAssertEqual(
            MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.empty))),
            list1.append(other: list2)
        )
    }

    func test_append_cons_2_cons_1() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
        let list2 = MyList.cons(3, MyList.empty)

        XCTAssertEqual(
            MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.empty))),
            list1.append(other: list2)
        )
    }

    func test_append_cons_2_cons_2() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
        let list2 = MyList.cons(3, MyList.cons(4, MyList.empty))

        XCTAssertEqual(
            MyList.cons(
                1,
                MyList.cons(2, MyList.cons(3, MyList.cons(4, MyList.empty)))
            ),
            list1.append(other: list2)
        )
    }

    // endregion

    // region length tests
    func test_length_empty() {
        let list1: MyList<Int> = MyList.empty

        XCTAssertEqual(0, list1.length())
    }

    func test_length_cons_1() {
        let list1 = MyList.cons(1, MyList.empty)

        XCTAssertEqual(1, list1.length())
    }

    func test_length_cons_2() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))

        XCTAssertEqual(
            2,
            list1.length()
        )
    }

    func test_length_cons_3() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.empty)))

        XCTAssertEqual(
            3,
            list1.length()
        )
    }

    // endregion

    // region map tests
    func test_map_empty_1() {
        let list1: MyList<Int> = MyList.empty
        let expected: MyList<Int> = MyList.empty

        XCTAssertEqual(
            expected,
            list1.map(mapper: { i in i + 1 })
        )
    }

    func test_map_empty_2() {
        let list1: MyList<Bool> = MyList.empty
        let expected: MyList<Int> = MyList.empty

        XCTAssertEqual(
            expected,
            list1.map(mapper: { _ in 5 })
        )
    }

    func test_map_cons_1_lengths() {
        let list1 = MyList.cons("foo", MyList.empty)

        XCTAssertEqual(
            MyList.cons(3, MyList.empty),
            list1.map(mapper: { s in s.count })
        )
    }

    func test_map_cons_2_lengths() {
        let list1 = MyList.cons("foo", MyList.cons("foobar", MyList.empty))

        XCTAssertEqual(
            MyList.cons(3, MyList.cons(6, MyList.empty)),
            list1.map(mapper: { s in s.count })
        )
    }

    func test_map_cons_3_lengths() {
        let list1 = MyList.cons("foo", MyList.cons("foobar", MyList.cons("apple", MyList.empty)))

        XCTAssertEqual(
            MyList.cons(3, MyList.cons(6, MyList.cons(5, MyList.empty))),
            list1.map(mapper: { s in s.count })
        )
    }

    func test_map_cons_1_strings() {
        let list1 = MyList.cons(1, MyList.empty)

        XCTAssertEqual(
            MyList.cons("1", MyList.empty),
            list1.map(mapper: { i in i.description })
        )
    }

    func test_map_cons_2_strings() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))

        XCTAssertEqual(
            MyList.cons("1", MyList.cons("2", MyList.empty)),
            list1.map(mapper: { i in i.description })
        )
    }

    func test_map_cons_3_strings() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.empty)))

        XCTAssertEqual(
            MyList.cons("1", MyList.cons("2", MyList.cons("3", MyList.empty))),
            list1.map(mapper: { i in i.description })
        )
    }

    // endregion

    // region filter tests
    func test_filter_empty_integers() {
        let list1: MyList<Int> = MyList.empty

        XCTAssertEqual(
            MyList<Int>.empty,
            list1.filter(predicate: { i in i > 5 })
        )
    }

    func test_filter_empty_strings() {
        let list1: MyList<String> = MyList.empty

        XCTAssertEqual(
            MyList<String>.empty,
            list1.filter(predicate: { s in s.count > 3 })
        )
    }

    func test_filter_cons_1_integers() {
        let list1 = MyList.cons(1, MyList.empty)

        XCTAssertEqual(
            MyList<Int>.empty,
            list1.filter(predicate: { i in i > 5 })
        )
    }

    func test_filter_cons_2_integers() {
        let list1 = MyList.cons(1, MyList.cons(6, MyList.empty))

        XCTAssertEqual(
            MyList.cons(6, MyList.empty),
            list1.filter(predicate: { i in i > 5 })
        )
    }

    func test_filter_cons_3_integers() {
        let list1 = MyList.cons(1, MyList.cons(6, MyList.cons(7, MyList.empty)))

        XCTAssertEqual(
            MyList.cons(6, MyList.cons(7, MyList.empty)),
            list1.filter(predicate: { i in i > 5 })
        )
    }

    func test_filter_cons_4_integers() {
        let list1 = MyList.cons(1, MyList.cons(6, MyList.cons(7, MyList.cons(3, MyList.empty))))

        XCTAssertEqual(
            MyList.cons(6, MyList.cons(7, MyList.empty)),
            list1.filter(predicate: { i in i > 5 })
        )
    }

    func test_filter_cons_1_strings() {
        let list1 = MyList.cons("foo", MyList.empty)

        XCTAssertEqual(
            MyList<String>.empty,
            list1.filter(predicate: { s in s.count > 3 })
        )
    }

    func test_filter_cons_2_strings() {
        let list1 = MyList.cons("foo", MyList.cons("foobar", MyList.empty))

        XCTAssertEqual(
            MyList.cons("foobar", MyList.empty),
            list1.filter(predicate: { s in s.count > 3 })
        )
    }

    func test_filter_cons_3_strings() {
        let list1 = MyList.cons("foo", MyList.cons("foobar", MyList.cons("a", MyList.empty)))

        XCTAssertEqual(
            MyList.cons("foobar", MyList.empty),
            list1.filter(predicate: { s in s.count > 3 })
        )
    }

    func test_filter_cons_4_strings() {
        let list1 = MyList.cons(
            "foo",
            MyList.cons("foobar", MyList.cons("a", MyList.cons("apple", MyList.empty)))
        )

        XCTAssertEqual(
            MyList.cons("foobar", MyList.cons("apple", MyList.empty)),
            list1.filter(predicate: { s in s.count > 3 })
        )
    }

    // endregion

    // region toString tests
    func test_toString_empty_integers() {
        let list1: MyList<Int> = MyList.empty

        XCTAssertEqual(
            "[]",
            list1.toString(innerToString: { i in i.description })
        )
    }

    func test_toString_cons_1_integers() {
        let list1 = MyList.cons(1, MyList.empty)

        XCTAssertEqual(
            "[1]",
            list1.toString(innerToString: { i in i.description })
        )
    }

    func test_toString_cons_2_integers() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))

        XCTAssertEqual(
            "[1, 2]",
            list1.toString(innerToString: { i in i.description })
        )
    }

    func test_toString_cons_3_integers() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.empty)))

        XCTAssertEqual(
            "[1, 2, 3]",
            list1.toString(innerToString: { i in i.description })
        )
    }

    func test_toString_empty_strings() {
        let list1: MyList<String> = MyList.empty

        XCTAssertEqual(
            "[]",
            list1.toString(innerToString: { s in s })
        )
    }

    func test_toString_cons_1_strings() {
        let list1 = MyList.cons("foo", MyList.empty)

        XCTAssertEqual(
            "[foo]",
            list1.toString(innerToString: { s in s })
        )
    }

    func test_toString_cons_2_strings() {
        let list1 = MyList.cons("foo", MyList.cons("bar", MyList.empty))

        XCTAssertEqual(
            "[foo, bar]",
            list1.toString(innerToString: { s in s })
        )
    }

    func test_toString_cons_3_strings() {
        let list1 = MyList.cons("foo", MyList.cons("bar", MyList.cons("baz", MyList.empty)))

        XCTAssertEqual(
            "[foo, bar, baz]",
            list1.toString(innerToString: { s in s })
        )
    }

    // endregion

    // region contains tests
    func test_contains_empty_integers() {
        let list1: MyList<Int> = MyList.empty

        XCTAssertEqual(
            false,
            list1.contains(target: 1, compare: ==)
        )
    }

    func test_contains_empty_strings() {
        let list1: MyList<String> = MyList.empty

        XCTAssertEqual(
            false,
            list1.contains(target: "foo", compare: ==)
        )
    }

    func test_contains_cons_1_integers_1() {
        let list1 = MyList.cons(1, MyList.empty)

        XCTAssertEqual(
            false,
            list1.contains(target: 0, compare: ==)
        )
    }

    func test_contains_cons_1_integers_2() {
        let list1 = MyList.cons(1, MyList.empty)

        XCTAssertEqual(
            true,
            list1.contains(target: 1, compare: ==)
        )
    }

    func test_contains_cons_2_integers_1() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))

        XCTAssertEqual(
            false,
            list1.contains(target: 0, compare: ==)
        )
    }

    func test_contains_cons_2_integers_2() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))

        XCTAssertEqual(
            true,
            list1.contains(target: 1, compare: ==)
        )
    }

    func test_contains_cons_2_integers_3() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))

        XCTAssertEqual(
            true,
            list1.contains(target: 2, compare: ==)
        )
    }

    func test_contains_cons_1_strings_1() {
        let list1 = MyList.cons("foo", MyList.empty)

        XCTAssertEqual(
            false,
            list1.contains(target: "blah", compare: ==)
        )
    }

    func test_contains_cons_1_strings_2() {
        let list1 = MyList.cons("foo", MyList.empty)

        XCTAssertEqual(
            true,
            list1.contains(target: "foo", compare: ==)
        )
    }

    func test_contains_cons_2_strings_1() {
        let list1 = MyList.cons("foo", MyList.cons("bar", MyList.empty))

        XCTAssertEqual(
            false,
            list1.contains(target: "blah", compare: ==)
        )
    }

    func test_contains_cons_2_strings_2() {
        let list1 = MyList.cons("foo", MyList.cons("bar", MyList.empty))

        XCTAssertEqual(
            true,
            list1.contains(target: "foo", compare: ==)
        )
    }

    func test_contains_cons_2_strings_3() {
        let list1 = MyList.cons("foo", MyList.cons("bar", MyList.empty))

        XCTAssertEqual(
            true,
            list1.contains(target: "bar", compare: ==)
        )
    }

    // endregion

    // region sum tests
    func test_sum_empty() {
        let list1: MyList<Int> = MyList.empty

        XCTAssertEqual(
            0,
            list1.sum(zero: 0, add: +)
        )
    }

    func test_sum_cons_1() {
        let list1 = MyList.cons(1, MyList.empty)

        XCTAssertEqual(
            1,
            list1.sum(zero: 0, add: +)
        )
    }

    func test_sum_cons_2() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))

        XCTAssertEqual(
            3,
            list1.sum(zero: 0, add: +)
        )
    }

    func test_sum_cons_3() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.cons(3, MyList.empty)))

        XCTAssertEqual(
            6,
            list1.sum(zero: 0, add: +)
        )
    }

    // endregion

    // region equals tests
    func test_equals_empty_lists() {
        let list1: MyList<Int> = MyList.empty
        let list2: MyList<Int> = MyList.empty

        XCTAssertEqual(
            true,
            list1.equals(otherList: list2, compareInner: ==)
        )
    }

    func test_equals_cons_1_are_equal() {
        let list1 = MyList.cons(1, MyList.empty)
        let list2 = MyList.cons(1, MyList.empty)

        XCTAssertEqual(
            true,
            list1.equals(otherList: list2, compareInner: ==)
        )
    }

    func test_equals_cons_1_are_not_equal_different_contents() {
        let list1 = MyList.cons(1, MyList.empty)
        let list2 = MyList.cons(2, MyList.empty)

        XCTAssertEqual(
            false,
            list1.equals(otherList: list2, compareInner: ==)
        )
    }

    func test_equals_cons_1_are_not_equal_different_lengths() {
        let list1 = MyList.cons(1, MyList.empty)
        let list2 = MyList.cons(1, MyList.cons(2, MyList.empty))

        XCTAssertEqual(
            false,
            list1.equals(otherList: list2, compareInner: ==)
        )
    }

    func test_equals_cons_2_are_equal() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
        let list2 = MyList.cons(1, MyList.cons(2, MyList.empty))

        XCTAssertEqual(
            true,
            list1.equals(otherList: list2, compareInner: ==)
        )
    }

    func test_equals_cons_2_are_not_equal_different_contents_1() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
        let list2 = MyList.cons(2, MyList.cons(2, MyList.empty))

        XCTAssertEqual(
            false,
            list1.equals(otherList: list2, compareInner: ==)
        )
    }

    func test_equals_cons_2_are_not_equal_different_contents_2() {
        let list1 = MyList.cons(1, MyList.cons(2, MyList.empty))
        let list2 = MyList.cons(1, MyList.cons(3, MyList.empty))

        XCTAssertEqual(
            false,
            list1.equals(otherList: list2, compareInner: ==)
        )
    }

    // endregion
}
