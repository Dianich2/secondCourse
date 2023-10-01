using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Lab3
{
    public class OneDirectionalList<T> : IListInrerfase<T> where T : Item
    {

        public Production product = new Production();
        public Developer developer;

        List<T> mylist;
        
        public OneDirectionalList()
        {
            product.name = "Some product";
            product.Id = 12345;
            developer = new Developer("developer", 456, "Gurtam");
            mylist = new List<T>();
        }

        public void Add(T item)
        {
            if(item == null) 
                throw new ArgumentNullException();
            mylist.Add(item);
        }

        public void Remove(T item)
        {
            if (item == null)
                throw new ArgumentNullException();
            mylist.Remove(item);
        }

        public T GetElementAt(int index)
        {
            if (index < 0 || index > mylist.Count)
                throw new IndexOutOfRangeException();
            return mylist[index];
        }

        public T FindElementByPredicate(Func<T, bool> predicate)
        {
            foreach(T item in mylist)
            {
                if (predicate(item))
                {
                    return item;
                }
            }
            return default(T);
        }

        public override string ToString()
        {
            StringBuilder str = new StringBuilder("List:\n");
            foreach (T item in mylist)
            {
                str.Append(item.ToString());
                str.Append('\n');
            }
            return str.ToString();

        }

        public void SaveToFile(string filePath)
        {
            using (StreamWriter writer = new StreamWriter(filePath))
            {
                foreach (T item in mylist)
                {
                    writer.WriteLine(item.ToString());
                }
            }
        }

        public void LoadFromFile(string filePath)
        {
            OneDirectionalList<T> list = new OneDirectionalList<T>();
            if (File.Exists(filePath))
            {
                using (StreamReader reader = new StreamReader(filePath))
                {
                    string line;
                    Console.WriteLine("\nElements from the file:");
                    while((line = reader.ReadLine()) != null)
                    {
                        Console.WriteLine(line);
                    }
                }
            }
        }

        public class Production
        {
            public int Id;
            public string name;
        }

        public class Developer
        {
            public string fio;
            public int id;
            public string department;

            public Developer(string fio, int id, string department)
            {
                this.fio = fio;
                this.id = id;
                this.department = department;
            }
        }
    }
}
