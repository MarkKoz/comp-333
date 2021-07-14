public class Nil implements ImmutableList
{
    public Nil() { }

    public boolean equals(final Object other)
    {
        return other instanceof Nil;
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
