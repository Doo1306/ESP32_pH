using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32pH.Models
{
    public class ESP32ControlModel
    {
        [JsonProperty("Buzze")]
        public bool Buzze { get; set; }

        [JsonProperty("Control_Mode")]
        public int ControlMode { get; set; }

        [JsonProperty("Door_Close_Req")]
        public bool DoorCloseReq { get; set; }

        [JsonProperty("Door_Open_Req")]
        public bool DoorOpenReq { get; set; }

        [JsonProperty("IsAlarm")]
        public bool IsAlarm { get; set; }

        [JsonProperty("IsDoor_Close")]
        public bool IsDoorClose { get; set; }

        [JsonProperty("IsDoor_Open")]
        public bool IsDoorOpen { get; set; }

        [JsonProperty("OffsetX0")]
        public float OffsetX0 { get; set; }

        [JsonProperty("OffsetY0")]
        public float OffsetY0 { get; set; }

        [JsonProperty("PH_Max")]
        public float PH_Max { get; set; }

        [JsonProperty("PH_Min")]
        public float PH_Min { get; set; }

        [JsonProperty("TimeDelay")]
        public int TimeDelay { get; set; }

        [JsonProperty("TimeInterval")]
        public int TimeInterval { get; set; }
        [JsonProperty("TestMode")]
        public bool TestMode { get; set; }
    }
}
