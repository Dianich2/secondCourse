using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4_5
{
    internal class Printer
    {
        public void IAmPrinting(Item item)
        {
            Console.WriteLine(item.GetType().Name);
        }
    }
}
