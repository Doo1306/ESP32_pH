using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using ESP32pH.DTOs;
using ESP32pH.Helpers;
using ESP32pH.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ESP32pH.ViewModels
{
    public class SettingViewModel : ObservableObject
    {
        private readonly FireBase firebase;
        public SettingViewModel()
        {
            SaveSettingCommand = new RelayCommand(SaveSettingAct);
            CancelSettingCommand = new RelayCommand(CancelSettingAct);

            //Initialize CurrentLoginModel
            CurrentLoginModel = StreamDataTranfer.Instance.CurrentLoginModel;
            if(StreamDataTranfer.Instance.ESP32Control != null)
            {
                ESP32Control = StreamDataTranfer.Instance.ESP32Control;
                LoadParameters();
            }else
            {
                
            }
            StreamDataTranfer.Instance.EP32DataChanged += Instance_EP32DataChanged;
        }

        private void Instance_EP32DataChanged(string key)
        {
            if (key == Global.pathESP32ControlTest)
            {
                LoadParameters();
                ESP32Control = StreamDataTranfer.Instance.ESP32Control;
            }
        }

        public SettingViewModel(ESP32ControlModel data):base()  // Call the default constructor to initialize common properties
        {         
            var stream = StreamDataTranfer.Instance;
            CurrentLoginModel = stream.CurrentLoginModel;
            stream.LoginChanged += (s, e) =>
            {
                CurrentLoginModel = stream.CurrentLoginModel;
            };
            if(data != null)
            {
                ESP32Control = data;
            }          
            LoadParameters();
        }

        private void LoadParameters()
        {
            this._timeInterval = ESP32Control.TimeInterval;
            this._timeDelay = ESP32Control.TimeDelay;
            this._pHMin = ESP32Control.PH_Min;
            this._pHMax = ESP32Control.PH_Max;
            this._offsetX0 = ESP32Control.OffsetX0;
            this._offsetY0 = ESP32Control.OffsetY0;
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
            LoadParameters();
        }
        private void SaveSettingAct()
        {
            StreamDataTranfer.Instance.ESP32Control.TimeInterval = TimeInterval;
            StreamDataTranfer.Instance.ESP32Control.TimeDelay = TimeDelay;
            StreamDataTranfer.Instance.ESP32Control.OffsetX0 = OffsetX0;
            StreamDataTranfer.Instance.ESP32Control.OffsetY0 = OffsetY0;
            StreamDataTranfer.Instance.ESP32Control.PH_Max = pHMax;
            StreamDataTranfer.Instance.ESP32Control.PH_Min = pHMin;

            StreamDataTranfer.Instance.UpdateDataAsync(Global.pathESP32Control, StreamDataTranfer.Instance.ESP32Control);
        }
        //create a ICommnand to accepted to save setting
        public ICommand SaveSettingCommand { get; set; }
        //create a ICommnand to accepted to cancel setting
        public ICommand CancelSettingCommand { get; set; }
    }
}
