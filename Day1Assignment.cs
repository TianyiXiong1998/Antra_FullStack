using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Day1
{
    //What type would you choose for the following “numbers”? 
    //A person’s telephone number: String(like for USA phone number would start with +1 )
    //A person’s height: float
    //A person’s age: int
    //A person’s gender(Male, Female, Prefer Not To Answer): String
    //A person’s salary: double
    //A book’s ISBN: String
    //A book’s price: double
    //A book’s shipping weight: float
    //A country’s population: int
    //The number of stars in the universe: Long(var)
    //The number of employees in each of the small or medium businesses in the
    //United Kingdom(up to about 50,000 employees per business): int

    //What are the difference between value type and reference type variables? What is boxing and unboxing?

    //A: Value type variables can be assigned directly to a value. They are derived from the class System.valueType.
    //Reference types do not contain the actual data stored in variables, but they do contain references to variables.
    //In other words, they refer to a memory location.

    //BOXING AND UNBOXING: Boxing is the process of converting a value type to the type object or to any interface type implemented by this value type.
    //When the common language runtime (CLR) boxes a value type,
    //it wraps the value inside a System.Object instance and stores it on the managed heap. Unboxing extracts the value type from the object.

    //What is meant by the terms managed resource and unmanaged resource in .NET

    //Managed code is the code which is managed by the CLR(Common Language Runtime) in .NET Framework.
    //Whereas the Unmanaged code is the code which is directly executed by the operating system.

    //Whats the purpose of Garbage Collector in .NET?
    //. NET's garbage collector manages the allocation and release of memory for the application.
    class Program {

        //static void Main(string[] args)
        //{ 
        //    Console.WriteLine("what is your name?");
        //    var name =  Console.ReadLine();
        //    Console.WriteLine("what is your color?");
        //    var color = Console.ReadLine();
        //    Console.WriteLine($"Your hacker name is {color}{name}");
        //}

    }
    
}