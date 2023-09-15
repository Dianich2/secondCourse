using System;
using System.Collections.Generic;
using System.Linq;
using System.Management.Instrumentation;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Lab2
{
    partial class Product
    {
        private static Product instance;
        private static int totalAmount;
        public readonly int id;
        private string name;
        private int UPC;
        private const string producer = "Dell";
        private double price;
        private int storagePeriod;
        private int amount;

        static Product()
        {
            totalAmount = 0;
        }

        public Product(string name = "some product", int storagePeriod = 20)
        {
            this.id = totalAmount + 1;
            this.name = name;
            this.storagePeriod = storagePeriod;
            totalAmount++;
        }

        public Product(string name, int UPC, double price, int storagePeriod, int amount)
        {
            this.id = totalAmount + 1;
            this.name = name;
            this.UPC = UPC;
            this.price = price;
            this.storagePeriod = storagePeriod;
            this.amount = amount;
            totalAmount++;
        }

        private Product(string name)
        {
            this.id = totalAmount + 1;
            this.name = name;
            totalAmount++;
        }
        
        public static Product getProduct(string name)
        {
            if(instance == null)
                instance = new Product(name);
            return instance;
        }

        public void setName(string name) {
            this.name = name;
        }

        public string getName()
        {
            return string.Copy(name);
        }

        public void setUPC(int UPC)
        {
            this.UPC = UPC;
        }

        public int getUPC()
        {
            return this.UPC;
        }

        public string getProducer()
        {
            return producer;
        }

        public void setPrice(double price)
        {
            this.price = price;
        }

        public double getPrice()
        {
            return price;
        }

        public void setStoragePeriod(int storagePeriod)
        {
            this.storagePeriod = storagePeriod;
        }

        public void setAmount(int amount)
        {
            this.amount = amount;
        }

        public int getAmount()
        {
            return amount;
        }

        public double getTotalPrice()
        {
            return price * amount;
        }

        public void workWithRefAndOut(ref int firstParametr, out int secondParametr)
        {
            firstParametr = UPC;
            secondParametr = id;
        }

        public override bool Equals(object obj)
        {
            if (obj == null || this.GetType() != obj.GetType())
                return false;
            Product otherProduct = (Product)obj;
            return id == otherProduct.id &&
                name == otherProduct.name &&
                UPC == otherProduct.UPC &&
                price == otherProduct.price &&
                storagePeriod == otherProduct.storagePeriod;
        }

        public override int GetHashCode()
        {
            return id.GetHashCode() ^ name.GetHashCode() ^ price.GetHashCode() ^ storagePeriod.GetHashCode();
        }

        public override string ToString()
        {
            return "Name: " + name + ", ID: " + id + ", UPC: " +
                UPC + ", producer: " + producer + ", price: " + price +
                "Storage period: " + storagePeriod;
        }
    }
}
