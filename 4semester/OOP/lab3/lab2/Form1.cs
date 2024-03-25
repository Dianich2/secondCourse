using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using Newtonsoft.Json;
using System.Collections.ObjectModel;
using System.Collections;
using System.IO;
using ComboBox = System.Windows.Forms.ComboBox;
using System.Runtime.CompilerServices;

namespace lab2
{
    public partial class Form1 : Form
    {
        internal static bool isSearchResult = false;
        internal static List<Student> students { get; set; }
        internal static List<Student> searchResult { get; set; }
        List<Student> studentsFromFile;
        private Timer timer;

        Form form2;
        AboutBox1 aboutBox1;

        public Form1()
        {
            
            InitializeComponent();
            printLatestAction("Application started");
            searchResult = new List<Student>();
            students = new List<Student>();




            this.richTextLastName.Tag = false;
            this.richTextFathersName.Tag = false;
            this.comboBoxSpecialty.Tag = false;
            this.comboBoxGroup.Tag = false;
            this.textBoxAverageMark.Tag = false;
            this.richTextBoxCity.Tag = false;
            this.richTextBoxStreet.Tag = false;
            this.richTextBoxCompany.Tag = false;
            this.richTextBoxPosition.Tag = false;
            this.maskedTextBoxIndex.Tag = false;


            //texBoxes
            this.richTextBoxFirstName.Validating +=
                new System.ComponentModel.CancelEventHandler(this.TextBoxEmpy_Validating);
            this.richTextBoxFirstName.KeyPress += richTextBox_KeyPress;


            this.richTextLastName.Validating +=
                new System.ComponentModel.CancelEventHandler(this.TextBoxEmpy_Validating);
            this.richTextLastName.KeyPress += richTextBox_KeyPress;


            this.richTextFathersName.Validating +=
                new System.ComponentModel.CancelEventHandler(this.TextBoxEmpy_Validating);
            this.richTextFathersName.KeyPress += richTextBox_KeyPress;


            this.textBoxAverageMark.Validating +=
                new System.ComponentModel.CancelEventHandler(this.TextBoxEmpy_Validating);
            this.textBoxAverageMark.Validating +=
                new System.ComponentModel.CancelEventHandler(this.textBoxAverageMarkFormat_Validating);
            textBoxAverageMark.KeyPress += textBoxAverageMark_KeyPress;


            this.richTextBoxStreet.Validating +=
                new System.ComponentModel.CancelEventHandler(this.TextBoxEmpy_Validating);
            this.richTextBoxStreet.KeyPress += richTextBox_KeyPress;



            this.richTextBoxCompany.Validating +=
                new System.ComponentModel.CancelEventHandler(this.TextBoxEmpy_Validating);
            this.richTextBoxCompany.KeyPress += richTextBox_KeyPress;


            this.richTextBoxPosition.Validating +=
                new System.ComponentModel.CancelEventHandler(this.TextBoxEmpy_Validating);
            this.richTextBoxPosition.KeyPress += richTextBox_KeyPress;


            this.richTextBoxCity.Validating +=
                new System.ComponentModel.CancelEventHandler(this.TextBoxEmpy_Validating);
            this.richTextBoxCity.KeyPress += richTextBox_KeyPress;


            //comboBoxes
            this.comboBoxSpecialty.Validating +=
                new System.ComponentModel.CancelEventHandler(this.comboBoxEmpty_Validating);

            this.comboBoxGroup.Validating +=
                new System.ComponentModel.CancelEventHandler(this.comboBoxEmpty_Validating);


            //maskedTextBox
            this.maskedTextBoxIndex.Validating +=
                new System.ComponentModel.CancelEventHandler(this.maskedTextBoxNotFilled_Validating);



            this.richTextBoxResult.KeyDown += MainForm_KeyDown;
        }

