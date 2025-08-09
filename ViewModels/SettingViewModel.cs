using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using ESP32pH.DTOs;
using ESP32pH.Helpers;
using ESP32pH.Models;
using System;
using System.Collections.Generic;
using System.IO;
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
            var stream = StreamDataTranfer.Instance;
            CurrentLoginModel = stream.CurrentLoginModel;
            stream.LoginChanged += (s, e) =>
            {
                CurrentLoginModel = stream.CurrentLoginModel;
            };
            if (StreamDataTranfer.Instance.ESP32Control != null)
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
            if (key == Global.pathESP32Control)
            {             
                ESP32Control = StreamDataTranfer.Instance.ESP32Control;
                LoadParameters();
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
            this.TimeInterval = ESP32Control.TimeInterval;
            this.TimeDelay = ESP32Control.TimeDelay;
            this.pHMin = ESP32Control.PH_Min;
            this.pHMax = ESP32Control.PH_Max;
            this.OffsetX0 = ESP32Control.OffsetX0;
            this.OffsetY0 = ESP32Control.OffsetY0;
            this.OffsetX1 = 0;
            this.OffsetY1 = 0;
            this.OffsetX2 = 0;
            this.OffsetY2 = 0;
            this.TestMode = ESP32Control.TestMode;
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
        private float _offsetX1;
        public float OffsetX1
        {
            get { return _offsetX1; }
            set
            {
                if (_offsetX1 != value)
                {
                    _offsetX1 = value;
                    OnPropertyChanged(nameof(OffsetX1));
                }
            }
        }
        private float _offsetY1;
        public float OffsetY1
        {
            get { return _offsetY1; }
            set
            {
                if (_offsetY1 != value)
                {
                    _offsetY1 = value;
                    OnPropertyChanged(nameof(OffsetY1));
                }
            }
        }
        private float _offsetX2;
        public float OffsetX2
        {
            get { return _offsetX2; }
            set
            {
                if (_offsetX2 != value)
                {
                    _offsetX2 = value;
                    OnPropertyChanged(nameof(OffsetX2));
                }
            }
        }
        private float _offsetY2;
        public float OffsetY2
        {
            get { return _offsetY2; }
            set
            {
                if (_offsetY2 != value)
                {
                    _offsetY2 = value;
                    OnPropertyChanged(nameof(OffsetY2));
                }
            }
        }
        private bool _testMode;
        public bool TestMode
        {
            get => _testMode;
            set
            {
                if (_testMode != value)
                {
                    _testMode = value;
                    UpdateDataSync();
                    OnPropertyChanged(nameof(TestMode));
                }
            }
        }
        private void CancelSettingAct()
        {
            LoadParameters();
        }
        private void SaveSettingAct()
        {
            UpdateDataSync();
        }

        private void UpdateDataSync()
        {
            StreamDataTranfer.Instance.ESP32Control.TimeInterval = TimeInterval;
            StreamDataTranfer.Instance.ESP32Control.TimeDelay = TimeDelay;
            StreamDataTranfer.Instance.ESP32Control.OffsetX0 = OffsetX0;
            StreamDataTranfer.Instance.ESP32Control.OffsetY0 = OffsetY0;
            StreamDataTranfer.Instance.ESP32Control.PH_Max = pHMax;
            StreamDataTranfer.Instance.ESP32Control.PH_Min = pHMin;
            StreamDataTranfer.Instance.ESP32Control.TestMode = TestMode;
            StreamDataTranfer.Instance.UpdateDataAsync($"{Global.pathESP32Control}{"/Transfer"}", StreamDataTranfer.Instance.ESP32Control);
        }
        //create a ICommnand to accepted to save setting
        public ICommand SaveSettingCommand { get; set; }
        //create a ICommnand to accepted to cancel setting
        public ICommand CancelSettingCommand { get; set; }
    }
}
