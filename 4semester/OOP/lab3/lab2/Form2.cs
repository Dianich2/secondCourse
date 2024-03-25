using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab2
{
    public partial class Form2 : Form
    {
        public Form2(System.EventHandler someEvent)
        {
            InitializeComponent();
            this.buttonSearch.Click += someEvent;
        }

        internal void buttonSearch_Click(object sender, EventArgs e)
        {
            string firstName = this.richTextBoxFirstNameS.Text;
            string lastName = this.richTextLastNameS.Text;
            string fathersName = this.richTextFathersNameS.Text;
            string specialty = this.comboBoxSpecialtyS.Text;
            int year = Convert.ToInt32(comboBoxYearS.SelectedItem);
            int group = Convert.ToInt32(comboBoxGroupS.SelectedItem);
            int minAverage = (int)this.numericUpDownAverage.Value;

            
            string json = File.ReadAllText("Students.json");
            List<Student> studentsFromFile = JsonConvert.DeserializeObject<List<Student>>(json);

            Form1.searchResult = (List<Student>)(from student in studentsFromFile
                                                 where student.firstName.Contains(firstName)
                                                 where student.lastName.Contains(lastName)
                                                 where student.fathersName.Contains(fathersName)
                                                 where student.specialty.Contains(specialty)
                                                 where year == 0 ? (student.year > 0) : (student.year == year)
                                                 where @group == 0 ? (student.@group > 0) : (student.@group == @group)
                                                 where student.averageMark >= minAverage
                                                 select student).ToList();
            Form1.isSearchResult = true;
        }

    }


    public class StringEventArgs : EventArgs
    {
        public string Message { get; set; }

        public StringEventArgs(string message)
        {
            Message = message;
        }
    }
}


