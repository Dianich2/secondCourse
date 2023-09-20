using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4_5
{
    internal class Candy: Confection, ISpoiltable
    {

        public Candy(string name, double price, double weight, double sugarContent)
            : base(name, price, weight, sugarContent)
        {

        }

        public override void spoilt()
        {
            Console.WriteLine("spoilt method from Candy class");
        }
    }
}
