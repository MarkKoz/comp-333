public class Nil implements ImmutableList
{
    public Nil() { }

    public boolean equals(final Object other)
    {
        return other instanceof Nil;
    }

    @Override
    public int length()
    {
        return 0;
    }

    @Override
    public int sum()
    {
        return 0;
    }

    @Override
    public ImmutableList append(ImmutableList other)
    {
        return other;
    }

    @Override
    public boolean contains(int value)
    {
        return false;
    }

    public String toString()
    {
        return "Nil";
    }

    public int hashCode()
    {
        return 0;
    }
}
