using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ESP32pH.Models
{
    public class ESP32pHModel
    {
        [JsonProperty("TimeLine")]
        public TimeSpan SamplingTime { get; set; }

        [JsonProperty("pH_Value")]
        public float pH { get; set; }
    }
    public class PhDataPoint
    {
        [JsonPropertyName("TimeLine")]
        public string TimeLine { get; set; }

        [JsonPropertyName("pH_Value")]
        public float pH_Value { get; set; }
    }
    // Sử dụng Dictionary để match với cấu trúc JSON của bạn
    public class PhDataResponse : Dictionary<string, PhDataPoint>
    {
        // Có thể thêm các phương thức helper
        public PhDataPoint GetByTime(string timeKey)
        {
            return this.TryGetValue(timeKey, out var dataPoint) ? dataPoint : null;
        }

        public IEnumerable<PhDataPoint> GetAllDataPoints()
        {
            return this.Values;
        }

        public IEnumerable<string> GetAllTimeKeys()
        {
            return this.Keys;
        }
    }
}
