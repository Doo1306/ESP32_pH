using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32_pH.Convertors
{
    public class pHToColorConverter : IValueConverter
    {
        public object? Convert(object? value, Type targetType, object? parameter, CultureInfo culture)
        {
            if (value is double ph)
            {
                return ph switch
                {
                    <= 0 => Colors.Red,
                    <= 1 => Color.FromArgb("#FF4500"),
                    <= 2 => Color.FromArgb("#FFA500"),
                    <= 3 => Color.FromArgb("#FFFF00"),
                    <= 4 => Color.FromArgb("#ADFF2F"),
                    <= 5 => Color.FromArgb("#32CD32"),
                    <= 6 => Color.FromArgb("#00FF00"),
                    <= 7 => Color.FromArgb("#008000"),
                    <= 8 => Color.FromArgb("#20B2AA"),
                    <= 9 => Color.FromArgb("#00CED1"),
                    <= 10 => Color.FromArgb("#1E90FF"),
                    <= 11 => Color.FromArgb("#0000FF"),
                    <= 12 => Color.FromArgb("#8A2BE2"),
                    <= 13 => Color.FromArgb("#9400D3"),
                    _ => Color.FromArgb("#800080"), // pH = 14
                };
            }
            return Colors.Gray;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }

    }
}
