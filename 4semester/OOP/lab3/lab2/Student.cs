using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace lab2
{
    internal class Student
    {
        [Required(ErrorMessage = "it should be filled")]
        public string firstName;
        [Required(ErrorMessage = "it should be filled")]
        public string lastName;
        [Required(ErrorMessage = "it should be filled")]
        public string fathersName;
        public int age;
        public string specialty;
        public DateTime birthDate;
        public int year;
        public int group;
        public double averageMark;
        public string gender;
        public Adress adress;
        public CurrentJob currentJob;

        public override string ToString()
        {
            return "First name: " + firstName +
                "\nLast name: " + lastName +
                "\n Fathers name: " + fathersName +
                "\n Age: " + age +
                "\n Specialty: " + specialty +
                "\n BirthDate: " + birthDate +
                "\n Year: " + year +
                "\n Group: " + group +
                "\n Average Mark: " + averageMark +
                "\n Gender: " + gender +
                "\n Adress: " + adress +
                "\n Current job: " + currentJob +
                "\n" +
                "-----------------------------" +
                "\n\n";
        }

        public class Adress
        {
            [Required(ErrorMessage = "it should be filled")]
            public string city;
            [MyAttribute(ErrorMessage = "incorect format")]
            public string index;
            [Required(ErrorMessage = "it should be filled")]
            public string street;
            public int building;
            public int flat;

            public Adress(string city, string index, string street, int building, int flat)
            {
                this.city = city;
                this.index = index;
                this.street = street;
                this.building = building;
                this.flat = flat;
            }

            public override string ToString()
            {
                return "\n  City: " + city +
                    "\n  Index: " + index +
                    "\n  Street: " + street +
                    "\n  Building: " + building +
                    "\n  Flat: " + flat;
            }
        }

        public class CurrentJob
        {

            [Required(ErrorMessage = "it should be filled")]
            public string company;
            [Required(ErrorMessage = "it should be filled")]
            public string position;
            public int expirience;

            public CurrentJob(string company, string position, int expirience)
            {
                this.company = company;
                this.position = position;
                this.expirience = expirience;
            }

            public override string ToString()
            {
                return "\n  Company: " + company +
                    "\n  Position: " + position +
                    "\n Expirience: " + expirience;
            }
        }
    }
}
