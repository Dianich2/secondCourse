
using Prism.Commands;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace GlumHub
{
    class MainPageVM
    {
        Frame mainFrame;
        Frame homePageFrame;


        public MainPageVM()
        {
            mainFrame = Application.Current.Resources["MainFrame"] as Frame;
        }




        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }


        private DelegateCommand _undoCommand;
        public ICommand UndoCommand
        {
            get
            {
                if (_undoCommand == null)
                    _undoCommand = new DelegateCommand(Udno);
                return _undoCommand;
            }
        }

        private void Udno()
        {
            if (mainFrame.CanGoBack)
            {
                mainFrame.GoBack();
            }
            
        }


        private DelegateCommand _redoCommand;
        public ICommand RedoCommand
        {
            get
            {
                if (_redoCommand == null)
                    _redoCommand = new DelegateCommand(Redo);
                return _redoCommand;
            }
        }

        private void Redo()
        {
            if (mainFrame.CanGoForward)
            {
                mainFrame.GoForward();
            }

        }



        private DelegateCommand _homeRedirectCommand;
        public ICommand HomePageRedirectCommand
        {
            get
            {
                if (_homeRedirectCommand == null)
                    _homeRedirectCommand = new DelegateCommand(HomePageRedirect);
                return _homeRedirectCommand;
            }
        }

        private void HomePageRedirect()
        {
            Frame homePageFrame = Application.Current.Resources["HomePageFrame"] as Frame;
            homePageFrame.Navigate(new AllStudentsPage());
        }


        private DelegateCommand _searchPageRedirectCommand;
        public ICommand SearchPageRedirectCommand
        {
            get
            {
                if (_searchPageRedirectCommand == null)
                    _searchPageRedirectCommand = new DelegateCommand(searchPageRedirect);
                return _searchPageRedirectCommand;
            }
        }

        private void searchPageRedirect()
        {
            homePageFrame = Application.Current.Resources["HomePageFrame"] as Frame;
            //homePageFrame.Navigate(new SearchPage());
        }


        private DelegateCommand _addNewStudentPageRedirectCommand;
        public ICommand AddNewStudentPageRedirectCommnad
        {
            get
            {
                if (_addNewStudentPageRedirectCommand == null)
                    _addNewStudentPageRedirectCommand = new DelegateCommand(AddNewStudentPageRedirect);
                return _addNewStudentPageRedirectCommand;
            }
        }

        private void AddNewStudentPageRedirect()
        {
            Frame homePageFrame = Application.Current.Resources["HomePageFrame"] as Frame;
            homePageFrame.Navigate(new AddNewStudentsPage());
        }

    }
}
