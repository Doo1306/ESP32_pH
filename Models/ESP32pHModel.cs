using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32pH.Models
{
    public class ESP32pHModel
    {
        public DateTime Day { get; set; }
        public ESP32pHByHourModel pHbyHour {get;set;}
    }

    public class ESP32pHByHourModel
    {
        public string Hour { get; set; }
        public ESP32pHByMiniseconModel pHDataModel { get; set; }
    }
    public class ESP32pHByMiniseconModel
    {
        public DateTime SamplingTime { get; set; }
        public float pH { get; set; }
    }

}
