using System;
namespace Day2
{
    public class Part2
    {
        public Part2()
        {
        }

        

    }

    public abstract class Vehicle
    {
        public abstract void Run();
    }

    public class Car : Vehicle
    {
        public override void Run()
        {
            Console.WriteLine("run like a car");
        }
    }

    public class Benz : Car
    {
        public override void Run()
        {
            Console.WriteLine("run as a benz");
        }

    }

    public class Bird
    {
        public virtual void Fly()
        {
            Console.WriteLine("fly like a bird");
        }
    }

    public class Parrot : Bird
    {
        public override void Fly()
        {
            Console.WriteLine("fly like a parrot");
        }
        public void Eat()
        {
            Console.WriteLine("I like eat worm");
        }
    }


    public interface First_Interface
    {
        void Myfunc1();
    }

    public interface Second_Interface
    {
        void Myfunc2();
    }

    public class Imple_interface:First_Interface,Second_Interface
    {
        public void Myfunc1()
        {
            Console.WriteLine("I am implementing the first function");
        }

        public void Myfunc2()
        {
            Console.WriteLine("I am implementing the second function");
        }
    }


    public class Person
    {
        private string _name;
        public string Name
        {
            get
            {
                return _name;

            }

            set
            {
                _name = value;
            }
        }

    }
}

