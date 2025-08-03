using ESP32_pH.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32_pH.Convertors
{
    public class PermissionToVisibilityConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is ePermission currentPermission &&
                parameter is string minVisiblePermission &&
                Enum.TryParse(typeof(ePermission), minVisiblePermission, out var parsedTarget))
            {
                var requiredPermission = (ePermission)parsedTarget;

                //User <= Admin <= Maker;
                return currentPermission <= requiredPermission;
            }

            return false;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) =>
            throw new NotImplementedException();
    }
}
