public indirect enum MyList<A> {
    case cons(A, MyList<A>)
    case empty
}

public extension MyList {
    func map<B>(mapper: (A) -> B) -> MyList<B> {
        // Ideally, this should be a method.
        // However, this is needed to bypass some bugs which I'll be filing
        // later.
        return mapFunction(list: self, mapper: mapper)
    }

    private func contentsToString(_ innerToString: (A) -> String) -> String {
        switch self {
            case let .cons(head, .empty): // list containing one element
                return innerToString(head)
            case let .cons(head, tail): // list containing more than one element
                return innerToString(head) + ", " + tail.contentsToString(innerToString)
            case .empty: // empty list
                return ""
        }
    }

    func toString(innerToString: (A) -> String) -> String {
        return "[" + contentsToString(innerToString) + "]"
    }

    func equals(otherList: MyList<A>, compareInner: (A, A) -> Bool) -> Bool {
        switch (self, otherList) {
            case let (.cons(head1, tail1), .cons(head2, tail2)):
                return compareInner(head1, head2)
                    && tail1.equals(otherList: tail2, compareInner: compareInner)
            case (.empty, .empty):
                return true
            case _:
                return false
        }
    }

    func isEmpty() -> Bool {
        switch self {
            case .empty:
                return true
            case _:
                return false
        }
    }

    func append(other: MyList) -> MyList {
        switch self {
            case let .cons(head, tail):
                return .cons(head, tail.append(other: other))
            case .empty:
                return other
        }
    }

    func length() -> Int {
        switch self {
            case let .cons(_, tail):
                return 1 + tail.length()
            case .empty:
                return 0
        }
    }

    func filter(predicate: (A) -> Bool) -> MyList {
        switch self {
            case let .cons(head, tail):
                let filtered = tail.filter(predicate: predicate)
                if predicate(head) {
                    return .cons(head, filtered)
                } else {
                    return filtered
                }
            case .empty:
                return .empty
        }
    }

    func contains(target: A, compare: (A, A) -> Bool) -> Bool {
        switch self {
            case let .cons(head, tail):
                if compare(head, target) {
                    return true
                } else {
                    return tail.contains(target: target, compare: compare)
                }
            case .empty:
                return false
        }
    }

    func sum(zero: A, add: (A, A) -> A) -> A {
        switch self {
            case let .cons(head, tail):
                return add(head, tail.sum(zero: zero, add: add))
            case .empty:
                return zero
        }
    }
}

// This should be a method, but we can't do this because of a bug in
// Swift's typechecker
func mapFunction<A, B>(list: MyList<A>, mapper: (A) -> B) -> MyList<B> {
    switch list {
        case let .cons(head, tail):
            return MyList.cons(mapper(head), mapFunction(list: tail, mapper: mapper))
        case .empty:
            return MyList.empty
    }
}
