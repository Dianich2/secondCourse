using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab8
{
    internal class StringWork
    {
        public static string RemoveS(string str, Func<string, string> test1)
        {
            return test1(str);
        }

        public static void AddToString(string str, Action<string> test2) => test2(str);

        public static string RemoveSpaces(string str, Func<string, string> test3)
        {
            return test3(str);
        }

        public static string Upper(string str, Func<string, string> test4)
        {
            return test4(str);
        }

        public static string Lower(string str, Func<string, string> test5) => test5(str);
    }
}
