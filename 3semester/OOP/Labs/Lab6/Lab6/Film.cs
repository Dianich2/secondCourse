using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab6
{
    internal class Film
    {
        public string FilmName;
        public int AgeRestrictions;
        private int age;
        public int Age
        {
            get
            {
                return age;
            }
            set
            {
                if(value < AgeRestrictions)
                {
                    throw new AgeExceptionArg("It's forbidden for people of that age", value);
                }
                else
                {
                    age = value;
                }
            }
        }

        public Film(string filmName, int ageRestrictions, int age)
        {
            FilmName = filmName;
            AgeRestrictions = ageRestrictions;
            Age = age;
        }
    }
}
