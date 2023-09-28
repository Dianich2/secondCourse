using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab3
{
    internal interface IListInrerfase<T>
    {
        public void Add(T item);
        public void Remove(T item);
        public T GetElementAt(int index);
        public T FindElementByPredicate(Func<T, bool> predicate);
    }
}
