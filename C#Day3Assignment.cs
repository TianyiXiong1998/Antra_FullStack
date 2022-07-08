using System;
using System.Collections.Generic;
using System.Data.Linq;
//Q1.Describe the problem generics address
//Generics allow you to define type-safe data structures, without committing to actual data types. This results in a significant performance boost and higher quality code, because you get to reuse data processing algorithms without duplicating type-specific code.

//Q2 How would you create a list of strings, using the generic List class?
//var List_str = new List<String>();

//Q3 How many generic type parameters does the Dictionary class have?
//2 types, T key and T value

//Q4. True/False. When a generic class has multiple type parameters, they must all match. T

//Q5 What method is used to add items to a List object?
//List<T>().add();

//Q6 Name two methods that cause items to be removed from a List.
//List<T>.Remove(),RemoveAt(),RemoveAll()

//Q7 How do you indicate that a class has a generic type parameter?
//TypeName<T> and T is a type of parameter

//Q8True/False. Generic classes can only have one generic type parameter. N 

//Q9.True / False.Generic type constraints limit what can be used for the generic type. T
//Q10. True/False. Constraints let you use the methods of the thing you are constraining to. T

namespace Day3
{

    public class Day3_class
    {

        public static void Main(String[] args)
    {

            MyStack<string> mystack = new MyStack<string>();
            mystack.Push("hello");
            mystack.Push("world");
            var res = mystack.Count;
            Console.WriteLine(res);
            mystack.Pop();
            res = mystack.Count;
            Console.WriteLine(res);
    }

    }
    //1. Create a custom Stack class MyStack<T> that can be used with any data type which
    //has following methods
    //1. int Count()
    //2. T Pop()
    //3. Void Push()
    //Actually can just inherit from Stack<T> hahahahha
    public class MyStack<T>
    {
        private T t;
        private int p_index;
        private List<T> list;
        public MyStack()
        {
            
            list = new List<T>();
            p_index = -1;
        }

        public int Count
        {
            get { return list.Count(); }
        }

        public void Push(T element)
        {
            list.Add(element);
            p_index++;
        }

        public T Pop()
        {
            T item = list[p_index];
            list.RemoveAt(p_index);
            p_index--;
            return item;
        }



    }

    //Create a Generic List data structure MyList<T> that can store any data type.
    //Implement the following methods.
    //1. void Add (T element)
    //2. T Remove (int index)
    //3. bool Contains (T element)
    //4. void Clear ()
    //5. void InsertAt (T element, int index)
    //6. void DeleteAt (int index)
    //7. T Find (int index)
    public class IList<T>
    {
        private const int DEFAULT_CAPACITY = 4;
        private const int MAX_ARR_LENGTH = 20;

        private T[] mItems;
        private int mSize;
        private T[] mEmptyList = new T[0];

        public IList(int capacity)
        {
            if (capacity < 0 || capacity > MAX_ARR_LENGTH)
            {
                throw new IndexOutOfRangeException();
            }

            if (capacity == 0)
            {
                mItems = mEmptyList;
            }
            else {
                mItems = new T[capacity];
            }
        }
        public void Clear()
        {
            if (mSize > 0)
            {
                
                for (int i = 0; i < mSize; i++)
                {
                    mItems[i] = default(T);
                }
                mSize = 0;
            }
        }


        public int Capacity
        {
            get
            {
                return mItems.Length;
            }
            set
            {
                if (value < mSize)
                {
                    throw new IndexOutOfRangeException();
                }

                if (value != mItems.Length)
                {
                    if (value > 0)
                    {
                        T[] newItems = new T[value];
                        if (mSize > 0)
                        {
                            Copy(ref mItems, 0, ref newItems, 0, mSize);
                        }
                        mItems = newItems;
                    }
                    else
                    {
                        mItems = mEmptyList;
                    }
                }
            }
        }


