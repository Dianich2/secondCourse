using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4
{
    internal class MainClass
    {
        public static void Main(string[] args)
        {
            Item item1 = new Confection("confecition1", "producer1", 25.5, 2, 11.1);
            item1.spoilt();

            Confection confection2 = new Confection("confection2", "someProducer", 36.2, 3, 15.2);
            confection2.spoilt();
            ((ISpoiltable)confection2).spoilt();

            IEatable confection3 = new Confection("confectio3", "someProducer", 34.6, 1, 11.1);
            confection3.eat();


            Item[] items = { item1, confection2 };
            Printer printer = new Printer();
            foreach (var item in items)
            {
                Console.Write("Тип объекта: ");
                printer.IAmPrinting(item);
            }
        }
    }
}
