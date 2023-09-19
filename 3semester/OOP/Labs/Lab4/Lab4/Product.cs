using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4
{
    internal class Product : Item, IEatable, ISpoiltable
    {
        protected string name;
        protected string producer;
        protected double price;
        protected int shelfLife;
        protected bool isGood;
        protected double amount;

        public Product(string name, string producer, double price, int shelfLife)
        {
            this.name = name;
            this.producer = producer;
            this.price = price;
            this.shelfLife = shelfLife;
            this.isGood = true;
            this.amount = 1;
        }

        public override void spoilt()
        {
            Console.WriteLine("spoilt method from Product class. Item override");

            if(shelfLife > 0)
                shelfLife--;
            else
            {
                isGood = false;
            }
        }

        public void eat()
        {
            if (amount > 0 && isGood)
                amount -= 0.5;
            else
                Console.WriteLine("this produc has been eaten");
        }

        void ISpoiltable.spoilt()
        {
            Console.WriteLine("spoilt method from Product class. ISpoiltable implementation");

            if (shelfLife > 0)
                shelfLife--;
            else
            {
                isGood = false;
            }
        }

        public string getName()
        {
            return new string(name);
        }
        public string getProducer()
        {
            return new string(producer);
        }
        public int getShellLife()
        {
            return shelfLife;
        }
        public bool getIsGood()
        {
            return isGood;
        }
        public double getAmount()
        {
            return amount;
        }
        public double getPrice()
        {
            return price;
        }

    }
}
