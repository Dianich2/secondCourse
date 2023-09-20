using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4_5
{
    internal class MainClass
    {
        public static void Main(string[] args)
        {
            Product confection1 = new Confection("confection1", 11, 2, 1.4);
            Product cake1 = new Cake("Chocolate", 4, 1.7, 0.5, CakeTypes.Chocolate);
            Candy candy1 = new Candy("candy1", 2, 0.1, 3);

            Item[] items = { confection1, cake1, candy1 };
            Printer printer = new Printer();
            foreach (var item in items)
            {
                Console.Write("Тип объекта: ");
                printer.IAmPrinting(item);
            }

            Gift gift = new Gift();
            gift.add(confection1);
            gift.add(cake1);
            gift.add(candy1);

            GiftController giftcontroller = new GiftController(gift);
            Console.WriteLine(giftcontroller.CountPrice());
            Console.WriteLine(giftcontroller.GetLowestWeightItem().ToString());
            Console.WriteLine();
            gift.writeList();
            giftcontroller.sortGift();
            Console.WriteLine();
            gift.writeList();
        }
    }
}
