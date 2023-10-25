using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab10
{
    internal class Class1
    {
        public static void Main(string[] args)
        {
            string[] months = {"January", "February", "March", "April", "May",
                "june", "July", "August", "September", "October", "November", "December"};
            

            IEnumerable<string> nmonth = from n in months
                                         where n.Length == 5
                                         select n;
            foreach (string month in nmonth)
            {
                Console.WriteLine(month);
            }
            Console.WriteLine();

            IEnumerable<string> summerAndWinterMonth = from n in months
                                                       where n == "January" || n== "February" || n == "June" || n == "July" || n == "August" || n == "December"
                                                       select n;
            foreach (string month in summerAndWinterMonth)
            {
                Console.WriteLine(month);
            }
            Console.WriteLine();

            IEnumerable<string> monthsOrdered = from n in months
                                                orderby n
                                                select n;
            foreach(string month in monthsOrdered)
            {
                Console.WriteLine(month);
            }
            Console.WriteLine();

            IEnumerable<string> someMonths = from n in months
                                             where n.Contains("u")
                                             where n.Length >= 4
                                             select n;
            foreach (string month in someMonths)
            {
                Console.WriteLine(month);
            }
            Console.WriteLine();


            List<Product> products = new List<Product>();
            Product product1 = new Product("product1", 345, 100, 2, 4);
            Product product2 = new Product("product2", 56, 200, 5, 6);
            Product product3 = new Product("product3", 340, 300, 1, 7);
            products.Add(product3);
            products.Add(product1);
            products.Add(product2);

            int amountOfProductLess100 = products.Where(n => n.getPrice() > 100).Select(n => n).Count();

            IEnumerable<Product> someProducts = from n in products
                                                where true
                                                orderby n.getProducer()
                                                orderby n.getName()
                                                select n;
            foreach (Product product in someProducts)
            {
                Console.WriteLine(product);
            }
            Console.WriteLine();

            List<Person> persons = new List<Person>();
            persons.Add(new Person("person1", 25, "C#"));
            persons.Add(new Person("person2", 27, "Java"));
            persons.Add(new Person("person3", 26, "Kotlin"));

            List<Organization> organizations = new List<Organization>();
            organizations.Add(new Organization("Microsot", "C#"));
            organizations.Add(new Organization("Oracle", "Java"));

            var Join = from n in persons
                       join q in organizations on n.WorkingLanguage equals q.Language
                       select new { n.Name, n.Age, q.organization };

            foreach(var p in Join)
            {
                Console.WriteLine($"{p.Name}, {p.Age}, {p.organization}");
            }


        }
    }


    internal class Person
    {
        public string Name;
        public int Age;
        public string WorkingLanguage;
        
        public Person(string name,int age, string WorkingLanguage)
        {
            this.Age = age;
            this.Name = name;
            this.WorkingLanguage = WorkingLanguage;
        }
    }
    internal class Organization
    {
        public string organization;
        public string Language;

        public Organization(string Name, string Language)
        {
            this.organization = Name;
            this.Language = Language;
        }
    }
}
