using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//1. What are the six combinations of access modifier keywords and what do they do?
//Public. Objects that implement public access modifiers are accessible from everywhere in a project without any restrictions.
//Private. Objects that implement private access modifier are accessible only inside a class or a structure. 
//Protected. The protected keyword implies that the object is accessible inside the class and in all classes that derive from that class
//Internal. For Internal keyword, the access is limited exclusively to classes defined within the current project assembly.
//Protected Internal. The protected internal access modifier is a combination of protected and internal. As a result, we can access the protected internal member only in the same assembly or in a derived class in other assemblies.
//Private Protected. The private protected access modifier is a combination of the private and protected keywords. We can access members inside the containing class or in a class that derives from a containing class, but only in the same assembly(project).
//2.
//What is the difference between the static, const, and readonly keywords when applied to a type member?
//Constant fields or local variables must be assigned a value at the time of declaration and after that, they cannot be modified. By default constant are static, hence you cannot define a constant type as static.
//A readonly field can be initialized either at the time of declaration or within the constructor of the same class. Therefore, readonly fields can be used for run-time constants.
// The static keyword is used to specify a static member, which means static members are common to all the objects and they do not tie to a specific object. This keyword can be used with classes, fields, methods, properties, operators, events, and constructors, but it cannot be used with indexers, destructors, or types other than classes.

//3. What does a constructor do?
//constructor can do something like initialize function or assign value to an object.

//4 Why is the partial keyword useful?
//The partial keyword indicates that other parts of the class, struct, or interface can be defined in the namespace, when we need to operate with other coders, partial class can improve the coding efficiency.
//5.What is a tuple ?
//The word Tuple means “a data structure which consists of the multiple parts”
//6  What does the C# record keyword do?
//  define a reference type that provides built-in functionality for encapsulating data.

//7.What does overloading and overriding mean?
//Overloading occurs when two or more methods in one class have the same method name but different parameters. Overriding occurs when two methods have the same method name and parameters.

//8. What is the difference between a field and a property?
//The key difference between field and property in C# is that a field is a variable of any type that is declared directly in the class while property is a member that provides a flexible mechanism to read, write or compute the value of a private field.
//9.How do you make a method parameter optional?
//We can make a parameter optional by assigning default values for that parameter
//10.What is an interface and how is it different from abstract class?
//An interface only allows you to define functionality, not implement it.
//11.What accessibility level are members of an interface?
//Interface members implicitly have public declared accessibility.
// 12.Polymorphism allows derived classes to provide different implementations
//of the same method.
//T
//13.True/False. The override keyword is used to indicate that a method in a derived class is
//providing its own implementation of a method.
//T
//14. True/False. The new keyword is used to indicate that a method in a derived class is
//providing its own implementation of a method.
//T
//15. True/False. Abstract methods can be used in a normal (non-abstract) class. F
//16 16.True / False.Normal(non -abstract) methods can be used in an abstract class.  T
//17. True/False.Derived classes can override methods that were virtual in the base class. T
//18. True/False. Derived classes can override methods that were abstract in the base class. T
//19.True/False. In a derived class, you can override a method that was neither virtual non abstract in the base class. F
//20. True/False. A class that implements an interface does not have to provide an implementation for all of the members of the interface. F
//21.True / False.A class that implements an interface is allowed to have other members that aren’t defined in the interface. T
//22.True / False.A class can have more than one base class. T
//23.True / False.A class can implement more than one interface T



namespace Day2
{
    public class Program
    {
        public Program()
        {
            
        }

        public static void Main(string[] args)
        {
            Program program = new Program();
            //-------Task1: reverse Array
            //Task1 task = new Task1();
            //new Task1(task);

            //-------Task2: 
            //Task2 task2 = new Task2();
            //new Task2(task2);

            //-----Task in Part2.cs
            Console.WriteLine("using abstract class to test upper casting and transitive inheritence.");
            Vehicle car =  new Car();//Upper casting
            car.Run();
            Car benz = new Benz();
            benz.Run();
            Console.WriteLine("using virtual class to test upper casting and down casting");
            Bird bird = new Bird(); //Access to parent instance
            bird.Fly();//Parent's fly
            Bird parrot = new Parrot();
            parrot.Fly(); // use child fly
            Parrot parrot1 = (Parrot)parrot;
            parrot1.Eat();//Can access to eat(down casting)

            Console.WriteLine("using interface to test multiple inheritence");

            First_Interface first_Interface =  new Imple_interface();
            Second_Interface second_Interface = new Imple_interface();
            first_Interface.Myfunc1();
            second_Interface.Myfunc2();

            Console.WriteLine("using encapsulation to test property and field");
            Person person = new Person();
            string name =  person.Name = "Tianyi";
            Console.WriteLine(name);
            
        }

        

    }

    public class Task1
    {
        public List<int> GenerateNumbers(int k)
        {
            List<int> numbers = new List<int>();
            for (int i = 1; i <= k; i++)
            {
                numbers.Add(i);
            }
            return numbers;
        }

        public void Print_Numbers(List<int> numbers)
        {
            foreach (var single in numbers)
            {
                Console.WriteLine(single);
            }
        }
        public Task1()
        {
            
        }
        public Task1(Task1 task1)
        {
            task1 = new Task1();
            List<int> numbers = task1.GenerateNumbers(20);
            numbers.Reverse();
            task1.Print_Numbers(numbers);
        }

    }

    public class Task2
    {
        public Task2()
        {

        }

        public Task2(Task2 task2)
        {
            task2 = new Task2();

            Console.WriteLine("enter a number to locate the value in Fib sequence");
            int a = int.Parse(Console.ReadLine());
            Console.WriteLine(task2.Fib(a));
        }

        long Fib(int num)
        {

            if (num < 3)
            {
                return 1;
            }
            else
            {
                return Fib(num - 1) + Fib(num - 2);
            }
        }




    }

    
}