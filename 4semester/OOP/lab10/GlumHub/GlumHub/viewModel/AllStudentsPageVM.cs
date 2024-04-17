using GlumHub.repository;
using Prism.Commands;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics.Eventing.Reader;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace GlumHub
{
    internal class AllStudentsPageVM
    {

        UnitOfWork unitOfWork;

        private ObservableCollection<StudentWrapper> _students;
        public ObservableCollection<StudentWrapper> Students
        {
            get { return _students; }
            set
            {
                _students = value;
                OnPropertyChanged(nameof(Students));
            }
        }

        public AllStudentsPageVM()
        {
            Students = new ObservableCollection<StudentWrapper>();

            unitOfWork = new UnitOfWork();
            IEnumerable<Student> students = unitOfWork.Students.GetAll();
            foreach(Student st in students)
            {
                Students.Add(new StudentWrapper(st, DeleteStudentCommand, UpdateStudentCommand));
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }



        private DelegateCommand _sortCommand;
        public ICommand SortCommand
        {
            get
            {
                if (_sortCommand == null)
                    _sortCommand = new DelegateCommand(Sort);
                return _sortCommand;
            }
        }

        private void Sort()
        {
            var tempStud = new ObservableCollection<StudentWrapper>(Students.OrderBy(s => s.student.FIO));
            Students.Clear();
            foreach(StudentWrapper st in tempStud)
            {
                Students.Add(st);
            }
        }


        private DelegateCommand<long?> _updateStudentCommand;
        public ICommand UpdateStudentCommand
        {
            get
            {
                if (_updateStudentCommand == null)
                    _updateStudentCommand = new DelegateCommand<long?>(UpdateStudent);
                return _updateStudentCommand;
            }
        }

        private void UpdateStudent(long? StudentId)
        {
            if(Application.Current.Resources["StudentIdToEdit"] == null)
                Application.Current.Resources.Add("StudentIdToEdit", StudentId);
            else
                Application.Current.Resources["StudentIdToEdit"] = StudentId;
            Frame homePageFrame = Application.Current.Resources["HomePageFrame"] as Frame;
            homePageFrame.Navigate(new EditStudentPage());
        }

        private DelegateCommand<long?> _deleteStudentCommand;
        public ICommand DeleteStudentCommand
        {
            get
            {
                if (_deleteStudentCommand == null)
                    _deleteStudentCommand = new DelegateCommand<long?>(DeleteStudent);
                return _deleteStudentCommand;
            }
        }

        private void DeleteStudent(long? StudentId)
        {
            unitOfWork.Students.Delete((long)StudentId);
            unitOfWork.Addresss.DeleteByStudentId((long)StudentId);
            unitOfWork.Save();

            Frame homepageFrame = Application.Current.Resources["HomePageFrame"] as Frame;
            homepageFrame.Navigate(new AllStudentsPage());
        }

        public class StudentWrapper
        {
            public Student student { get; set; }
            public ICommand DeleteStudentCommand { get; set; }
            public ICommand UpdateStudentCommand { get; set; }

            public StudentWrapper(Student student, ICommand DeleteStudentCommand, ICommand UpdateStudentCommand)
            {
                this.student = student;
                this.DeleteStudentCommand = DeleteStudentCommand;
                this.UpdateStudentCommand = UpdateStudentCommand;
            }
        }
    }
}
