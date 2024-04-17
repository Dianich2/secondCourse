using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace GlumHub
{
    public class StringToIntConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            // Преобразование int в строку (используется при привязке от объекта к элементу управления)
            if (value is int intValue)
            {
                return intValue.ToString();
            }
            return string.Empty;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            // Преобразование строки в int (используется при привязке от элемента управления к объекту)
            if (value is string stringValue)
            {
                if (int.TryParse(stringValue, out int result))
                {
                    return result;
                }
            }
            return 0; // Возвращаем значение по умолчанию в случае ошибки преобразования
        }
    }
}
