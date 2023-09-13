using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab3
{
    public class OneDirectionalList<T>
    {

        public Production product = new Production();
        public Developer developer;

        /*private class Node
        {
            public T Value { get; set; }
            public Node Next { get; set; }

            public Node(T value)
            {
                Value = value;
                Next = null;
            }
        }*/

        private Node<T> head;

        public bool isEmpty => head == null;

        public OneDirectionalList()
        {
            product.name = "Some product";
            product.Id = 12345;
            developer = new Developer("developer", 456, "Gurtam");
            head = null;
        }

        public void Add(T item)
        {
            Node<T> newNode = new Node<T>(item);
            if (head == null)
            {
                head = newNode;
            }
            else
            {
                Node<T> current = head;
                while (current.Next != null)
                {
                    current = current.Next;
                }
                current.Next = newNode;
            }
        }

        public Node<T> getHead()
        {
            return head;
        }

        public override string ToString()
        {
            StringBuilder result = new StringBuilder("");
            Node<T> current = head;
            while (current != null)
            {
                result.Append(current.Value);
                result.Append(" ");
                current = current.Next;
            }
            return result.ToString();

        }



        public static OneDirectionalList<T> operator +(OneDirectionalList<T> list1, OneDirectionalList<T> list2)
        {
            OneDirectionalList<T> result = new OneDirectionalList<T>();

            Node<T> current = list1.head;
            while (current != null)
            {
                result.Add(current.Value);
                current = current.Next;
            }

            current = list2.head;
            while (current != null)
            {
                result.Add((T)current.Value);
                current = current.Next;
            }

            return result;
        }

        public static OneDirectionalList<T> operator --(OneDirectionalList<T> list)
        {
            if (list.head != null)
            {
                list.head = list.head.Next;
            }
            return list;
        }

        public static bool operator ==(OneDirectionalList<T> list1, OneDirectionalList<T> list2)
        {
            if (ReferenceEquals(list1, list2))
            {
                return true;
            }
            if (list1 is null || list2 is null)
            {
                return false;
            }

            Node<T> current1 = list1.head;
            Node<T> current2 = list2.head;

            while (current1 != null && current2 != null)
            {
                if (!current1.Value.Equals(current2.Value))
                {
                    return false;
                }
                current1 = current1.Next;
                current2 = current2.Next;
            }

            return current1 == null && current2 == null;
        }

        public static bool operator !=(OneDirectionalList<T> list1, OneDirectionalList<T> list2)
        {
            return !(list1 == list2);
        }

        public static bool operator true(OneDirectionalList<T> list)
        {
            return list.isEmpty;
        }

        public static bool operator false(OneDirectionalList<T> list)
        {
            return !list.isEmpty;

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
