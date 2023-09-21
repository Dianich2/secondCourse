using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab6
{
    internal class Cartoon
    {
        public string CartoonName;
        private int startTime;
        public int sleepTime;
        public int StartTime
        {
            get
            {
                return startTime;
            }
            set
            {
                startTime = value;
            }
        }

        public int SleepTime
        {
            get { return sleepTime; }

            set
            {
                if (value < startTime)
                    throw new SleepExceptionArg("You can't watch cartoon at that time cause you'll be sleeping", value, startTime);
                else
                    SleepTime = value;
            }
        }

        public Cartoon(string cartoonName, int startTime, int sleepTime)
        {
            CartoonName = cartoonName;
            StartTime = startTime;
            SleepTime = sleepTime;
        }
    }
}
