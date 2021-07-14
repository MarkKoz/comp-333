public class Cons implements ImmutableList
{
    public final int head;
    public final ImmutableList tail;

    public Cons(final int head, final ImmutableList tail)
    {
        this.head = head;
        this.tail = tail;
    }

    public boolean equals(final Object other)
    {
        if (other instanceof Cons) {
            final Cons otherCons = (Cons) other;
            return head == otherCons.head && tail.equals(otherCons.tail);
        } else {
            return false;
        }
    }

    @Override
    public int length()
    {
        return 1 + tail.length();
    }

    @Override
    public int sum()
    {
        return head + tail.sum();
    }

    @Override
    public ImmutableList append(ImmutableList other)
    {
        return null;
    }

    @Override
    public boolean contains(int value)
    {
        return false;
    }

    public String toString()
    {
        return "Cons(" + head + ", " + tail.toString() + ")";
    }

    public int hashCode()
    {
        return sum();
    }
}
