using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab6
{
    internal class MainClass
    {
        public static void Main(string[] args)
        {
            /*Debug.Write("Data"); //send message to debugger
            Debug.WriteLine(23 * 34);
            int x = 5, y = 3;
            Debug.WriteIf(x > y, "x is greater than y");

            Debugger.Launch(); //choose of debugger
            Debugger.Break(); //==breakpoint */

            try
            {
                Film film = new Film("Inception", 16, 14);
            }
            catch(AgeExceptionArg e)
            {
                Console.WriteLine("Error: {0}", e.Message);
                Console.WriteLine($"Incorrect value: {e.Value}");
            }
            finally
            {
                Console.WriteLine("---------------------\n");
            }

            try
            {
                Cartoon cartoon = new Cartoon("Rick and Morty", 2030, 2000);
            }
            catch(SleepExceptionArg e)
            {
                Console.WriteLine("Error: {0}", e.Message);
                Console.WriteLine($"Cartoon starts at: {e.Value}");
                Console.WriteLine($"You're gonna get sleep at: {e.Value_2}");
            }
            finally
            {
                Console.WriteLine("--------------------\n");
            }

            try
            {
                ArtFilm artfilm = new ArtFilm("Interstellar", "Cristofer Nolan", 1790);
            }
            catch(YearException e)
            {
                Console.WriteLine("Error: {0}", e.Message);
                Console.WriteLine($"Incorrect input: {e.value}");
            }
            finally
            {
                Console.WriteLine("-------------------\n");
            }

            ArtFilm artfilm2 = new ArtFilm("The Dark Knight", "Cristofer Nolan", 2008);
            try
            {
                artfilm2.ProgramGuide(-3);
            }
            catch(IndexOutOfRangeException e)
            {
                Console.WriteLine("Error: {0}", e.Message);
            }
            finally
            {
                Console.WriteLine("-----------------------\n");
            }
        }
    }
}
