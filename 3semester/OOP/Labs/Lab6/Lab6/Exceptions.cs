using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Lab6
{
    internal class AgeExceptionArg : ArgumentException
    {
        public int Value;
        public AgeExceptionArg(string message, int value): base(message)
        {
            Value = value;
        }
    }

    internal class SleepExceptionArg: ArgumentException
    {
        public int Value { get; }
        public int Value_2 { get; }
        public SleepExceptionArg(string message, int value, int value2)
            : base(message)
        {
            Value = value;
            Value_2 = value2;
        }
    }

    internal class YearException : Exception
    {
        public int value;
        public YearException(string message, int val) : base(message)
        {
            value = val;
        }
    }

    internal class WeeException : Exception
    {
        public string value;
        public WeeException(string message, string val) : base(message)
        {
            value = val;
        }
    }

}
