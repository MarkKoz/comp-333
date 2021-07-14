import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class ImmutableListTest
{
    // region Equals tests
    @Test
    public void equalsNilNil()
    {
        assertTrue(new Nil().equals(new Nil()));
    }

    @Test
    public void equalsNilCons()
    {
        assertFalse(new Nil().equals(new Cons(1, new Nil())));
    }

    @Test
    public void equalsConsNil()
    {
        assertFalse(new Cons(1, new Nil()).equals(new Nil()));
    }

    @Test
    public void equalsConsConsSameElementsLength1()
    {
        assertTrue(new Cons(1, new Nil()).equals(new Cons(1, new Nil())));
    }

    @Test
    public void equalsConsConsDifferentElementsLength1()
    {
        assertFalse(new Cons(1, new Nil()).equals(new Cons(2, new Nil())));
    }

    @Test
    public void equalsConsConsSameElementsLength2()
    {
        final ImmutableList first = new Cons(1, new Cons(2, new Nil()));
        final ImmutableList second = new Cons(1, new Cons(2, new Nil()));
        assertTrue(first.equals(second));
    }

    @Test
    public void equalsConsConsDifferentElementsLength2_1()
    {
        final ImmutableList first = new Cons(1, new Cons(2, new Nil()));
        final ImmutableList second = new Cons(1, new Cons(3, new Nil()));
        assertFalse(first.equals(second));
    }

    @Test
    public void equalsConsConsDifferentElementsLength2_2()
    {
        final ImmutableList first = new Cons(1, new Cons(2, new Nil()));
        final ImmutableList second = new Cons(2, new Cons(1, new Nil()));
        assertFalse(first.equals(second));
    }

    @Test
    public void equalsConsConsDifferentElementsLength2_3()
    {
        final ImmutableList first = new Cons(1, new Cons(2, new Nil()));
        final ImmutableList second = new Cons(3, new Cons(4, new Nil()));
        assertFalse(first.equals(second));
    }
    // endregion

    // region length tests
    @Test
    public void lengthLength0()
    {
        assertEquals(0, new Nil().length());
    }

    @Test
    public void lengthLength1()
    {
        assertEquals(1, new Cons(-80, new Nil()).length());
    }

    @Test
    public void lengthLength2()
    {
        assertEquals(2, new Cons(-12, new Cons(5, new Nil())).length());
    }

    @Test
    public void lengthLength3()
    {
        final ImmutableList list = new Cons(-4, new Cons(87, new Cons(0, new Nil())));
        assertEquals(3, list.length());
    }
    // endregion

    // region sum tests
    @Test
    public void sumLength0()
    {
        assertEquals(0, new Nil().sum());
    }

    @Test
    public void sumLength1()
    {
        assertEquals(5, new Cons(5, new Nil()).sum());
    }

    @Test
    public void sumLength2()
    {
        assertEquals(3, new Cons(-1, new Cons(4, new Nil())).sum());
    }

    @Test
    public void sumLength3()
    {
        assertEquals(12, new Cons(6, new Cons(0, new Cons(6, new Nil()))).sum());
    }
    // endregion

    // region contains tests
    @Test
    public void appendNilNil()
    {
        final ImmutableList first = new Nil();
        final ImmutableList second = new Nil();
        final ImmutableList expected = new Nil();
        assertEquals(expected, first.append(second));
    }

    @Test
    public void appendConsNil()
    {
        final ImmutableList first = new Cons(0, new Nil());
        final ImmutableList second = new Nil();
        final ImmutableList expected = new Cons(0, new Nil());
        assertEquals(expected, first.append(second));
    }

    @Test
    public void appendNilCons()
    {
        final ImmutableList first = new Nil();
        final ImmutableList second = new Cons(1, new Nil());
        final ImmutableList expected = new Cons(1, new Nil());
        assertEquals(expected, first.append(second));
    }

    @Test
    public void appendConsConsSameLength_1()
    {
        final ImmutableList first = new Cons(1, new Nil());
        final ImmutableList second = new Cons(2, new Nil());
        final ImmutableList expected = new Cons(1, new Cons(2, new Nil()));
        assertEquals(expected, first.append(second));
    }

    @Test
    public void appendConsConsSameLength_2()
    {
        final ImmutableList first = new Cons(2, new Nil());
        final ImmutableList second = new Cons(1, new Nil());
        final ImmutableList expected = new Cons(2, new Cons(1, new Nil()));
        assertEquals(expected, first.append(second));
    }

    @Test
    public void appendConsConsDifferentLength_1()
    {
        final ImmutableList first = new Cons(1, new Cons(2, new Cons(1, new Nil())));
        final ImmutableList second = new Cons(-1, new Cons(1, new Nil()));
        final ImmutableList expected =
            new Cons(1, new Cons(2, new Cons(1, new Cons(-1, new Cons(1, new Nil())))));
        assertEquals(expected, first.append(second));
    }

    @Test
    public void appendConsConsDifferentLength_2()
    {
        final ImmutableList first = new Cons(2, new Cons(1, new Nil()));
        final ImmutableList second = new Cons(-1, new Cons(-2, new Cons(-3, new Nil())));
        final ImmutableList expected =
            new Cons(2, new Cons(1, new Cons(-1, new Cons(-2, new Cons(-3, new Nil())))));
        assertEquals(expected, first.append(second));
    }

    @Test
    public void appendConsConsDifferentLength_3()
    {
        final ImmutableList first = new Cons(0, new Nil());
        final ImmutableList second = new Cons(1, new Cons(2, new Nil()));
        final ImmutableList expected = new Cons(0, new Cons(1, new Cons(2, new Nil())));
        assertEquals(expected, first.append(second));
    }

    @Test
    public void appendConsConsDifferentLength_4()
    {
        final ImmutableList first = new Cons(1, new Cons(2, new Nil()));
        final ImmutableList second = new Cons(3, new Nil());
        final ImmutableList expected = new Cons(1, new Cons(2, new Cons(3, new Nil())));
        assertEquals(expected, first.append(second));
    }
    // endregion

    // region Contains tests
    @Test
    public void containsNil()
    {
        assertFalse(new Nil().contains(5));
    }

    @Test
    public void containsFirstElement()
    {
        assertTrue(new Cons(1, new Nil()).contains(1));
    }

    @Test
    public void containsSecondElement()
    {
        assertTrue(new Cons(1, new Cons(-3, new Nil())).contains(-3));
    }

    @Test
    public void containsThirdElement()
    {
        assertTrue(new Cons(0, new Cons(1, new Cons(2, new Nil()))).contains(2));
    }

    @Test
    public void doesNotContain()
    {
        assertFalse(new Cons(0, new Cons(-1, new Cons(1, new Nil()))).contains(3));
    }
    // endregion

    // region toString tests
    @Test
    public void toStringNil()
    {
        assertEquals("Nil", new Nil().toString());
    }

    @Test
    public void toStringLength1()
    {
        assertEquals("Cons(1, Nil)", new Cons(1, new Nil()).toString());
    }

    @Test
    public void toStringLength2()
    {
        final ImmutableList list = new Cons(1, new Cons(2, new Nil()));
        assertEquals("Cons(1, Cons(2, Nil))", list.toString());
    }

    @Test
    public void toStringLength3()
    {
        final ImmutableList list = new Cons(-1, new Cons(-2, new Cons(3, new Nil())));
        assertEquals("Cons(-1, Cons(-2, Cons(3, Nil)))", list.toString());
    }

    @Test
    public void toStringLength4()
    {
        final ImmutableList list = new Cons(0, new Cons(1, new Cons(2, new Cons(3, new Nil()))));
        assertEquals("Cons(0, Cons(1, Cons(2, Cons(3, Nil))))", list.toString());
    }
    // endregion
}
