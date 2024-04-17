using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GlumHub.repository
{
    public class UnitOfWork : IDisposable
    {

        private myContext db =  new myContext();
        private StudnetRepository studnetRepository;
        public StudnetRepository Students
        {
            get
            {
                if (studnetRepository == null)
                    studnetRepository = new StudnetRepository(db);
                return studnetRepository;
            }
        }

        private AddressRepository addressRepository;
        public AddressRepository Addresss
        {
            get
            {
                if (addressRepository == null)
                    addressRepository = new AddressRepository(db);
                return addressRepository;
            }
        }



        public void Save()
        {
            db.SaveChanges();
        }


        private bool disposed =  false;

        public virtual void Dispose(bool disposing) 
        {
            if (this.disposed)
            {
                if(disposing)
                {
                    db.Dispose();
                }
                this.disposed = true;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

    }
}
