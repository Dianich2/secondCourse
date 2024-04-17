using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GlumHub.repository
{
    public class AddressRepository : IRepository<Address>
    {
        private myContext db;

        public AddressRepository(myContext db)
        {
            this.db = db;
        }

        public IEnumerable<Address> GetAll()
        {
            return db.Addresses;
        }

        public Address Get(long id) {
            return db.Addresses.FirstOrDefault(a => a.Id == id);
        }

        public void Create(Address address)
        {
            db.Addresses.Add(address);
        }

        public void Update(Address address)
        {
            db.Entry(address).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
        }

        public void Delete(long id)
        {
            Address address = db.Addresses.FirstOrDefault(a => a.Id == id);
            if(address != null)
            {
                db.Addresses.Remove(address);
            }
        }

        public void DeleteByStudentId(long studentId) { 
            Address address = db.Addresses.FirstOrDefault(a =>a.StudentId == studentId);
            if (address != null)
                db.Addresses.Remove(address);
        }

    }
}