        private void Copy(ref T[] sourceArray, int sourceIndex, ref T[] destinationArray, int destinationIndex, int length)
        {
            if (sourceIndex >= destinationIndex)
            {
                while (length > 0)
                {
                    destinationArray[destinationIndex] = sourceArray[sourceIndex];
                    length--;
                    sourceIndex++;
                    destinationIndex++;
                }
            }
            else
            {
                int lastIndex = sourceIndex + length - 1;
                int otherLastIndex = destinationIndex + length - 1;
                while (length > 0)
                {
                    destinationArray[otherLastIndex] = sourceArray[lastIndex];
                    length--;
                    lastIndex--;
                    otherLastIndex--;
                }
            }
        }




        private void Larger_Capacity(int size)
        {
            int current_len = mItems.Length;
            if (current_len < size)
            {
                int newCapacity = current_len == 0 ? DEFAULT_CAPACITY : current_len * 2;
                if (newCapacity > MAX_ARR_LENGTH)
                {
                    newCapacity = MAX_ARR_LENGTH;
                }
                if (newCapacity < size)
                {
                    newCapacity = size;
                }
                

            }
        }

        public void Add(T value)
        {
            if (mSize == mItems.Length)
            {
                Larger_Capacity(mSize + 1);

            }
            mItems[mSize] = value;
            mSize++;

        }

        public void DeleteAt(int index)
        {
            if (index >= mSize || index < 0)
            {
                throw new IndexOutOfRangeException();
            }
            mSize--;
            
            Copy(ref mItems, index + 1, ref mItems, index, mSize - index);
            
            mItems[mSize] = default(T);
        }

        public bool Remove(T value)
        {
            int index = IndexOf(value);
            if (index >= 0)
            {
                DeleteAt(index);
                return true;
            }
            return false;
        }


        private bool Equal(Object obj1, Object obj2)
        {
            return obj1 == obj2;
        }


        private bool Contain(T value, out int index)
        {
            index = 0;
            if (value != null)
            {
                
                for (int i = 0; i < mSize; i++)
                {
                    
                    if (Equal(mItems[i], value))
                    {
                        index = i;
                        return true;
                    }
                }
            }
            return false;
        }



        public bool Contains(T value)
        {
            int index;
            return Contain(value, out index);
        }

        public int IndexOf(T value)
        {
            
            int index;
            if (Contain(value, out index))
            {
                return index;
            }
            return -1;
        }


        public void InsertAt(int index, T value)
        {
            if (index >= mSize || index < 0)
            {
                throw new IndexOutOfRangeException();
            }
            if (mSize == mItems.Length)
            {
                Larger_Capacity(mSize + 1);
            }

            Copy(ref mItems, index, ref mItems, index + 1, mSize - index);
            mItems[index] = value;
            mSize++;
        }




    }


    //Implement a GenericRepository<T> class that implements IRepository<T> interface
    //that will have common /CRUD/ operations so that it can work with any data source
    //such as SQL Server, Oracle, In-Memory Data etc.Make sure you have a type constraint
    //on T were it should be of reference type and can be of type Entity which has one
    //property called Id.IRepository<T> should have following methods
    //1. void Add(T item)
    //2. void Remove(T item)
    //3. Void Save()
    //4. IEnumerable<T> GetAll()
    //5. T GetById(int id)
    public interface IGenericRepository<T> where T : class
    {
        T GetById(int id);
        IEnumerable<T> GetAll();
        void Add(T item);
        
        void Remove(T entity);

    }


    public class GenericRepository<T> : IGenericRepository<T> where T : class
    {
        public DataContext context;
        public GenericRepository(DataContext context)
        {
            this.context = context; 
        }
        public void Add(T item)
        {
            context.GetTable<T>().InsertOnSubmit(item);
        }

        public IEnumerable<T> GetAll()
        {
            return context.GetTable<T>().ToList();
        }

        public T GetById(int id)
        {
            var item = from c in context.GetTable<T>()
                       where c.id == id
                       select c;
            return item;
        }

        public void Remove(T entity)
        {
            context.GetTable<T>().DeleteOnSubmit(entity);
        }
    }



}
