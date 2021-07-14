public interface ImmutableList {
    boolean equals(final Object other);

    int length();

    int sum(); // empty list sum is defined as 0

    ImmutableList append(final ImmutableList other);

    boolean contains(final int value);

    String toString();

    int hashCode();
}
