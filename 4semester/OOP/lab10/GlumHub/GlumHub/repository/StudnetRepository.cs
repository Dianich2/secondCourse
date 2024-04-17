using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GlumHub.repository
{
    public class StudnetRepository : IRepository<Student>
    {
        private myContext db;

        public StudnetRepository(myContext db)
        {
            this.db = db;
        }


        public IEnumerable<Student> GetAll()
        {
            return db.Students.Include(s => s.Address);
        }

        public Student Get(long id)
        {
            return db.Students.Include(s => s.Address).FirstOrDefault(x => x.Id == id);
        }

        public void Create(Student student)
        {
            db.Students.Add(student);
        }

        public void Update(Student student)
        {
            db.Entry(student).State = EntityState.Modified;
        }

        public void Delete(long id)
        {
            Student student = db.Students.FirstOrDefault(student => student.Id == id);
            if(student != null)
            {
                db.Students.Remove(student);
            }
        }

    }
}
