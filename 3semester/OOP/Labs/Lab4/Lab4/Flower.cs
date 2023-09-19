using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4
{
    internal class Flower:Item, ISpoiltable
    {
        private string name;
        private double price;
        private int shelfLife;

        public Flower(string name, double price, int shelfLife)
        {
            this.name = name;
            this.price = price;
            this.shelfLife = shelfLife;
        }

        public override void spoilt()
        {
            Console.WriteLine("spoilt method from flower class. ISpoiltable implementation");

            if (shelfLife > 0)
                shelfLife--;
            else
            {
                Console.WriteLine("The flower is spoilted");
            }
        }

        public string getName()
        {
            return new string(name);
        }
        public int getShellLife()
        {
            return shelfLife;
        }
        public double getPrice()
        {
            return price;
        }
    }
}
