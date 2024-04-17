using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GlumHub.repository
{
    internal interface IRepository<T> where T : class
    {
        IEnumerable<T> GetAll();
        void Create(T intem);
        void Update(T intem);
        void Delete(long id);
    }
}
