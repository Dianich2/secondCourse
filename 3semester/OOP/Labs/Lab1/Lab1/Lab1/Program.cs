using System;
using System.Text;
using System.Transactions;

namespace ConsoleApplication1
{
    class FirstLab
    {
        public static void Main(String[] args)
        {
            Console.WriteLine("Input bool");
            bool variableBool = Convert.ToBoolean(Console.ReadLine());
            Console.WriteLine(variableBool);
            Console.WriteLine("Input byte");
            byte variableByte = Convert.ToByte(Console.ReadLine());
            Console.WriteLine(variableByte);
            Console.WriteLine("Input sbyte");
            sbyte variableSByte = Convert.ToSByte(Console.ReadLine());
            Console.WriteLine(variableSByte);
            Console.WriteLine("Input char");
            char variableChar = Convert.ToChar(Console.ReadLine());
            Console.WriteLine(variableChar);
            Console.WriteLine("Input decimal");
            decimal variableDecimal = Convert.ToDecimal(Console.ReadLine());
            Console.WriteLine(variableDecimal);
            Console.WriteLine("Input double");
            double variableDouble = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine(variableDouble);
            Console.WriteLine("Input float");
            float variableFloat = Convert.ToSingle(Console.ReadLine());
            Console.WriteLine(variableFloat);
            Console.WriteLine("Input int");
            int variableInt = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine(variableInt);
            Console.WriteLine("Input uint");
            uint variableUInt = Convert.ToUInt32(Console.ReadLine());
            Console.WriteLine(variableUInt);
            Console.WriteLine("Input nint");
            nint variableNInt = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine(variableNInt);
            Console.WriteLine("Input nuint");
            nuint variableNUint = Convert.ToUInt32(Console.ReadLine());
            Console.WriteLine(variableNUint);
            Console.WriteLine("Input long");
            long variableLong = Convert.ToInt64(Console.ReadLine());
            Console.WriteLine(variableLong);
            Console.WriteLine("Input ulong");
            ulong variableULong = Convert.ToUInt64(Console.ReadLine());
            Console.WriteLine(variableULong);
            Console.WriteLine("Input short");
            short variableShort = Convert.ToInt16(Console.ReadLine());
            Console.WriteLine(variableShort);

            double NumberDouble = 34.623948902384;
            int NumberInt = (int)NumberDouble;

            double NumberLong = 39.20348092384029384;
            NumberInt = (int)NumberLong;

            float NumberFloat = 23.6459f;
            NumberDouble = (double)NumberFloat;

            byte NumberByte = 255;
            short NumberShort = (short)NumberByte;

            char vartiableChar = 'K';
            NumberInt = (int)variableChar;

            NumberDouble = NumberInt;
            NumberDouble = NumberShort;
            NumberDouble = NumberShort;
            NumberInt = NumberByte;
            NumberInt = vartiableChar;

            Int32 NumberInt32 = NumberInt;
            NumberInt = NumberInt32;
            Double variableDoubleObj = variableDouble;
            variableDouble = variableDoubleObj;

            var implicitVariable1 = 5.3;
            //implicitVariable1 = "someText";
            var implicitVariable2 = "someText";


            int? variableIntNullabel = null;

            string str1 = "String1";
            string str2 = "Strign2";
            string str3 = "String3";

            string concatStr = String.Concat(str1, str2);
            Console.WriteLine(concatStr);
            string copstr = string.Copy(str1);
            Console.WriteLine(copstr);
            string subStr = str1.Substring(2, 4);
            Console.WriteLine(subStr);

            string someWordsStr = "broken thinngs have their own sad beauty";
            string[] words = someWordsStr.Split(' ');
            foreach (string word in words)
            {
                Console.WriteLine(word);
            }

            string str4 = str3.Insert(3, str2);
            Console.WriteLine("Str3 after inerting str2 in it: " + str4);

            string str5 = str4.Replace(str2, "");
            Console.WriteLine("Str3 after replacing str2 in it: " + str5);

            string myName = "Valentine";
            string interpStr = $"My name is {myName}";
            Console.WriteLine(interpStr);

            string strNull = null;
            string strEmpty = "";

            if (string.IsNullOrEmpty(strNull))
            {
                Console.WriteLine("strNull is empty or null");
            }
            if (string.IsNullOrEmpty(strEmpty))
            {
                Console.WriteLine("strNull is empty or null");
            }
            Console.WriteLine("strEmpty length is " + strEmpty.Length);
            strNull += "someText";
            Console.WriteLine("strNull after concationation is: " + strNull);


            StringBuilder strBuild = new StringBuilder("Some StrignBuilder string");
            Console.WriteLine("strBuild at the baginning: " + strBuild);
            strBuild.Remove(5, 4);
            Console.WriteLine("strBuilt after removal: " + strBuild);
            strBuild.Insert(0, "some text to start ");
            strBuild.Append(" some text to end ");
            Console.WriteLine("strBuild finally: " + strBuild);

            int[,] TwoDimentionalArray = new int[3, 3]
        {
            {1, 2, 3},
            {4, 5, 6},
            {7, 8, 9}
        };


            for (int i = 0; i < TwoDimentionalArray.GetLength(0); i++)
            {
                for (int j = 0; j < TwoDimentionalArray.GetLength(1); j++)
                {
                    Console.Write(TwoDimentionalArray[i, j] + "  ");
                }
                Console.WriteLine();
            }

            string[] stringsArray = new string[]
        {
            "Stark", "Targarien", "Lanister", "Baratheon", "Velarion"
        };

            Console.WriteLine("Array:");
            for (int i = 0; i < stringsArray.Length; i++)
            {
                Console.WriteLine(i + ": " + stringsArray[i]);
            }
            Console.WriteLine("Array length: " + stringsArray.Length);

            Console.WriteLine("Input position of element to replace (0 to 4)");
            int position = Convert.ToInt32(Console.ReadLine());
            if (position >= 0 && position < stringsArray.Length)
            {
                Console.Write("Input new value: ");
                string NewValue = Console.ReadLine();
                stringsArray[position] = NewValue;

                Console.WriteLine("New Array:");
                for (int i = 0; i < stringsArray.Length; i++)
                {
                    Console.WriteLine(i + ": " + stringsArray[i]);
                }
            }
            else
            {
                Console.WriteLine("Incorrect input");
            }

            int[][] curveArray = new int[3][];
            int subArrayLength = 2;
            for (int i = 0; i < curveArray.Length; i++)
            {
                curveArray[i] = new int[subArrayLength++];
                for (int j = 0; j < subArrayLength - 1; j++)
                {
                    Console.WriteLine($"Input curveArray[{i}][{j}] value: ");
                    curveArray[i][j] = Convert.ToInt32(Console.ReadLine());
                }
            }
            Console.WriteLine("Array: ");
            for (int i = 0; i < curveArray.Length; i++)
            {
                for (int j = 0; j < curveArray[i].Length; j++)
                {
                    Console.Write(curveArray[i][j] + "  ");
                }
                Console.WriteLine();
            }

            var implicitArray = new[] { 1, 2, 3, 4, 5 };
            for (int i = 0; i < implicitArray.Length; i++)
            {
                Console.Write("Array: " + implicitArray[i] + "  ");
            }
            var implicitString = "Some string";
            Console.WriteLine("Implicit variable for string: " + implicitString);

            var myTuple = (5, "someString", 'G', "oneMoreString", 409238492834094829L);
            Console.WriteLine("myTuple: ");
            int a = 2;
            Console.WriteLine(myTuple);
            Console.WriteLine(myTuple.Item1);
            Console.WriteLine(myTuple.Item3);
            Console.WriteLine(myTuple.Item5);

            var (number, strin1, ch, strin2, lon) = myTuple;
            Console.WriteLine($"Number: {number}, stri1:{strin1}, ch: {ch}, " +
                $"strin2:{strin2}, long:{lon}");
            var (_, _, _, elem, _) = myTuple;
            Console.WriteLine(elem);

            var tuple1 = (1, 2, 3, 4, 5, "a");
            var tuple2 = (1, 2, 3, 4, 5, "a");
            if(tuple1 == tuple2)
            {
                Console.WriteLine("true");
            }
            else
            {
                Console.WriteLine("false");
            }

            int[] arr = { 1, 2, 3, 5, 1, 7, 11, 10 };
            string str = "some string";
            Console.WriteLine(GetInformation(arr, str));

            CheckedFunction();
            UncheckedFunction();

        }
        
        static (int, int, int, char) GetInformation(int[] arr, string str)
        {
            int min = arr.Min();
            int max = arr.Max();
            int summ = 0;
            for (int i = 0; i < arr.Length; i++)
            {
                summ += arr[i];
            }
            char firstCh = str[0];
            var tupleToReturn = (min, max, summ, firstCh);
            return tupleToReturn;
        }
        static void CheckedFunction()
        {
            checked
            {
                try
                {
                    int maxValue = int.MaxValue; 
                    Console.WriteLine("Function with checked:");
                    Console.WriteLine($"int.MaxValue: {maxValue}");
                    Console.WriteLine($"Try to plus 1: {maxValue + 1}"); 
                }
                catch (OverflowException ex)
                {
                    Console.WriteLine($"Exception: {ex.Message}");
                }
            }
        }

        static void UncheckedFunction()
        {
            unchecked
            {
                int maxValue = int.MaxValue;
                Console.WriteLine("\nFunction with unchecked:");
                Console.WriteLine($"int.MaxValue: {maxValue}");
                Console.WriteLine($"Try to plus 1: {maxValue + 1}");
            }
        }

    }
}