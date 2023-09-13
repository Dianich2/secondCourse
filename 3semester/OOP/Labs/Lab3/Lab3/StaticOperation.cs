using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace Lab3
{
    public static class StaticOperation
    {
        public static int countListSumm(OneDirectionalList<int> list)
        {
            int result = 0;
            Node<int> current = list.getHead();
            while (current != null)
            {
                result += current.Value;
                current = current.Next;
            }
            return result;
        }

        public static int countMaxMinDifference(OneDirectionalList<int> list)
        {
            int result = 0;
            int max = int.MinValue;
            int min = int.MaxValue;
            Node<int> current = list.getHead();

            while (current != null)
            {
                if (current.Value < min)
                    min = current.Value;
                if (current.Value > max)
                    max = current.Value;
                current = current.Next;
            }
            result = max - min;
            return result;
        }

        public static int countListElentsAmount(OneDirectionalList<int> list)
        {
            int result = 0;
            Node<int> current = list.getHead();

            while (current != null)
            {
                result++;
                current = current.Next;
            }
            return result;
        }

        public static void deleteElement(OneDirectionalList<int> list, object element)
        {
            Node<int> current = list.getHead();
            while (current.Next != null)
            {
                if (current.Next.Value.Equals(element))
                {
                    current.Next = current.Next.Next;
                }
                current = current.Next;
            }
        }


        public static int? extractLastNubmer(string input)
        {
            int? lastNumber = null;
            MatchCollection matches = Regex.Matches(input, @"\d+");

            if(matches.Count > 0)
            {
                string lastNumberStr = matches[matches.Count - 1].Value;
                lastNumber = int.Parse(lastNumberStr);
            }

            return lastNumber;
        }
    }
}
