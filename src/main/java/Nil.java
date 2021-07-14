public class Nil implements ImmutableList
{
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
    public ImmutableList append(final ImmutableList other)
    {
        return other;
    }

    @Override
    public boolean contains(final int value)
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
