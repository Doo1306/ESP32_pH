using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32pH.Models
{
    public class pHReadingModel
    {
        public DateTime Timestamp { get; set; }
        public double pH { get; set; }
        public string Status => UpdateStatusFrompH(pH);
        public Color StatusColor => GetPHColor(pH);
        public double pHMax { get; set; }
        public double pHMin { get; set; }
        public double pHProgress => pH / 14.0;
        public string FormattedTime => Timestamp.ToString("HH:mm:ss");
        public string FormattedDate => Timestamp.ToString("dd/MM/yyyy");
        public string StatusDisplay => $"{Status} (pH {pH:F2})";
        private Color GetPHColor(double ph)
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
        private string UpdateStatusFrompH(double value)
        {
            string Status = string.Empty;
            // Phân loại trạng thái pH theo ngưỡng (bạn có thể tùy chỉnh logic này)
            if (value < 3.0)
            {
                Status = "Strong Acid";            
            }
            else if (value >= 3.0 && value < 6.5)
            {
                Status = "Weak Acid";               
            }
            else if (value >= 6.5 && value <= 7.5)
            {
                Status = "Neutral";
            }
            else if (value > 7.5 && value <= 11.0)
            {
                Status = "Weak Base";
            }
            else // value > 11.0
            {
                Status = "Strong Base";
            }
            return Status;
        }
    }
}
