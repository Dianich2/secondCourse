using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4_5
{
    internal class Flower: Product, ISpoiltable
    {
        public Flower(string name, double price, double weight)
            :base(name, price, weight)
        {

        }

        public override void spoilt()
        {
            Console.WriteLine("spoilt method from Flower class");
        }
    }
}
