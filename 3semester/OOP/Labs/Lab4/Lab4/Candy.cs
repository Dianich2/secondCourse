using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4
{
    internal sealed class Candy: Confection, ISpoiltable, IEatable
    {
        double weight;
        public Candy(string name, string producer, double price, int shelfFile, double sugarContent, double weight) :
            base(name, producer, price, shelfFile, sugarContent)
        {
            this.weight = weight;
        }

        public double getWeight()
        {
            return weight;
        }

        public override void spoilt()
        {
            Console.WriteLine("spoilt method from Candy class. Item override");

            if (this.shelfLife > 0)
                shelfLife--;
            else
            {
                isGood = false;
            }
        }

        void ISpoiltable.spoilt()
        {
            Console.WriteLine("spoilt method from Candy class. ISpoiltable implementation");

            if (shelfLife > 0)
                shelfLife--;
            else
            {
                isGood = false;
            }
        }
    }
}
