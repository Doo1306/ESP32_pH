using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using ESP32pH.DTOs;
using ESP32pH.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ESP32pH.ViewModels
{
    public class LogviewModel: ObservableObject
    {
        public LogviewModel()
        {
            LogCheckCommand = new RelayCommand(LogCheckCommandAct);
            pHReadings = new ObservableCollection<pHReadingModel>();
            StreamDataTranfer.Instance.EP32DataChanged += Instance_EP32DataChanged;
            // Constructor logic can be added here if needed
        }

        private void Instance_EP32DataChanged(string key)
        {
            if (key == Global.pathESP32pHUpdatebByHourLogCheck)
            {
                pHReadings?.Clear();
                foreach (var item in StreamDataTranfer.Instance.ObCollectionESP32pHReadingModel)
                {
                    pHReadings?.Add(new pHReadingModel
                    {
                        pH = item.pH,
                        Timestamp = DateTime.Today + item.SamplingTime,
                    });
                }
                foreach (var item in pHReadings)
                {
                    // Cập nhật chart
                    UpdateChart();
                }
            }
        }

        private void LogCheckCommandAct()
        {
            // tính  ra số giờ bắt đầu và kết thúc
            TimesDayStart = TimesDayStart.Date.Add(TimeHourStart);
            TimesDayEnd = TimesDayEnd.Date.Add(TimeHourEnd);

            int totalHours = (int)(TimesDayEnd - TimesDayStart).TotalHours;
            StreamDataTranfer.Instance.ReadDataByHourLogCheck(TimesDayStart, TimesDayEnd);
        }

        // Ngày giờ bắt đầu = ngày hôm qua, giờ hiện tại
        private DateTime _timesDayStart = DateTime.Now.AddDays(-1);
        public DateTime TimesDayStart
        {
            get => _timesDayStart;
            set
            {
                if (_timesDayStart != value)
                {
                    _timesDayStart = value;
                    OnPropertyChanged(nameof(TimesDayStart));
                }
            }
        }

        // Ngày giờ kết thúc = ngày hôm nay, giờ hiện tại
        private DateTime _timesDayEnd = DateTime.Now;
        public DateTime TimesDayEnd
        {
            get => _timesDayEnd;
            set
            {
                if (_timesDayEnd != value)
                {
                    _timesDayEnd = value;
                    OnPropertyChanged(nameof(TimesDayEnd));
                }
            }
        }

        // Giờ bắt đầu = giờ hiện tại
        private TimeSpan timeHourStart = DateTime.Now.TimeOfDay;
        public TimeSpan TimeHourStart
        {
            get => timeHourStart;
            set
            {
                if (timeHourStart != value)
                {
                    timeHourStart = value;
                    OnPropertyChanged(nameof(TimeHourStart));
                }
            }
        }

        // Giờ kết thúc = giờ hiện tại
        private TimeSpan timeHourEnd = DateTime.Now.TimeOfDay;
        public TimeSpan TimeHourEnd
        {
            get => timeHourEnd;
            set
            {
                if (timeHourEnd != value)
                {
                    timeHourEnd = value;
                    OnPropertyChanged(nameof(TimeHourEnd));
                }
            }
        }
        public ICommand LogCheckCommand { get; set; }


        private ObservableCollection<pHReadingModel> _pHReadings;
        public ObservableCollection<pHReadingModel> pHReadings
        {
            get => _pHReadings;
            set
            {
                _pHReadings = value;              
                OnPropertyChanged(nameof(pHReadings));
                OnPropertyChanged(nameof(ChartDrawableLogCheck));
            }
        }
        private IDrawable _chartDrawableLogCheck;
        public IDrawable ChartDrawableLogCheck
        {
            get => _chartDrawableLogCheck;
            set
            {
                _chartDrawableLogCheck = value;
                OnPropertyChanged(nameof(ChartDrawableLogCheck));
            }
        }

        private void UpdateChart()
        {
            ChartDrawableLogCheck = new pHChartDrawableLogCheck(GetFilteredReadings())
            {

            };
            OnPropertyChanged(nameof(ChartDrawableLogCheck));
        }
        private ObservableCollection<pHReadingModel> GetFilteredReadings()
        {
            if (pHReadings == null || !pHReadings.Any())
                return pHReadings ?? new ObservableCollection<pHReadingModel>();

            DateTime cutoffTime = TimeRange switch
            {
                "Live" => DateTime.Now.AddMinutes(-15),
                "15M" => DateTime.Now.AddMinutes(-15),
                "30M" => DateTime.Now.AddMinutes(-30),
                "1H" => DateTime.Now.AddHours(-1),
                "2H" => DateTime.Now.AddHours(-2),
                "6H" => DateTime.Now.AddHours(-6),
                _ => DateTime.Now.AddHours(-1)
            };

            // Tạo bản sao trước khi lọc để tránh lỗi "Collection was modified"
            var snapshot = pHReadings.ToArray();

            var filtered = snapshot.Where(r => r.Timestamp >= cutoffTime).ToList();

            // Đảm bảo dữ liệu được sắp xếp theo thời gian
            filtered = filtered.OrderBy(r => r.Timestamp).ToList();

            return new ObservableCollection<pHReadingModel>(filtered);
        }
        private string _timeRange = "1H";
        public string TimeRange
        {
            get => _timeRange;
            set
            {
                _timeRange = value;
                OnPropertyChanged(nameof(TimeRange));
            }
        }
        private void ChangeTimeRange(string range)
        {
            TimeRange = range;
            int count = range switch
            {
                "Live" => 1,
                "15M" => 1,
                "30M" => 1,
                "1H" => 1,
                "2H" => 2,
                "6H" => 6,
                _ => 1
            };
            // Cập nhật chart với TimeRange mới
            UpdateChart();
        }

    }



    public class pHChartDrawableLogCheck : IDrawable
    {
        private readonly ObservableCollection<pHReadingModel> _readings;
        private readonly float _margin = 40f;
        private readonly float _topMargin = 10f;

        // Auto scale and zoom properties
        public double ZoomLevel { get; set; } = 1.0;
        public bool IsAutoScale { get; set; } = true;
        public double ManualMinpH { get; set; } = 0;
        public double ManualMaxpH { get; set; } = 14;

        private double _effectiveMinpH;
        private double _effectiveMaxpH;

        public pHChartDrawableLogCheck(ObservableCollection<pHReadingModel> readings)
        {
            _readings = readings ?? new ObservableCollection<pHReadingModel>();
            CalculateEffectiveRange();
        }

        private void CalculateEffectiveRange()
        {
            if (!_readings.Any())
            {
                _effectiveMinpH = 0;
                _effectiveMaxpH = 14;
                return;
            }

            if (IsAutoScale)
            {
                var minpH = _readings.Min(r => r.pH);
                var maxpH = _readings.Max(r => r.pH);

                // Add padding (10% of range, minimum 0.5)
                var range = maxpH - minpH;
                var padding = Math.Max(range * 0.3, 0.5);

                _effectiveMinpH = Math.Max(0, minpH - padding);
                _effectiveMaxpH = Math.Min(14, maxpH + padding);

                // Ensure minimum range of 2 pH units for better visibility
                if (_effectiveMaxpH - _effectiveMinpH < 2)
                {
                    var center = (_effectiveMinpH + _effectiveMaxpH) / 2;
                    _effectiveMinpH = Math.Max(0, center - 1);
                    _effectiveMaxpH = Math.Min(14, center + 1);
                }
            }
            else
            {
                _effectiveMinpH = ManualMinpH;
                _effectiveMaxpH = ManualMaxpH;
            }

            // Apply zoom
            if (ZoomLevel != 1.0)
            {
                var center = (_effectiveMinpH + _effectiveMaxpH) / 2;
                var range = (_effectiveMaxpH - _effectiveMinpH) / ZoomLevel;

                _effectiveMinpH = Math.Max(0, center - range / 2);
                _effectiveMaxpH = Math.Min(14, center + range / 2);
            }
        }

        public void Draw(ICanvas canvas, RectF dirtyRect)
        {
            CalculateEffectiveRange();

            if (_readings == null || _readings.Count == 0)
            {
                DrawNoDataMessage(canvas, dirtyRect);
                return;
            }

            // Clear background with a subtle gradient
            canvas.FillColor = Color.FromArgb("#F8F9FA");
            canvas.FillRectangle(dirtyRect);

            // Calculate chart area
            var chartRect = new RectF(
                dirtyRect.X + _margin,
                dirtyRect.Y + _topMargin,
                dirtyRect.Width - 2 * _margin,
                dirtyRect.Height - _margin - _topMargin
            );

            // Draw chart components in order
            DrawTitle(canvas, dirtyRect);
            DrawpHZones(canvas, chartRect);
            DrawGrid(canvas, chartRect);
            DrawAxes(canvas, chartRect, dirtyRect);
            DrawDataLine(canvas, chartRect);
            DrawDataPoints(canvas, chartRect);
            DrawCurrentValue(canvas, chartRect);
            DrawStatistics(canvas, dirtyRect, chartRect);
            DrawZoomInfo(canvas, dirtyRect);
            DrawMinMaxLines(canvas, chartRect);
        }

        private void DrawTitle(ICanvas canvas, RectF dirtyRect)
        {
            canvas.FontSize = 18;
            canvas.FontColor = Colors.DarkSlateGray;
            var title = IsAutoScale ? "pH Monitoring Chart" : "pH Monitoring Chart";
            canvas.DrawString(title, dirtyRect.Width / 2, 20, HorizontalAlignment.Center);
        }

        private void DrawZoomInfo(ICanvas canvas, RectF dirtyRect)
        {
            canvas.FontSize = 10;
            canvas.FontColor = Colors.Gray;

            var zoomText = $"Zoom: {ZoomLevel:F1}x | Range: {_effectiveMinpH:F1} - {_effectiveMaxpH:F1} pH";
            canvas.DrawString(zoomText, dirtyRect.Width - 10, 35, HorizontalAlignment.Right);
        }

        private void DrawStatistics(ICanvas canvas, RectF dirtyRect, RectF chartRect)
        {
            if (!_readings.Any()) return;

            var readings = _readings.Select(r => r.pH).ToList();
            var min = readings.Min();
            var max = readings.Max();
            var avg = readings.Average();
            var current = _readings.Last().pH;

            canvas.FontSize = 12;
            canvas.FontColor = Colors.DarkSlateGray;

            var statsY = chartRect.Bottom - 40;
            var statsSpacing = dirtyRect.Width / 5;

            float boxWidth = statsSpacing * 0.9f;
            float boxHeight = 35;

            void DrawBox(string title, string value, Color borderColor, Color textColor, float x)
            {
                var rect = new RectF(x, statsY, boxWidth, boxHeight);

                // Không fill màu để nền trong suốt
                // canvas.FillColor = Colors.Transparent; // Có thể dùng nếu muốn đảm bảo

                // Vẽ viền
                canvas.StrokeColor = borderColor;
                canvas.StrokeSize = 2;
                canvas.DrawRoundedRectangle(rect, 5);

                // Vẽ chữ
                canvas.FontColor = Colors.DarkSlateGray;
                canvas.DrawString(title, rect.Center.X, rect.Top + 10, HorizontalAlignment.Center);

                canvas.FontColor = textColor;
                canvas.DrawString(value, rect.Center.X, rect.Top + 25, HorizontalAlignment.Center);
            }

            // Draw all boxes in row
            DrawBox("Current", $"{current:F2}", Color.FromArgb("#E3F2FD"), Colors.Blue, statsSpacing * 0.5f);
            DrawBox("Min", $"{min:F2}", Color.FromArgb("#FFF3E0"), Colors.Orange, statsSpacing * 1.6f);
            DrawBox("Max", $"{max:F2}", Color.FromArgb("#E8F5E8"), Colors.Green, statsSpacing * 2.7f);
            DrawBox("Avg", $"{avg:F2}", Color.FromArgb("#F3E5F5"), Colors.Purple, statsSpacing * 3.8f);
        
        }

        private void DrawGrid(ICanvas canvas, RectF chartRect)
        {
            canvas.StrokeColor = Color.FromArgb("#E0E0E0");
            canvas.StrokeSize = 0.5f;

            // Calculate grid interval based on effective range
            var pHRange = _effectiveMaxpH - _effectiveMinpH;
            var gridInterval = pHRange switch
            {
                <= 2 => 0.2,
                <= 4 => 0.5,
                <= 8 => 1.0,
                _ => 2.0
            };

            // Horizontal grid lines (pH levels)
            var startpH = Math.Ceiling(_effectiveMinpH / gridInterval) * gridInterval;
            for (var pH = startpH; pH <= _effectiveMaxpH; pH += gridInterval)
            {
                var y = CalculateYPosition(pH, chartRect);
                canvas.DrawLine(chartRect.Left, y, chartRect.Right, y);
            }

            // Vertical grid lines (time intervals)
            int timeIntervals = 6;
            for (int i = 0; i <= timeIntervals; i++)
            {
                var x = chartRect.Left + (i * chartRect.Width / timeIntervals);
                canvas.DrawLine(x, chartRect.Top, x, chartRect.Bottom + 10);
            }
        }

        private void DrawAxes(ICanvas canvas, RectF chartRect, RectF dirtyRect)
        {
            canvas.StrokeColor = Colors.Black;
            canvas.StrokeSize = 2f;

            // Y-axis
            canvas.DrawLine(chartRect.Left, chartRect.Top, chartRect.Left, chartRect.Bottom);

            // X-axis  
            canvas.DrawLine(chartRect.Left, chartRect.Bottom, chartRect.Right, chartRect.Bottom);

            // Y-axis labels (pH values)
            canvas.FontColor = Colors.Black;
            canvas.FontSize = 10;

            var pHRange = _effectiveMaxpH - _effectiveMinpH;
            var labelInterval = pHRange switch
            {
                <= 2 => 0.5,
                <= 4 => 1.0,
                <= 8 => 2.0,
                _ => 3.0
            };

            var startpH = Math.Ceiling(_effectiveMinpH / labelInterval) * labelInterval;
            for (var pH = startpH; pH <= _effectiveMaxpH; pH += labelInterval)
            {
                var y = CalculateYPosition(pH, chartRect);
                canvas.DrawString(pH.ToString("F1"), chartRect.Left - 25, y + 3, HorizontalAlignment.Center);
            }

            // X-axis labels (time)
            if (_readings.Any())
            {
                var minTime = _readings.Min(r => r.Timestamp);
                var maxTime = _readings.Max(r => r.Timestamp);
                var timeSpan = maxTime - minTime;

                for (int i = 0; i <= 4; i++)
                {
                    var x = chartRect.Left + (i * chartRect.Width / 4);
                    var time = minTime.AddTicks(i * timeSpan.Ticks / 4);
                    var timeLabel = time.ToString("HH:mm");

                    canvas.DrawString(timeLabel, x, chartRect.Bottom + 15, HorizontalAlignment.Center);
                }
            }

            // Axis titles
            canvas.FontSize = 12;
            canvas.FontColor = Colors.DarkSlateGray;

            //// Y-axis title (rotated)
            //canvas.DrawString("pH", 15, 25, HorizontalAlignment.Center);

            //// X-axis title
            //canvas.DrawString("Time", dirtyRect.Width - 20, dirtyRect.Height - 15, HorizontalAlignment.Center);
        }

        private void DrawpHZones(ICanvas canvas, RectF chartRect)
        {
            // Only draw zones that are visible in current range
            var acidicMin = Math.Max(0, _effectiveMinpH);
            var acidicMax = Math.Min(6, _effectiveMaxpH);
            var normalMin = Math.Max(6, _effectiveMinpH);
            var normalMax = Math.Min(8, _effectiveMaxpH);
            var basicMin = Math.Max(8, _effectiveMinpH);
            var basicMax = Math.Min(14, _effectiveMaxpH);

            // Acidic zone (visible portion)
            if (acidicMax > acidicMin)
            {
                var acidicTop = CalculateYPosition(acidicMax, chartRect);
                var acidicBottom = CalculateYPosition(acidicMin, chartRect);
                canvas.FillColor = Color.FromArgb("#15FF6B6B");
                canvas.FillRectangle(chartRect.Left, acidicTop, chartRect.Width, acidicBottom - acidicTop);

                if (acidicBottom - acidicTop > 20)
                {
                    canvas.FontSize = 10;
                    canvas.FontColor = Color.FromArgb("#666666");
                    canvas.DrawString("Acid", chartRect.Left + 15, acidicTop + 15, HorizontalAlignment.Center);
                }
            }

            // Normal zone (visible portion)
            if (normalMax > normalMin)
            {
                var normalTop = CalculateYPosition(normalMax, chartRect);
                var normalBottom = CalculateYPosition(normalMin, chartRect);
                canvas.FillColor = Color.FromArgb("#1595E1A3");
                canvas.FillRectangle(chartRect.Left, normalTop, chartRect.Width, normalBottom - normalTop);

                if (normalBottom - normalTop > 20)
                {
                    canvas.FontSize = 10;
                    canvas.FontColor = Color.FromArgb("#666666");
                    canvas.DrawString("Normal", chartRect.Left + 15, normalTop + 15, HorizontalAlignment.Center);
                }
            }

            // Basic zone (visible portion)
            if (basicMax > basicMin)
            {
                var basicTop = CalculateYPosition(basicMax, chartRect);
                var basicBottom = CalculateYPosition(basicMin, chartRect);
                canvas.FillColor = Color.FromArgb("#154ECDC4");
                canvas.FillRectangle(chartRect.Left, basicTop, chartRect.Width, basicBottom - basicTop);

                if (basicBottom - basicTop > 20)
                {
                    canvas.FontSize = 10;
                    canvas.FontColor = Color.FromArgb("#666666");
                    canvas.DrawString("Base", chartRect.Left + 15, basicTop + 15, HorizontalAlignment.Center);
                }
            }
        }

        private void DrawDataLine(ICanvas canvas, RectF chartRect)
        {
            if (_readings.Count < 2) return;

            var points = CalculateDataPoints(chartRect);
            var visiblePoints = points.Where(p => p.Y >= chartRect.Top && p.Y <= chartRect.Bottom).ToList();

            if (visiblePoints.Count < 2) return;

            // Draw smooth gradient line
            canvas.StrokeColor = Colors.DodgerBlue;
            canvas.StrokeSize = 3f;

            // Draw connected lines
            for (int i = 0; i < visiblePoints.Count - 1; i++)
            {
                canvas.DrawLine(visiblePoints[i], visiblePoints[i + 1]);
            }

            // Draw subtle area under curve
            if (visiblePoints.Count > 1)
            {
                canvas.FillColor = Color.FromArgb("#20007ACC");

                for (int i = 0; i < visiblePoints.Count - 1; i++)
                {
                    var p1 = visiblePoints[i];
                    var p2 = visiblePoints[i + 1];

                    // Clamp to chart area
                    var y1 = Math.Max(chartRect.Top, Math.Min(chartRect.Bottom, p1.Y));
                    var y2 = Math.Max(chartRect.Top, Math.Min(chartRect.Bottom, p2.Y));

                    canvas.FillRectangle(p1.X, y1, p2.X - p1.X, chartRect.Bottom - y1);
                }
            }
        }

        private void DrawDataPoints(ICanvas canvas, RectF chartRect)
        {
            var points = CalculateDataPoints(chartRect);

            for (int i = 0; i < points.Count; i++)
            {
                var reading = _readings[i];
                var point = points[i];

                // Only draw points that are visible
                if (point.Y < chartRect.Top || point.Y > chartRect.Bottom) continue;

                // Point color based on pH status
                canvas.FillColor = reading.StatusColor;
                canvas.FillCircle(point.X, point.Y, 1);

                // White outline
                canvas.StrokeColor = Colors.White;
                canvas.StrokeSize = 2f;
                canvas.DrawCircle(point.X, point.Y, 1);
            }
        }

        private void DrawCurrentValue(ICanvas canvas, RectF chartRect)
        {
            if (!_readings.Any()) return;

            var currentReading = _readings.Last();
            var points = CalculateDataPoints(chartRect);
            var currentPoint = points.Last();

            // Only draw if visible
            if (currentPoint.Y < chartRect.Top || currentPoint.Y > chartRect.Bottom) return;

            // Draw pulsing current value indicator
            canvas.FillColor = Color.FromArgb("#80FF4444");
            canvas.FillCircle(currentPoint.X, currentPoint.Y, 8);

            canvas.FillColor = Colors.Red;
            canvas.FillCircle(currentPoint.X, currentPoint.Y, 5);

            // Draw current value callout
            canvas.FillColor = Colors.White;
            canvas.StrokeColor = currentReading.StatusColor;
            canvas.StrokeSize = 2f;

            var calloutRect = new RectF(currentPoint.X - 60, currentPoint.Y - 45, 60, 30);
            canvas.FillRoundedRectangle(calloutRect, 8);
            canvas.DrawRoundedRectangle(calloutRect, 8);

            // Current pH value
            canvas.FontColor = Colors.Black;
            canvas.FontSize = 10;
            canvas.DrawString($"Current", currentPoint.X - 30, currentPoint.Y - 50, HorizontalAlignment.Center);
            canvas.FontSize = 13;
            canvas.FontColor = currentReading.StatusColor;
            canvas.DrawString($"pH {currentReading.pH:F2}", currentPoint.X - 30, currentPoint.Y - 22, HorizontalAlignment.Center);
        }

        private List<PointF> CalculateDataPoints(RectF chartRect)
        {
            if (!_readings.Any()) return new List<PointF>();

            var points = new List<PointF>();
            var minTime = _readings.Min(r => r.Timestamp);
            var maxTime = _readings.Max(r => r.Timestamp);
            var timeRange = (maxTime - minTime).TotalSeconds;

            if (timeRange == 0) timeRange = 1; // Prevent division by zero

            // Đảm bảo dữ liệu được sắp xếp theo thời gian để vẽ đường thẳng
            var sortedReadings = _readings.OrderBy(r => r.Timestamp).ToList();

            foreach (var reading in sortedReadings)
            {
                var x = chartRect.Left +
                    ((reading.Timestamp - minTime).TotalSeconds / timeRange) * chartRect.Width;
                var y = CalculateYPosition(reading.pH, chartRect);

                points.Add(new PointF((float)x, y));
            }

            return points;
        }

        private float CalculateYPosition(double pH, RectF chartRect)
        {
            // Calculate position based on effective range
            var normalizedPosition = (_effectiveMaxpH - pH) / (_effectiveMaxpH - _effectiveMinpH);
            return chartRect.Top + (float)(normalizedPosition * chartRect.Height);
        }

        private void DrawNoDataMessage(ICanvas canvas, RectF dirtyRect)
        {
            canvas.FillColor = Color.FromArgb("#F8F9FA");
            canvas.FillRectangle(dirtyRect);

            canvas.FontSize = 16;
            canvas.FontColor = Colors.Gray;
            canvas.DrawString("No pH data available",
                dirtyRect.Width / 2, dirtyRect.Height / 2, HorizontalAlignment.Center);

            canvas.FontSize = 12;
            canvas.DrawString("Waiting for sensor data...",
                dirtyRect.Width / 2, dirtyRect.Height / 2 + 25, HorizontalAlignment.Center);
        }

        private void DrawMinMaxLines(ICanvas canvas, RectF chartRect)
        {
            var latestReading = _readings.LastOrDefault();
            if (latestReading == null) return;

            // Vẽ giới hạn pH Min (đường màu đỏ)
            if (latestReading.pHMin != null)
            {
                double pHMin = latestReading.pHMin;
                float yMin = CalculateYPosition(pHMin, chartRect);
                canvas.StrokeColor = Colors.Red;
                canvas.StrokeSize = 1f;
                canvas.DrawLine(chartRect.Left, yMin, chartRect.Right, yMin);
                canvas.FontSize = 10;
                canvas.FontColor = Colors.Red;
                canvas.DrawString($"Giới hạn Min: {pHMin:F1}", chartRect.Left + 85, yMin - 5, HorizontalAlignment.Right);
            }

            // Vẽ giới hạn pH Max (đường màu xanh lá)
            if (latestReading.pHMax != null)
            {
                double pHMax = latestReading.pHMax;
                float yMax = CalculateYPosition(pHMax, chartRect);
                canvas.StrokeColor = Colors.Green;
                canvas.StrokeSize = 1f;
                canvas.DrawLine(chartRect.Left, yMax, chartRect.Right, yMax);
                canvas.FontSize = 10;
                canvas.FontColor = Colors.Green;
                canvas.DrawString($"Giới hạn Max: {pHMax:F1}", chartRect.Left + 85, yMax - 5, HorizontalAlignment.Right);
            }
        }
    }
}
