namespace lab2
{
    partial class Form2
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.labelAverageMark = new System.Windows.Forms.Label();
            this.comboBoxGroupS = new System.Windows.Forms.ComboBox();
            this.labelGroup = new System.Windows.Forms.Label();
            this.labelYear = new System.Windows.Forms.Label();
            this.comboBoxSpecialtyS = new System.Windows.Forms.ComboBox();
            this.labelSpecialty = new System.Windows.Forms.Label();
            this.richTextFathersNameS = new System.Windows.Forms.RichTextBox();
            this.richTextLastNameS = new System.Windows.Forms.RichTextBox();
            this.richTextBoxFirstNameS = new System.Windows.Forms.RichTextBox();
            this.labelFathersName = new System.Windows.Forms.Label();
            this.labelLastName = new System.Windows.Forms.Label();
            this.labelFirstName = new System.Windows.Forms.Label();
            this.comboBoxYearS = new System.Windows.Forms.ComboBox();
            this.buttonSearch = new System.Windows.Forms.Button();
            this.numericUpDownAverage = new System.Windows.Forms.NumericUpDown();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDownAverage)).BeginInit();
            this.SuspendLayout();
            // 
            // labelAverageMark
            // 
            this.labelAverageMark.AutoSize = true;
            this.labelAverageMark.Location = new System.Drawing.Point(133, 384);
            this.labelAverageMark.Name = "labelAverageMark";
            this.labelAverageMark.Size = new System.Drawing.Size(118, 16);
            this.labelAverageMark.TabIndex = 53;
            this.labelAverageMark.Text = "Min average mark:";
            // 
            // comboBoxGroupS
            // 
            this.comboBoxGroupS.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxGroupS.FormattingEnabled = true;
            this.comboBoxGroupS.Items.AddRange(new object[] {
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10"});
            this.comboBoxGroupS.Location = new System.Drawing.Point(136, 353);
            this.comboBoxGroupS.Name = "comboBoxGroupS";
            this.comboBoxGroupS.Size = new System.Drawing.Size(70, 24);
            this.comboBoxGroupS.TabIndex = 52;
            this.comboBoxGroupS.Tag = "false";
            // 
            // labelGroup
            // 
            this.labelGroup.AutoSize = true;
            this.labelGroup.Location = new System.Drawing.Point(133, 334);
            this.labelGroup.Name = "labelGroup";
            this.labelGroup.Size = new System.Drawing.Size(47, 16);
            this.labelGroup.TabIndex = 51;
            this.labelGroup.Text = "Group:";
            // 
            // labelYear
            // 
            this.labelYear.AutoSize = true;
            this.labelYear.Location = new System.Drawing.Point(133, 276);
            this.labelYear.Name = "labelYear";
            this.labelYear.Size = new System.Drawing.Size(39, 16);
            this.labelYear.TabIndex = 50;
            this.labelYear.Text = "Year:";
            // 
            // comboBoxSpecialtyS
            // 
            this.comboBoxSpecialtyS.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxSpecialtyS.FormattingEnabled = true;
            this.comboBoxSpecialtyS.Items.AddRange(new object[] {
            "ПОИТ",
            "ИСИТ",
            "ДЭВИ",
            "ПОиБМС"});
            this.comboBoxSpecialtyS.Location = new System.Drawing.Point(136, 236);
            this.comboBoxSpecialtyS.Name = "comboBoxSpecialtyS";
            this.comboBoxSpecialtyS.Size = new System.Drawing.Size(224, 24);
            this.comboBoxSpecialtyS.TabIndex = 46;
            this.comboBoxSpecialtyS.Tag = "false";
            // 
            // labelSpecialty
            // 
            this.labelSpecialty.AutoSize = true;
            this.labelSpecialty.Location = new System.Drawing.Point(133, 217);
            this.labelSpecialty.Name = "labelSpecialty";
            this.labelSpecialty.Size = new System.Drawing.Size(66, 16);
            this.labelSpecialty.TabIndex = 45;
            this.labelSpecialty.Text = "Specialty:";
            // 
            // richTextFathersNameS
            // 
            this.richTextFathersNameS.Location = new System.Drawing.Point(136, 174);
            this.richTextFathersNameS.MaxLength = 20;
            this.richTextFathersNameS.Multiline = false;
            this.richTextFathersNameS.Name = "richTextFathersNameS";
            this.richTextFathersNameS.Size = new System.Drawing.Size(224, 31);
            this.richTextFathersNameS.TabIndex = 43;
            this.richTextFathersNameS.Tag = "false";
            this.richTextFathersNameS.Text = "";
            // 
            // richTextLastNameS
            // 
            this.richTextLastNameS.Location = new System.Drawing.Point(136, 109);
            this.richTextLastNameS.MaxLength = 20;
            this.richTextLastNameS.Multiline = false;
            this.richTextLastNameS.Name = "richTextLastNameS";
            this.richTextLastNameS.Size = new System.Drawing.Size(224, 31);
            this.richTextLastNameS.TabIndex = 42;
            this.richTextLastNameS.Tag = "false";
            this.richTextLastNameS.Text = "";
            // 
            // richTextBoxFirstNameS
            // 
            this.richTextBoxFirstNameS.Location = new System.Drawing.Point(136, 47);
            this.richTextBoxFirstNameS.MaxLength = 20;
            this.richTextBoxFirstNameS.Multiline = false;
            this.richTextBoxFirstNameS.Name = "richTextBoxFirstNameS";
            this.richTextBoxFirstNameS.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.richTextBoxFirstNameS.Size = new System.Drawing.Size(224, 31);
            this.richTextBoxFirstNameS.TabIndex = 41;
            this.richTextBoxFirstNameS.Tag = "false";
            this.richTextBoxFirstNameS.Text = "";
            // 
            // labelFathersName
            // 
            this.labelFathersName.AutoSize = true;
            this.labelFathersName.Location = new System.Drawing.Point(133, 155);
            this.labelFathersName.Name = "labelFathersName";
            this.labelFathersName.Size = new System.Drawing.Size(95, 16);
            this.labelFathersName.TabIndex = 40;
            this.labelFathersName.Text = "Father\'s name:";
            // 
            // labelLastName
            // 
            this.labelLastName.AutoSize = true;
            this.labelLastName.Location = new System.Drawing.Point(133, 90);
            this.labelLastName.Name = "labelLastName";
            this.labelLastName.Size = new System.Drawing.Size(72, 16);
            this.labelLastName.TabIndex = 39;
            this.labelLastName.Text = "Last name:";
            // 
            // labelFirstName
            // 
            this.labelFirstName.AutoSize = true;
            this.labelFirstName.Location = new System.Drawing.Point(133, 28);
            this.labelFirstName.Name = "labelFirstName";
            this.labelFirstName.Size = new System.Drawing.Size(79, 16);
            this.labelFirstName.TabIndex = 38;
            this.labelFirstName.Text = "Fisrst name:";
            // 
            // comboBoxYearS
            // 
            this.comboBoxYearS.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxYearS.FormattingEnabled = true;
            this.comboBoxYearS.Items.AddRange(new object[] {
            "1",
            "2",
            "3",
            "4"});
            this.comboBoxYearS.Location = new System.Drawing.Point(136, 295);
            this.comboBoxYearS.Name = "comboBoxYearS";
            this.comboBoxYearS.Size = new System.Drawing.Size(70, 24);
            this.comboBoxYearS.TabIndex = 57;
            this.comboBoxYearS.Tag = "false";
            // 
            // buttonSearch
            // 
            this.buttonSearch.Location = new System.Drawing.Point(122, 470);
            this.buttonSearch.Name = "buttonSearch";
            this.buttonSearch.Size = new System.Drawing.Size(238, 48);
            this.buttonSearch.TabIndex = 58;
            this.buttonSearch.Tag = "false";
            this.buttonSearch.Text = "Search";
            this.buttonSearch.UseVisualStyleBackColor = true;
            this.buttonSearch.Click += new System.EventHandler(this.buttonSearch_Click);
            // 
            // numericUpDownAverage
            // 
            this.numericUpDownAverage.Location = new System.Drawing.Point(136, 413);
            this.numericUpDownAverage.Maximum = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.numericUpDownAverage.Name = "numericUpDownAverage";
            this.numericUpDownAverage.Size = new System.Drawing.Size(79, 22);
            this.numericUpDownAverage.TabIndex = 59;
            this.numericUpDownAverage.Tag = "true";
            this.numericUpDownAverage.Value = new decimal(new int[] {
            4,
            0,
            0,
            0});
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(533, 729);
            this.Controls.Add(this.numericUpDownAverage);
            this.Controls.Add(this.buttonSearch);
            this.Controls.Add(this.comboBoxYearS);
            this.Controls.Add(this.labelAverageMark);
            this.Controls.Add(this.comboBoxGroupS);
            this.Controls.Add(this.labelGroup);
            this.Controls.Add(this.labelYear);
            this.Controls.Add(this.comboBoxSpecialtyS);
            this.Controls.Add(this.labelSpecialty);
            this.Controls.Add(this.richTextFathersNameS);
            this.Controls.Add(this.richTextLastNameS);
            this.Controls.Add(this.richTextBoxFirstNameS);
            this.Controls.Add(this.labelFathersName);
            this.Controls.Add(this.labelLastName);
            this.Controls.Add(this.labelFirstName);
            this.Name = "Form2";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form2";
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDownAverage)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label labelAverageMark;
        private System.Windows.Forms.ComboBox comboBoxGroupS;
        private System.Windows.Forms.Label labelGroup;
        private System.Windows.Forms.Label labelYear;
        private System.Windows.Forms.ComboBox comboBoxSpecialtyS;
        private System.Windows.Forms.Label labelSpecialty;
        private System.Windows.Forms.RichTextBox richTextFathersNameS;
        private System.Windows.Forms.RichTextBox richTextLastNameS;
        private System.Windows.Forms.RichTextBox richTextBoxFirstNameS;
        private System.Windows.Forms.Label labelFathersName;
        private System.Windows.Forms.Label labelLastName;
        private System.Windows.Forms.Label labelFirstName;
        private System.Windows.Forms.ComboBox comboBoxYearS;
        public System.Windows.Forms.Button buttonSearch;
        private System.Windows.Forms.NumericUpDown numericUpDownAverage;
    }
}