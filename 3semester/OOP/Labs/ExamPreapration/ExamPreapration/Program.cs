public class Calculator
{
    public int Add(int a, int b)
    {
        return a + b;
    }

    public double Add(double a, double b)
    {
        return a + b;
    }

};

public class Shape
{
    public virtual void Draw()
    {
        Console.WriteLine("Drawing a shape");
    }
}

public class Circle : Shape
{
    public override sealed void Draw()
    {
        Console.WriteLine("Drawing a circle");
    }
}


public abstract class DoSmth
{
    public abstract void Act();
}

public class SubDo : DoSmth
{

    object person = new
    {
        FirstName = "John",
        Age = 30
    };

    public override void Act()
    {
        Console.WriteLine("Something");

    }

    public object CreatePerson()
    {
        return new
        {
            FirstName = "John",
            Age = 30
        };
    }
}

public class MainClass
{
    public static void Main(string[] args)
    {
        Circle circle = new Circle();
        circle.Draw();
    }
}


public class Box<T> where T: class, new()
{
    private T value;

    public void Add(T newValue)
    {
        value = newValue;
    }

    public T GetValue()
    {
        return value;
    }

}


public interface IDrawable
{
    void Draw();
}

public class Circl : IDrawable
{
    public void Draw()
    {
        Console.WriteLine("Drawing");
    }

}



public delegate string MyDelegate(string str1, string str2);

public class DelegateExample
{
    public static void Main2()
    {
        MyDelegate myDel = ConcatStrings;

        UseDelegate(myDel);

    }

    public static string ConcatStrings(string str1, string str2)
    {
        return str1 + str2;
    }

    public static void UseDelegate(MyDelegate myDel)
    {
        string result = myDel("a", "b");
        Console.WriteLine(result);
    }
}

public enum Status
{
    OK = 200,
    BAD_REQUEST = 400,
    FORBIDDEN = 403,
    NOT_FOUND = 404
}

public class MyCustymException : Exception
{
    public MyCustymException(string message) : base()
    {
        
    }
}

public class TryMyException
{
    public void Do()
    {
        throw new MyCustymException("My exception");
        throw new Exception("New exeption");

        object myObject = "Hello World!";

        if(myObject is string)
        {
            Console.WriteLine("Its string");
            string myString = myObject as string;
        }
        else
        {
            Console.WriteLine("its not string");
        }


        string str = "Hello";
        str.DeleterFirstLetter();
    }
}

public static class StringExtentions
{
    public static string DeleterFirstLetter(this string input)
    {
        return input.Substring(1);
    }
}


public class Singleton
{
    private static Singleton instance;

    private Singleton()
    {

    }

    public static Singleton getSingleton()
    {
        if(instance == null)
        {
            return new Singleton();
        }
        return instance;
    }
}

public class Point
{
    public int X { get; set; }
    public int Y { get; set; }

    public Point(int x, int y)
    {
        X = x;
        Y = y;
    }

    public static Point operator +(Point p1, Point p2)
    {
        return new Point(p1.X + p2.X, p1.Y + p2.Y);
    }
}