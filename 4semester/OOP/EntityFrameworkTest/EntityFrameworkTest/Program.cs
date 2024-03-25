using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityFrameworkTest
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            using (ApplicationContext db = new ApplicationContext())
            {
                User user1 = new User { Name = "Tom", Age = 33 };
                User user2 = new User { Name = "Alice", Age = 26 };

                db.Users.Add(user1);
                db.Users.Add(user2);
                db.SaveChanges();
            }

            using (ApplicationContext db = new ApplicationContext())
            {
                var users = db.Users.ToList();
                Console.WriteLine("Data ager adding:");
                foreach (User u in users)
                {
                    Console.WriteLine($"{u.Id}.{u.Name} - {u.Age}");
                }
            }

            using (ApplicationContext db = new ApplicationContext())
            {
                User user = db.Users.FirstOrDefault();
                if (user != null)
                {
                    user.Name = "Bob";
                    user.Age = 44;
                    db.SaveChanges();
                }

                Console.WriteLine("\nДанные после редактирования:");
                var users = db.Users.ToList();
                foreach (User u in users)
                {
                    Console.WriteLine($"{u.Id}.{u.Name} - {u.Age}");
                }
            }

            using (ApplicationContext db = new ApplicationContext())
            {
                User user = db.Users.FirstOrDefault();
                if (user != null)
                {
                    db.Users.Remove(user);
                    db.SaveChanges();
                }
                Console.WriteLine("\nДанные после удаления:");
                var users = db.Users.ToList();
                foreach (User u in users)
                {
                    Console.WriteLine($"{u.Id}.{u.Name} - {u.Age}");
                }
            }
            Console.Read();

        }

    }
}
