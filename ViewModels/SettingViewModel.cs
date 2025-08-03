using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using ESP32_pH.DTOs;
using ESP32_pH.Helpers;
using ESP32_pH.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ESP32_pH.ViewModels
{
    public class SettingViewModel : ObservableObject
    {
        private readonly FireBase firebase;
        public SettingViewModel()
        {
            SaveSettingCommand = new RelayCommand(SaveSettingAct);
            CancelSettingCommand = new RelayCommand(CancelSettingAct);

            // Initialize FireBase with base URL and auth token
            firebase = new FireBase(Global.FirebaseBaseUrl, Global.FirebaseAuthToken);

            // Initialize CurrentLoginModel
            CurrentLoginModel = StreamDataTranfer.Instance.CurrentLoginModel;

            // notify when login changed update CurrentLoginModel Permission
            var stream = StreamDataTranfer.Instance;
            CurrentLoginModel = stream.CurrentLoginModel;

            stream.LoginChanged += (s, e) =>
            {
                CurrentLoginModel = stream.CurrentLoginModel;
            };
        }

        public SettingViewModel(ESP32ControlModel data) : this() // Call the default constructor to initialize common properties
        {
            SaveSettingCommand = new RelayCommand(SaveSettingAct);
            CancelSettingCommand = new RelayCommand(CancelSettingAct);
            // Initialize FireBase with base URL and auth token
            firebase = new FireBase(Global.FirebaseBaseUrl, Global.FirebaseAuthToken);
            // Initialize CurrentLoginModel
            CurrentLoginModel = StreamDataTranfer.Instance.CurrentLoginModel;
            // notify when login changed update CurrentLoginModel Permission
            var stream = StreamDataTranfer.Instance;
            CurrentLoginModel = stream.CurrentLoginModel;
            stream.LoginChanged += (s, e) =>
            {
                CurrentLoginModel = stream.CurrentLoginModel;
            };
            ESP32Control = data;
            LoadParameters();
        }

        private void LoadParameters()
        {
            this.TimeInterval = ESP32Control.TimeInterval;
            this.TimeDelay = ESP32Control.TimeDelay;
            this.pHMin = ESP32Control.PH_Min;
            this.pHMax = ESP32Control.PH_Max;
            this.OffsetX0 = ESP32Control.OffsetX0;
            this.OffsetY0 = ESP32Control.OffsetY0;
            // Load other parameters as needed
        }

        private LoginModel _currentLoginModel;
        public LoginModel CurrentLoginModel
        {
            get { return _currentLoginModel; }
            set
            {
                if (_currentLoginModel != value)
                {
                    _currentLoginModel = value;
                    OnPropertyChanged(nameof(CurrentLoginModel));
                }
            }
        }
        private ESP32ControlModel _ESP32Control;
        public ESP32ControlModel ESP32Control
        {
            get { return _ESP32Control; }
            set
            {
                if (_ESP32Control != value)
                {
                    _ESP32Control = value;
                    OnPropertyChanged(nameof(ESP32Control));
                }
            }
        }
        private int _timeInterval;
        public int TimeInterval
        {
            get { return _timeInterval; }
            set
            {
                if (_timeInterval != value)
                {
                    _timeInterval = value;
                    OnPropertyChanged(nameof(TimeInterval));
                }
            }
        }
        private int _timeDelay;
        public int TimeDelay
        {
            get { return _timeDelay; }
            set
            {
                if (_timeDelay != value)
                {
                    _timeDelay = value;
                    OnPropertyChanged(nameof(TimeDelay));
                }
            }
        }
        private float _pHMin;
        public float pHMin
        {
            get { return _pHMin; }
            set
            {
                if (_pHMin != value)
                {
                    _pHMin = value;
                    OnPropertyChanged(nameof(pHMin));
                }
            }
        }
        private float _pHMax;
        public float pHMax
        {
            get { return _pHMax; }
            set
            {
                if (_pHMax != value)
                {
                    _pHMax = value;
                    OnPropertyChanged(nameof(pHMax));
                }
            }
        }

        private float _offsetX0;
        public float OffsetX0
        {
            get { return _offsetX0; }
            set
            {
                if (_offsetX0 != value)
                {
                    _offsetX0 = value;
                    OnPropertyChanged(nameof(OffsetX0));
                }
            }
        }
        private float _offsetY0;
        public float OffsetY0
        {
            get { return _offsetY0; }
            set
            {
                if (_offsetY0 != value)
                {
                    _offsetY0 = value;
                    OnPropertyChanged(nameof(OffsetY0));
                }
            }
        }


        private void CancelSettingAct()
        {
            throw new NotImplementedException();
        }

        private void SaveSettingAct()
        {
            throw new NotImplementedException();
        }


        //create a ICommnand to accepted to save setting
        public ICommand SaveSettingCommand { get; set; }
        //create a ICommnand to accepted to cancel setting
        public ICommand CancelSettingCommand { get; set; }
    }
}
