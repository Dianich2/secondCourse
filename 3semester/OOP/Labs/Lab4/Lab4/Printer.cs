using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4
{
    internal class Printer
    {
        public virtual void IAmPrinting(Item item)
        {
            Console.WriteLine(item.GetType().Name);
        }
    }
}
