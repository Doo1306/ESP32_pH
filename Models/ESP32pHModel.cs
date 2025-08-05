using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32pH.Models
{
    public class ESP32pHModel
    {
        public DateTime SamplingTime { get; set; }
        public float pH { get; set; }
    }

}
