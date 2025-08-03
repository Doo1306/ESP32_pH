using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32_pH.Models
{
    public class ESP32ControlModel
    {
        public bool Buzze{ get;set;}
        public int Control_Mode{ get;set;}
        public bool Door_Close_Req{ get;set;}
        public bool Door_Open_Req{ get;set;}
        public bool IsAlarm{ get;set;}
        public bool IsDoor_Close{ get;set;}
        public bool IsDoor_Open{ get;set;}
        public float PH_Max{ get;set;}
        public float PH_Min{ get;set;}
        public int TimeDelay{ get;set;}
        public int TimeInterval{ get;set;}
        public float OffsetX0{ get; set; }
        public float OffsetY0{ get; set; }      

    }
}
