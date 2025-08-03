using ESP32_pH.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32_pH.DTOs
{
    public class StreamDataTranfer 
    {
        private static StreamDataTranfer _instance;
        public static StreamDataTranfer Instance
        {
            get
            {
                if(_instance == null)               
                    _instance = new StreamDataTranfer();
                   return _instance;                
            }
            set
            {
                _instance = value;
            }
        }
        
        public StreamDataTranfer() 
        {
            
        }
        public string FireBaseToken { get; set; }
        public ObservableCollection<LoginModel> LoginModels { get; set; }
        public LoginModel CurrentLoginModel { get; set; }
    }
}
