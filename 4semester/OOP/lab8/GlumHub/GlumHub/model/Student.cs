using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GlumHub
{
    internal class Student
    {
        private long id;
        public long Id { get { return id; } set { id = value; } }

        private byte[] _profileImage;
        public byte[] ProfileImage { get { return _profileImage; } set { _profileImage = value; } }

        private string fio;
        public string FIO { get { return fio; } set { fio = value; } }

        private int age;
        public int Age { get { return age; } set { age = value; } }


        private Address address;
        public Address Address { get { return address; } set { address = value; } }


        public Student()
        {
            
        }

        public Student(string fio, int age, Address address)
        {
            FIO = fio;
            Age = age;
            Address = address;
        }

        public Student(string fio, int age)
        {
            FIO = fio;
            Age = age;
        }
    }
}
