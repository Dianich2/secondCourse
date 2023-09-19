using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4
{
    internal class Watch: Item, ISpoiltable
    {
        private string name;
        private double price;
        private string producer;
        private int shelfLife;

        public Watch(string name, double price, string producer, int shelfLife)
        {
            this.name = name;
            this.price = price;
            this.producer = producer;
            this.shelfLife = shelfLife;
        }

        public override void spoilt()
        {
            Console.WriteLine("spoilt method from watch class. ISpoiltable implementation");

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
        public string getProducer()
        {
            return new string(producer);
        }
        public double getPrice()
        {
            return price;
        }
    }
}
