using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4_5
{
    internal class Cake: Confection, ISpoiltable
    {
        CakeTypes type;
        
        public Cake(string name, double price, double weight, double sugarContent, CakeTypes type)
            : base(name, price, weight, sugarContent)
        {
            this.type = type;
        }

        public override void spoilt()
        {
            Console.WriteLine("spoilt method from Cake class");
        }

    }
}
