using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab3
{
    public class Product : Item
    {
        protected string name;
        protected double price;
        protected double weight;

        public string Name { get { return name; } }
        public double Price { get { return price; } }
        public double Weight { get { return weight; } }

        public Product(string name, double price, double weight)
        {
            this.name = name;
            this.price = price;
            this.weight = weight;
        }

        public override void spoilt()
        {
            Console.WriteLine("spoilt method from Product class");
        }



        public override string ToString()
        {
            return "Type:" + this.GetType() + ", Name: " + name + ", price: " + price
                + ", weiht:" + weight;
        }

        public Product getCopy()
        {
            return new Product(Name, Price, Weight);
        }


    }
}
