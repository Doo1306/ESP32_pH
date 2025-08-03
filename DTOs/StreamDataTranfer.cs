using CommunityToolkit.Mvvm.ComponentModel;
using ESP32_pH.Helpers;
using ESP32_pH.Models;
using ESP32_pH.ViewModels;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32_pH.DTOs
{
    public class StreamDataTranfer  : ObservableObject
    {
        private static readonly Lazy<StreamDataTranfer> _instance =
            new Lazy<StreamDataTranfer>(() => new StreamDataTranfer());

        public static StreamDataTranfer Instance => _instance.Value;

        private FireBase firebase;
        
        private StreamDataTranfer()
        {
            firebase = new FireBase(Global.FirebaseBaseUrl, Global.FirebaseAuthToken);
            LoginModels = new ObservableCollection<LoginModel>();
            ESP32Control = new ESP32ControlModel();
        }

        

        public string FireBaseToken { get; set; }
        public ObservableCollection<LoginModel> LoginModels { get; set; }
       
        
        public event EventHandler LoginChanged; 
        private LoginModel _currentLoginModel;
        public LoginModel CurrentLoginModel
        {
            get => _currentLoginModel;
            set
            {
                if (SetProperty(ref _currentLoginModel, value))
                {
                    LoginChanged?.Invoke(this, EventArgs.Empty);
                }
            }
        }

        public ESP32ControlModel ESP32Control { get; internal set; }
        public SettingViewModel SettingViewModel { get; set; }

        public int Initialize()
        {
            CreateSettingComponents();

            return DefSystem.Success;
        }

        private async Task CreateSettingComponents()
        {       
            try
            {
                StreamDataTranfer.Instance.FireBaseToken = await firebase.FirebaseAuthenticLogin(Global.UserNameFirebase, Global.PasswordFirebase);
            }
            catch (Exception err)
            {

            }
            // Load Data FireBase bằng cách gọi đến Helper FireBase 

            ESP32Control = await firebase.GetDataAsync<ESP32ControlModel>(Global.pathESP32Control, StreamDataTranfer.Instance.FireBaseToken);
            SettingViewModel = new SettingViewModel(ESP32Control);
        }   
    }


    public class DefSystem
    {
        public const int Success = 1;
        public const int Failure = -1;
        public const int DataNotFound = 0;
        public const int DataFailed = -2;
    }
}
