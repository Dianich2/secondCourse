using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4_5
{
    internal class Gift
    {
        private List<Product> products = new List<Product>();
        private int length = 0;
        public int Length { get { return length; } }

        public void add(Product item)
        {
            length++;
            products.Add(item);
        }
        public void remove(Product item)
        {
            products.Remove(item);
        }

        public Product get()
        {
            return products.First();
        }

        public List<Product> getList()
        {
            return products;
        }
        public void addAll(List<Product> list)
        {
            products = new List<Product>(list);
        }

        public void writeList()
        {
            foreach(Product item in products)
            {
                Console.WriteLine(item.ToString());
            }
        }

        
    }
}
