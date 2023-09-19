using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace Lab4
{
    internal class Confection:Product, ISpoiltable, IEatable
    {
        protected double sugarContent;

        public Confection(string name, string producer, double price, int shelfFile, double sugarContent) : base(name, producer, price, shelfFile)
        {
            this.sugarContent = sugarContent;
        }

        public double getSugarContent()
        {
            return sugarContent;
        }

        public override void spoilt()
        {
            Console.WriteLine("spoilt method from Confection class. Item override");

            if (this.shelfLife > 0)
                shelfLife--;
            else
            {
                isGood = false;
            }
        }

        void ISpoiltable.spoilt()
        {
            Console.WriteLine("spoilt method from Confection class. ISpoiltable implementation");

            if (shelfLife > 0)
                shelfLife--;
            else
            {
                isGood = false;
            }
        }
    }
}
