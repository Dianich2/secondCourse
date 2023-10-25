using System.Collections.ObjectModel;
using System.Collections.Specialized;

namespace Lab9
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            Car car1 = new Car("Supra", 100000);
            Car car2 = new Car("Nissan", 15000);
            Car car3 = new Car("BMW", 4000);
            Car car4 = new Car("Mersedes", 6000);


            MyDictionary<Car> carCollection = new MyDictionary<Car>();
            carCollection.Add(1, car1);
            carCollection.Add(2, car2);
            carCollection.Add(3, car3);
            carCollection.Add(4, car4);
            carCollection.Remove(3);
            Console.WriteLine("____Dictionary:_____");
            carCollection.Print();
            Console.WriteLine(carCollection.Contains(car3));

            Console.WriteLine("\n___int collection:___");
            Dictionary<int, int> intCollection = new Dictionary<int, int>();

            for (int i = 0; i < 10; i++)
            {
                intCollection.Add(i, i);
            }

            foreach (var item in intCollection)
            {
                Console.WriteLine(item.Key + ". " + item.Value);
            }

            Console.WriteLine("\n___Second collection:___");
            List<int> list = intCollection.Values.ToList();
            foreach (int item in list)
                Console.Write(item + " ");

            Console.WriteLine("\n___obseravle collection:___");
            ObservableCollection<Car> obsCollection = new ObservableCollection<Car>();
            obsCollection.CollectionChanged += CollectionChanged;

            obsCollection.Add(car1);
            obsCollection.Remove(car1);
        }

        private static void CollectionChanged(object obj, NotifyCollectionChangedEventArgs e)
        {
            switch (e.Action)
            {
                case NotifyCollectionChangedAction.Add:
                    Console.WriteLine("New item was added");
                    break;
                case NotifyCollectionChangedAction.Remove:
                    Console.WriteLine("Item was removed");
                    break;
            }
        }
    }
}
