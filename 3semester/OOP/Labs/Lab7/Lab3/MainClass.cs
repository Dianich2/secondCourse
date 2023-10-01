using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Lab3
{
    internal class MainClass
    {
        public static void Main(string[] args)
        {

            /*OneDirectionalList<int> list1 = new OneDirectionalList<int>();
            list1.Add(1);
            list1.Add(2);
            list1.Add(3);
            Console.WriteLine(list1.ToString());

            OneDirectionalList<int> list2 = new OneDirectionalList<int>();
            list2.Add(3);
            list2.Add(4);

            int foundItem = list1.FindElementByPredicate(x => x == 2);

            if (foundItem != default(int))
            {
                Console.WriteLine("Founded element: " + foundItem);
            }
            else
            {
                Console.WriteLine("The element wasn't founded");
            }*/

            try {
                OneDirectionalList<Product> list3 = new OneDirectionalList<Product>();
                list3.Add(new Product("Product1", 23.5, 11.5));
                list3.Add(new Product("Product2", 64.1, 2));
                list3.Add(new Product("Product3", 25, 1.6));
                Console.WriteLine(list3.ToString());
                Product pr = list3.FindElementByPredicate(product => product.Price == 23.5);
                if (pr != default(Product))
                {
                    Console.WriteLine("Founded element: " + pr);
                }
                else
                {
                    Console.WriteLine("The element wasn't founded");
                }
                list3.SaveToFile("file.txt");
                list3.LoadFromFile("file.txt");
            }catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                Console.WriteLine("finaly block");
            }
        }

    }
}
