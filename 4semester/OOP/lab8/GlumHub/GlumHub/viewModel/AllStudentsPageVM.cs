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

        myRepository repository;


        public AllStudentsPageVM()
        {
            Students = new ObservableCollection<StudentWrapper>();
            repository = myRepository.GetRepository();
            var studetns = repository.findAllStudents();
            foreach ( var student in studetns )
            {
                Students.Add(new StudentWrapper(student, DeleteStudentCommand, UpdateStudentCommand));
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
            Frame homepageFrame = Application.Current.Resources["HomePageFrame"] as Frame;
            repository.DeleteStudentById(StudentId);
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
