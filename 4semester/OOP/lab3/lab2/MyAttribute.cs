using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab2
{
    public class MyAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value != null)
            {
                string stringValue = value.ToString();

                if (stringValue.Length != 6)
                {
                    return new ValidationResult("String length must be 6");
                }

                foreach (char c in stringValue)
                {
                    if (!char.IsDigit(c))
                    {
                        return new ValidationResult("This field must contain numbers only");
                    }
                }

                return ValidationResult.Success;
            }

            return ValidationResult.Success;
        }
    }
}
