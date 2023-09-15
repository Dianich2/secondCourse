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
            
            OneDirectionalList<int> list1 = new OneDirectionalList<int>();
            list1.Add(1);
            list1.Add(2);
            list1.Add(3);

            OneDirectionalList<int> list2 = new OneDirectionalList<int>();
            list2.Add(3);
            list2.Add(4);

            OneDirectionalList<int> mergedList = list1 + list2;
            --mergedList;

            OneDirectionalList<int> emptyList = new OneDirectionalList<int>();

            if (emptyList)
            {
                Console.WriteLine("This list is empty");
            }
            if (list1)
            {
                Console.WriteLine("This list isn't empty");
            }

            bool areEqual = list1 == list2;
            bool areNotEqual = list1 != list2;

            Console.WriteLine(StaticOperation.countListSumm(list1));
            Console.WriteLine(StaticOperation.countListElentsAmount(list1));
            Console.WriteLine(StaticOperation.countMaxMinDifference(list1));
            Console.WriteLine(list1);
            list1.deleteElement(2);
            Console.WriteLine(list1);

            string str = "hel4lo wor2938ld!";

            int? number = str.extractLastNubmer(str);
            Console.WriteLine(number);
        }

    }
}
