using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GlumHub
{
    internal class Address
    {

        private long id;
        public long Id { get { return id; } set { id = value; } }

        private long studentId;
        public long StudentId { get { return studentId; } set { studentId = value; } }

        private string city;
        public string City { get { return city; } set { city = value; } }

        private string street;
        public string Street { get { return street; } set { street = value; } }

        private int homme;
        public int Homme { get {  return homme; } set {  homme = value; } }

        public Address() { }

        public Address(long studentId, string city, string street,  int homme)
        {
            StudentId = studentId;
            City = city;
            Street = street;
            Homme = homme;
        }
    }
}
