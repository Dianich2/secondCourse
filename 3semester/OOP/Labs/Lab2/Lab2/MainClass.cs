using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Lab2
{
    internal class MainClass
    {
        public static void Main(string[] args)
        {
            Product.getInforamtion();
            Console.WriteLine();
            Product product1 = new Product();
            product1.setUPC(12345);
            product1.setName("product1");
            product1.setPrice(2000.5);
            product1.setStoragePeriod(10);
            product1.setAmount(2);
            Console.WriteLine("Total price of product1: " + product1.getTotalPrice());
            Console.WriteLine();

            Product product2 = new Product("product2", 23456, 2500.6, 15, 3);

            Product product3 = Product.getProduct("product3");
            product3.setUPC(45677);
            product3.setPrice(3000);
            product3.setStoragePeriod(25);
            product3.setAmount(5);

            int firstParamets = 4;
            int secondParametr;
            product1.workWithRefAndOut(ref firstParamets, out secondParametr);

            Console.WriteLine(product1.ToString());

            Console.WriteLine(product1.Equals(product2));

            Product product4 = product1;

            Console.WriteLine(product1.Equals(product4));

            Product[] products = new Product[4];
            products[0] = product1;
            products[1] = product2;
            products[2] = product3;
            products[3] = product4;

            Console.WriteLine("\nProductes produced by Dell: ");
            foreach(Product product in products)
            {
                if (product.getProducer() == "Dell")
                    Console.WriteLine(product.ToString());
            }

            Console.WriteLine("\nProductes produced by Dell which price less then: ");
            foreach (Product product in products)
            {
                if(product.getProducer() == "Dell" && product.getPrice() < 2600)
                    Console.WriteLine(product.ToString());
            }

            var person5 = new
            {
                id = 100,
                name = "product5",
                UPC = 67890,
                producer = "Dell",
                price = 3000.2,
                storagePeriod = 15,
                amount = 6
            };
            Console.WriteLine("\nAnonymous class: ");
            Console.WriteLine(person5.ToString());
            Console.WriteLine();
        }
    }
}
