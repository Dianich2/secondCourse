using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab1
{
    public partial class Form1 : Form
    {

        private long consonatAmount = 0;
        private long vowelAmount = 0;

        private static char[] consonants =
        {
        'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z',
        'б', 'в', 'г', 'д', 'ж', 'з', 'й', 'к', 'л', 'м', 'н', 'п', 'р', 'с', 'т', 'ф', 'х', 'ц', 'ч', 'ш', 'щ'
        };
        private static char[] vowels =
         {
        'a', 'e', 'i', 'o', 'u',
        'а', 'е', 'ё', 'и', 'о', 'у', 'ы', 'э', 'ю', 'я'
        };


        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            richTextBox1.Text = richTextBox1.Text.Replace(richTextBox2.Text, richTextBox4.Text);
        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {
            string input = richTextBox1.Text;
            label6.Text = input.Length.ToString();

            string[] words = input.Split(new char[] { ' ', '\n'}, StringSplitOptions.RemoveEmptyEntries);
            string[] sentences = input.Split(new char[] { '.', '!', '?' }, StringSplitOptions.RemoveEmptyEntries);

            consonatAmount = 0;
            vowelAmount = 0;

            foreach (char ch in richTextBox1.Text)
            {
                if (consonants.Contains(ch))
                    consonatAmount++;
                else if(vowels.Contains(ch))
                    vowelAmount++;
            }
            label8.Text = consonatAmount.ToString();
            label10.Text = vowelAmount.ToString();
            label13.Text = words.Length.ToString();
            label15.Text = sentences.Length.ToString();
        }

        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {
            if(richTextBox2.Text.Length > 0 && richTextBox4.Text.Length > 0)
            {
                button1.Enabled = true;
            }
            else
            {
                button1.Enabled = false;
            }
        }

        private void richTextBox4_TextChanged(object sender, EventArgs e)
        {
            if (richTextBox2.Text.Length > 0 && richTextBox4.Text.Length > 0)
            {
                button1.Enabled = true;
            }
            else
            {
                button1.Enabled = false;
            }
        }

        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {
            if (richTextBox3.Text.Length > 0)
            {
                button2.Enabled = true;
            }
            else
            {
                button2.Enabled = false;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            richTextBox1.Text = richTextBox1.Text.Replace(richTextBox3.Text, string.Empty);
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true;
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            label4.Text = "is ";
            if (textBox1.Text.Length == 0)
                return;
            long index = long.Parse(textBox1.Text);
            if (textBox1.Text.Length > 0 && index <= richTextBox1.Text.Length)
                label4.Text += richTextBox1.Text[(int)index-1];
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
