using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab6
{
    internal class ArtFilm
    {
        public string FilmName;
        public string producer;
        private int yearOfPublish;
        public string[] programGuide = { "19:30", "18:00", "14:30", "13:00", "19:00", "18:05", "11:30" };
        public string[] week = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Suturday", "Sunday" };
        public int YearOfPublish
        {
            get { return yearOfPublish; }

            set
            {
                if (value <= 1895)
                    throw new YearException("There wasn't fils at that time, first filme was publishe in 1895 year ", value);
                else
                    yearOfPublish = value;
            }
        }

        public void ProgramGuide()
        {
            for (int i = 0; i < week.Length; i++)
            {
                Console.WriteLine("Show time at {0}: {1}", week[i], programGuide[i]);
            }
        }

        public void ProgramGuide(string? day)
        {
            Debug.Assert(day != null);
            Trace.Assert(day != null);

            int error = 0;
            for(int i = 0; i < week.Length; i++)
            {
                if (day == week[i])
                    error = 1;
            }

            if (error != 0)
            {
                for (int i = 0; i < week.Length; i++)
                {
                    if (day == week[i])
                        Console.WriteLine("Show time at {0}: {1}", week[i], programGuide[i]);
                }
            }

            else
                throw new WeeException("Incorrect day of week input", day);
        }

        public void ProgramGuide(int index)
        {
            if(index < 0 || index > 7)
            {
                throw new IndexOutOfRangeException("You are out of array bounds");
            }

            for (int i = 0; i < week.Length; i++)
            {
                if (i == index - 1)
                    Console.WriteLine("Show time at {0}: {1}", week[i], programGuide[i]);
            }
        }

        public ArtFilm(string filmName, string producer, int yearOfPublish)
        {
            FilmName = filmName;
            this.producer = producer;
            YearOfPublish = yearOfPublish;
        }
    }
}
