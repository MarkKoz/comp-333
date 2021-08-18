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
