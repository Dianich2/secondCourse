


using System.Diagnostics;
using System.Reflection;

namespace Lab14
{
    class Program
    {
        static void Main(string[] args)
        {
            //task1
            Console.WriteLine("\nЗапущенные процессы:\n");
            foreach (Process process in Process.GetProcesses())
            {
                Console.WriteLine($"ID: {process.Id}; Name: {process.ProcessName}; " +
                    $"Priority: {process.BasePriority}; Memory: {process.WorkingSet64}");
            }

            //task2
            AppDomain domain = AppDomain.CurrentDomain;
            Console.WriteLine("\nCurrent domain:\n");
            Console.WriteLine($"Name: {domain.FriendlyName} \n Base Directory: {domain.BaseDirectory}\n" +
                $"Configuration File: {domain.SetupInformation}");
            Assembly[] assemblies = domain.GetAssemblies();
            Console.WriteLine("All assemblies:");
            foreach(Assembly assembly in assemblies)
            {
                Console.WriteLine(assembly.GetName().Name);
            }

            //task3
            Console.WriteLine("\nTask3:\n");
            Thread threadNumber = new Thread(Tasks.Numbers);
            threadNumber.Start();
            Console.WriteLine("\nThread information:\n");
            Console.WriteLine($"Name: {threadNumber.Name}; Priority: {threadNumber.Priority}; ID: {threadNumber.ManagedThreadId}; Status: {threadNumber.ThreadState}");
            threadNumber.Join();

            //task4
            Console.WriteLine("\nTask4:\n");
            Thread evenThread = new Thread(Tasks.evenNumbers);
            evenThread.Priority = ThreadPriority.AboveNormal;
            evenThread.Start();
            //evenThread.Join();

            Console.WriteLine();
            Thread oddThread = new Thread(Tasks.oddNumbers);
            oddThread.Priority = ThreadPriority.BelowNormal;
            oddThread.Start();
            oddThread.Join();

            //task5
            Console.WriteLine("\ntask5:\n");
            TimerCallback timeDel = new TimerCallback(Tasks.Show);
            Timer timer = new Timer(timeDel, null, 0, 1000);
            Thread.Sleep(4000);
            timer.Dispose();
        }
    }
}