using System;
using System.Collections;
using System.Numerics;
namespace Day1
{
    public class Understanding_types
    {
        static void Main(string[] args)
        {
            Understanding_types understanding_Types = new Understanding_types();
            //understanding_Types.data_size();
            //understanding_Types.data_time(5);

            var stringlist = new string[] { "1", "2" };
            MyIEnumerable test = new MyIEnumerable(stringlist);
            var tst = test.GetEnumerator();
            while (tst.MoveNext())
            {
                Console.WriteLine(tst.Current);
            }

            Console.WriteLine("please enter the number you want to try");
            int a = int.Parse(Console.ReadLine());

            understanding_Types.guess_num(a);

            
        }

        public void guess_num(int a)
        {
            var correct_num = 2;
            if (a < correct_num)
            {
                Console.WriteLine("low");
            }
            if (a > correct_num)
            {
                Console.WriteLine("High");

            }
            if(a == correct_num) {
                Console.WriteLine("correct");
            }

        }

        public void data_size()
        {   
            Console.WriteLine(sizeof(sbyte));
            Console.WriteLine(sizeof(byte));
            Console.WriteLine(sizeof(short));
            Console.WriteLine(sizeof(ushort));
            Console.WriteLine(sizeof(int));
            Console.WriteLine(sizeof(uint));
            Console.WriteLine(sizeof(long));
            Console.WriteLine(sizeof(ulong));
            Console.WriteLine(sizeof(float));
            Console.WriteLine(sizeof(double));
            Console.WriteLine(sizeof(decimal));
        }

        //Write program to enter an integer number of centuries and convert it to years, days, hours,
        //minutes, seconds, milliseconds, microseconds, nanoseconds.Use an appropriate data
        //type for every data conversion.Beware of overflows
        public void data_time(int unit_time)
        {
            string n = "3155673600000000000";
            BigInteger bigInteger = BigInteger.Parse(n);
            Console.WriteLine($"{unit_time}centuries = {100* unit_time} years = {36524 * unit_time} days = {876567*unit_time} hours = {52594560*unit_time} minutes" +
                $"= {3155673600 * unit_time} seconds = {3155673600000 * unit_time} milliseconds = {3155673600000000 * unit_time} microseconds = { bigInteger * unit_time} nanoseconds ");

            
        }

     
        

        public string FizzBuzzies()
        {
            string res = "/";

            for (int i = 0; i <= 100; i++)
            {
                if (i % 3 == 0)
                {
                    res = "/fizz/";
                }
                if (i % 5 == 0)
                {
                    res = "/buzzies/";
                }

                if (i % 3 == 0 && i % 5 == 0)
                {
                    res = "/fizzbuzzies/";
                }

            }
            return res;
        }

    }
}

public class MyIEnumerable
{
    public string[] testResults;

    public MyIEnumerable(string[] a)
    {
        this.testResults = a;
    }

    public IEnumerator GetEnumerator()
    {
        for (int i = 0; i < testResults.Length; i++)
        {
            yield return testResults[i];
        }
    }
}


//1. What happens when you divide an int variable by 0?
//A: Error CS0020: Division by constant zero (CS0020) (Day1)

//2.What happens when you divide a double variable by 0?
//A: positive infinite.

//3. What happens when you overflow an int variable, that is, set it to a value beyond its range?
//A:it will be set to -2,147,483,648

//4. What is the difference between x = y++; and x = ++y;?
//A: x = y++ means for y will assign its' value then auto-increasement. ++y means first auto-increasement then assign.

//5.What is the difference between break, continue, and return when used inside a loop
//statement?
//A: break: break will exit this loop and then go for next loop, continue: The continue statement terminates execution of the statements
//in the current iteration of the current or labeled loop, and continues execution of the loop with the next iteration. return: save the value and return it, exit all loop.

//6. What are the three parts of a for statement and which of them are required?
//for loop: Initialization, Condition and Update, Initialization and update can be elliptical.
//for function: Access modifier, type of return value, and function name(Access modifier sometimes can be elliptical)

//7. What is the difference between the = and == operators?
// = means assigning value, == means equal.

//8. Does the following statement compile? for ( ; true; ) ;
//yes

//9.What does the underscore _ represent in a switch expression?
//The underscore (_) character replaces the default keyword to signify that it should match anything if reached.
//10. What interface must an object implement to be enumerated over by using the foreach statement? Practice loops and operators
// IEnumerable, Look at Main func.



