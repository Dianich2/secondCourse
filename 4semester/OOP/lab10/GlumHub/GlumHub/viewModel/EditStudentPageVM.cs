using GlumHub.repository;
using Microsoft.Identity.Client;
using Microsoft.Win32;
using Prism.Commands;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace GlumHub
{
    internal class EditStudentPageVM
    {
        UnitOfWork unitOfWork;
        long? id;

        private Student student;
        public Student Student
        {
            get { return student; }
            set
            {
                student = value;
                OnPropertyChanged(nameof(Student));
            }
        }

        public EditStudentPageVM()
        {
            if (Application.Current.Resources["StudentIdToEdit"] != null)
            {
                this.id = Application.Current.Resources["StudentIdToEdit"] as long?;
            }

            unitOfWork = new UnitOfWork();
            student = unitOfWork.Students.Get((long)id);
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        private DelegateCommand _changeProfileImageCommand;
        public ICommand ChangeProfileImageCommand
        {
            get
            {
                if (_changeProfileImageCommand == null)
                    _changeProfileImageCommand = new DelegateCommand(ChangeProfileImage);
                return _changeProfileImageCommand;
            }
        }

        public void ChangeProfileImage()
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image files (*.jpg, *.jpeg, *.png)|*.jpg;*.jpeg;*.png|All files (*.*)|*.*";


            if (openFileDialog.ShowDialog() == true)
            {
                using (FileStream fs = new FileStream(openFileDialog.FileName, FileMode.Open))
                {
                    byte[] imageData = new byte[fs.Length];
                    fs.Read(imageData, 0, imageData.Length);
                    Student.ProfileImage = imageData;
                }
            }
        }

        private DelegateCommand _saveChangesCommand;
        public ICommand SaveChangesCommand
        {
            get
            {
                if (_saveChangesCommand == null)
                    _saveChangesCommand = new DelegateCommand(SaveChanges);
                return _saveChangesCommand;
            }
        }

        public void SaveChanges()
        {
            unitOfWork.Students.Update(Student);
            unitOfWork.Save();


            Frame homepageFrame = Application.Current.Resources["HomePageFrame"] as Frame;
            homepageFrame.Navigate(new AllStudentsPage());
        }
    }
}
