using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4_5
{
    internal class Confection:Product, ISpoiltable
    {
        protected double sugarContent;
        public double SugarContent { get { return sugarContent; } }
        
        public Confection(string name, double price, double weigth, double sugarContent)
            : base(name, price, weigth)
        {
            this.sugarContent = sugarContent;
        }

        public override void spoilt()
        {
            Console.WriteLine("spoilt method from Confection calss");
        }


    }
}