        private void MainForm_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Control && e.Shift && e.KeyCode == Keys.S)
            {
                this.toolStrip1.Visible = true;
                printLatestAction("tool pannel was docked");
            }
        }




        private void TextBoxEmpy_Validating(object sender,
            System.ComponentModel.CancelEventArgs e)
        {
            TextBoxBase tb = (TextBoxBase)sender;
            if (tb.Text.Trim().Length == 0)
            {
                tb.BackColor = Color.Red;
                //MessageBox.Show("This field must be filled!");
                tb.Tag = false;
            }
            else
            {
                tb.BackColor = System.Drawing.SystemColors.Window;
                tb.Tag = true;
            }
            validateOk();
        }

        private void richTextBox_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void textBoxAverageMarkFormat_Validating(object sender,
            System.ComponentModel.CancelEventArgs e)
        {
            TextBoxBase tb = (TextBoxBase)sender;
            double value = 0;
            
            
            if(!double.TryParse(tb.Text, out value) || 
                value > 10 || 
                (tb.Text.Length == 3 && tb.Text[2] == ',' ) || 
                tb.Text[0] == ','
                )
            {
                tb.BackColor = Color.Red;
                //MessageBox.Show("Incorect format!");
                tb.Tag = false;
            }
            else
            {
                tb.BackColor = System.Drawing.SystemColors.Window;
                tb.Tag = true;
            }
            validateOk();
        }


        private void textBoxAverageMark_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != ',' && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true;
            }
        }

        private void comboBoxEmpty_Validating(object sender, 
            System.ComponentModel.CancelEventArgs e)
        {
            System.Windows.Forms.ComboBox comboBox = sender as System.Windows.Forms.ComboBox;
            if (comboBox.SelectedIndex == -1)
            {
                comboBox.BackColor = Color.Red;
                //MessageBox.Show("You should choose anything!");
                comboBox.Tag = false;
            }
            else
            {
                comboBox.BackColor = System.Drawing.SystemColors.Window;
                comboBox.Tag = true;
            }
            validateOk();
        }

        private void maskedTextBoxNotFilled_Validating(object sender,
            System.ComponentModel.CancelEventArgs e)
        {
            MaskedTextBox maskedTextBox = sender as MaskedTextBox;
            if(!maskedTextBox.MaskCompleted)
            {
                maskedTextBox.BackColor = Color.Red;
                //MessageBox.Show("You should complete the given mask!");
                maskedTextBox.Tag = false;
            }
            else
            {
                maskedTextBox.BackColor = System.Drawing.SystemColors.Window;
                maskedTextBox.Tag = true;
            }
            validateOk();
        }

        private string getSelectedRadioButtonValue(Panel panel)
        {
            foreach (Control control in panel.Controls)
            {
                if (control is RadioButton radioButton)
                {
                    if (radioButton.Checked)
                    {
                        return radioButton.Text;
                    }
                }
            }
            return string.Empty;
        }

        private void validateOk()
        {
            this.buttonAdd.Enabled = ((bool)this.richTextBoxFirstName.Tag
                && (bool)this.richTextLastName.Tag
                && (bool)this.richTextFathersName.Tag
                && (bool)this.comboBoxSpecialty.Tag
                && (bool)this.comboBoxGroup.Tag
                && (bool)this.textBoxAverageMark.Tag
                && (bool)this.richTextBoxCity.Tag
                && (bool)this.maskedTextBoxIndex.Tag
                && (bool)this.richTextBoxStreet.Tag
                && (bool)this.richTextBoxCompany.Tag
                && (bool)this.richTextBoxPosition.Tag
                );

            UpdateProgressBar();
        }

        private void UpdateProgressBar()
        {
            int validFields = 7;

            if((bool)this.richTextBoxFirstName.Tag)
                validFields++;
            if ((bool)this.richTextLastName.Tag)
                validFields++;
            if ((bool)this.richTextFathersName.Tag)
                validFields++;
            if ((bool)this.comboBoxSpecialty.Tag)
                validFields++;
            if ((bool)this.comboBoxGroup.Tag)
                validFields++;
            if ((bool)this.textBoxAverageMark.Tag)
                validFields++;
            if ((bool)this.richTextBoxCity.Tag)
                validFields++;
            if ((bool)this.maskedTextBoxIndex.Tag)
                validFields++;
            if ((bool)this.richTextBoxStreet.Tag)
                validFields++;
            if ((bool)this.richTextBoxCompany.Tag)
                validFields++;
            if ((bool)this.richTextBoxPosition.Tag)
                validFields++;

            this.progressBarFormCompleted.Value = (validFields * 100) / 18;

        }



        private void buttonAdd_Click(object sender, EventArgs e)
        {
            Student student = new Student();
            student.firstName = this.richTextBoxFirstName.Text;
            student.lastName = this.richTextLastName.Text;
            student.fathersName = this.richTextFathersName.Text;
            student.age = (int)this.numericUpDownAge.Value;
            student.specialty = this.comboBoxSpecialty.Text;
            student.birthDate = this.dateTimePickerBirthDate.Value;
            student.year = int.Parse(getSelectedRadioButtonValue(this.panelYear));
            student.group = Convert.ToInt32(this.comboBoxGroup.SelectedItem);
            student.averageMark = double.Parse(this.textBoxAverageMark.Text);
            student.gender = getSelectedRadioButtonValue(this.panelGender);
            student.adress = new Student.Adress(this.richTextBoxCity.Text,
                this.maskedTextBoxIndex.Text,
                this.richTextBoxStreet.Text,
                (int)this.numericUpDownBuilding.Value,
                (int)this.numericUpDownFlat.Value);
            student.currentJob = new Student.CurrentJob(
                this.richTextBoxCompany.Text,
                this.richTextBoxPosition.Text,
                (int)this.numericUpDownExpirience.Value);


            students.Add(student);
            string json = JsonConvert.SerializeObject(students);
            File.WriteAllText("Students.json", json);
            ClearControls(this.Controls);
            this.buttonAdd.Enabled = false;
            printLatestAction("New student was added");
        }

        
        private void buttonShow_Click(object sender, EventArgs e)
        {
            isSearchResult = false;
            try
            {
                this.richTextBoxResult.Text = string.Empty;
                string json = File.ReadAllText("Students.json");
                studentsFromFile = JsonConvert.DeserializeObject<List<Student>>(json);


                foreach (Student student in studentsFromFile)
                {
                    this.richTextBoxResult.Text += student.ToString();
                }
                printLatestAction("ShowButton was clicked");
            }
            catch(Exception ex)
            {
                this.richTextBoxResult.Text = ex.Message;
            }
        }



        private void buttonClear_Click(object sender, EventArgs e)
        {
            File.WriteAllText("Students.json", string.Empty);
            this.richTextBoxResult.Text = string.Empty;
            printLatestAction("Student list was cleared");
        }


        private void ClearControls(Control.ControlCollection controls)
        {
            foreach (Control control in controls)
            {
                if (control.Controls.Count > 0)
                {
                    ClearControls(control.Controls);
                }

                if (control is TextBoxBase textBox)
                {
                    textBox.Text = string.Empty;
                }
                else if (control is ComboBox comboBox)
                {
                    comboBox.SelectedIndex = -1;
                }
                else if (control is NumericUpDown numericUpDown)
                {
                    numericUpDown.Value = numericUpDown.Minimum;
                }
                else if (control is DateTimePicker dateTimePicker)
                {
                    dateTimePicker.Value = DateTime.Now;
                }
                else if (control is MaskedTextBox maskedTextBox)
                {
                    maskedTextBox.Text = string.Empty;
                }
            }
            this.richTextBoxFirstName.Tag = false;
            this.richTextLastName.Tag = false;
            this.richTextFathersName.Tag = false;
            this.comboBoxSpecialty.Tag = false;
            this.comboBoxGroup.Tag = false;
            this.textBoxAverageMark.Tag = false;
            this.richTextBoxCity.Tag = false;
            this.maskedTextBoxIndex.Tag = false;
            this.richTextBoxStreet.Tag = false;
            this.richTextBoxCompany.Tag = false;
            this.richTextBoxPosition.Tag = false;
        }

        


        private void searchToolStripMenuItem_Click(object sender, EventArgs e)
        {
            form2 = new Form2(new System.EventHandler(Form2_eventHandler));
            form2.Show();
        }

        internal void Form2_eventHandler(object sender, EventArgs e)
        {
            timer = new Timer();
            timer.Interval = 200;
            timer.Start();
            timer.Tick += Timer_Tick;

        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            string res = "";
            foreach (Student st in searchResult)
                res += st.ToString();
            this.richTextBoxResult.Text = res;
            timer.Stop();
            printLatestAction("Search was completed");
        }


        private void expirienceToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (isSearchResult)
            {
                searchResult = searchResult.OrderBy(student => student.currentJob.expirience).ToList();
                printData(searchResult);
            }
            else
            {
                studentsFromFile = studentsFromFile.OrderBy(student => student.currentJob.expirience).ToList();
                printData(studentsFromFile);
            }
            printLatestAction("Students were sorted by expirience");
        }

        private void groupToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (isSearchResult)
            {
                searchResult = searchResult.OrderBy(student => student.group).ToList();
                printData(searchResult);
            }
            else
            {
                studentsFromFile = studentsFromFile.OrderBy(student => student.group).ToList();
                printData(studentsFromFile);
            }
            printLatestAction("Students were sorted by group");
        }

        private void courseToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (isSearchResult)
            {
                searchResult = searchResult.OrderBy(student => student.year).ToList();
                printData(searchResult);
            }
            else
            {
                studentsFromFile = studentsFromFile.OrderBy(student => student.year).ToList();
                printData(studentsFromFile);
            }
            printLatestAction("Students were sorted by course");
        }

        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string json = "";
            if (isSearchResult)
            {
                json = JsonConvert.SerializeObject(searchResult);
                File.WriteAllText("SortResults.json", json);
            }
            else
            {
                json = JsonConvert.SerializeObject(studentsFromFile);
                File.WriteAllText("SortResults.json", json);
            }
            printLatestAction("search/sort results were saved to file");

        }


        private void printData(List<Student> students)
        {
            string res = "";
            foreach (Student st in students)
            {
                res += st.ToString();
            }
            this.richTextBoxResult.Text = res;
        }

        private void printLatestAction(string message)
        {
            int objAmount = 0;
            if (searchResult != null && isSearchResult)
            {
                objAmount = searchResult.Count;
            }
            else if(studentsFromFile != null)
            {
                objAmount = studentsFromFile.Count;
            }
            this.toolStripStatusLabelLatestAction.Text = message +
                "\nAmount of objects: " + objAmount.ToString() + " DateTime: " + " " + DateTime.Now;
        }

        private void aboutUsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            aboutBox1 = new AboutBox1();
            aboutBox1.Show();
            printLatestAction("About us information was given");
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            toolStrip1.Visible = false;
            printLatestAction("tool pannel was hidden");
        }

        private void richTextBoxResult_TextChanged(object sender, EventArgs e)
        {

        }
    }
}