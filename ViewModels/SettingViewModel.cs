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
            ESP32LogKeepDay = new ESP32LogKeepDay();
            //Initialize CurrentLoginModel
            CurrentLoginModel = StreamDataTranfer.Instance.CurrentLoginModel;
            var stream = StreamDataTranfer.Instance;
            CurrentLoginModel = stream.CurrentLoginModel;
            stream.LoginChanged += (s, e) =>
            {
                CurrentLoginModel = stream.CurrentLoginModel;
            };
            if (StreamDataTranfer.Instance.ESP32ControlFirebaseToESP32 != null)
            {
                ESP32ControlFirebaseP32ToFirebase = StreamDataTranfer.Instance.ESP32ControlFirebaseToESP32;
                LoadParameters();
            }
            else
            {

            }
            StreamDataTranfer.Instance.EP32DataChanged += Instance_EP32DataChanged;
        }

        private void Instance_EP32DataChanged(string key)
        {
            if (key == Global.pathESP32ControlFirebaseToESP32)
            {
                ESP32ControlFirebaseP32ToFirebase = StreamDataTranfer.Instance.ESP32ControlFirebaseToESP32;
                LoadParameters();
            }
            if (key == Global.pathESP32LogKeepDay)
            {
                ESP32LogKeepDay = StreamDataTranfer.Instance.ESP32LogKeepDay;
                StreamDataTranfer.Instance.UpdateDataAsync($"{Global.pathESP32LogKeepDay}", StreamDataTranfer.Instance.ESP32LogKeepDay);
                // xóa data 3 ngày gần nhất theo logkeepday
                DeleteOldDayAsync(ESP32LogKeepDay.LogKeepDay);
                
            }
        }

        public SettingViewModel(ESP32ControlFirebaseToESP32Model data,ESP32LogKeepDay logKeepDay) : base()  // Call the default constructor to initialize common properties
        {
            ESP32LogKeepDay = new ESP32LogKeepDay();
            var stream = StreamDataTranfer.Instance;
            CurrentLoginModel = stream.CurrentLoginModel;
            stream.LoginChanged += (s, e) =>
            {
                CurrentLoginModel = stream.CurrentLoginModel;
            };
            if (data != null)
            {
                ESP32ControlFirebaseP32ToFirebase = data;
            }
            ESP32LogKeepDay = logKeepDay;
            LoadParameters();
        }

        private void LoadParameters()
        {
            this.TimeInterval = ESP32ControlFirebaseP32ToFirebase.TimeInterval;
            this.TimeDelay = ESP32ControlFirebaseP32ToFirebase.TimeDelay;
            this.pHMin = ESP32ControlFirebaseP32ToFirebase.PH_Min;
            this.pHMax = ESP32ControlFirebaseP32ToFirebase.PH_Max;
            this.OffsetX0 = ESP32ControlFirebaseP32ToFirebase.OffsetX0;
            this.OffsetY0 = ESP32ControlFirebaseP32ToFirebase.OffsetY0;
            this.OffsetX1 = 0;
            this.OffsetY1 = 0;
            this.OffsetX2 = 0;
            this.OffsetY2 = 0;
            this.TestMode = ESP32ControlFirebaseP32ToFirebase.TestMode;
            ESP32LogKeepDay = StreamDataTranfer.Instance.ESP32LogKeepDay;
            
            // Load other parameters as needed
        }


        public async Task DeleteOldDayAsync(int logKeepDay)
        {
            string basePath = Global.pathESP32pHReadOne; // bỏ FirebaseBaseUrl ở đây

            using var client = new HttpClient();
            var json = await client.GetStringAsync($"{Global.FirebaseBaseUrl}/{basePath}.json");

            if (string.IsNullOrWhiteSpace(json) || json == "null")
                return;

            var daysDict = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, object>>(json);
            if (daysDict == null || daysDict.Count == 0)
                return;

            DateTime today = DateTime.Now.Date;
            DateTime targetDelete = today.AddDays(-(logKeepDay + 1));

            string dateKey = targetDelete.ToString("dd_MM_yyyy");

            if (daysDict.ContainsKey(dateKey))
            {
                await StreamDataTranfer.Instance.DeleteDataAsync($"{basePath}/{dateKey}");
               
            }

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
                    CheckEnablePermission();
                    OnPropertyChanged(nameof(CurrentLoginModel));
                }
            }
        }

        private void CheckEnablePermission()
        {
            if (CurrentLoginModel.Permission == ePermission.Maker)
            {
                IsTimeDelayEnable = true;
                IsTimeIntervalEnable = true;
                IsPHEndable = true;
                IsOffsetEnable = true;
                IsTestModeEnable = true;
                IsButtonEnable = true;
            }
            else if (CurrentLoginModel.Permission == ePermission.Admin)
            {
                IsTimeDelayEnable = true;
                IsTimeIntervalEnable = false;
                IsPHEndable = true;
                IsOffsetEnable = true;
                IsTestModeEnable = false;
                IsButtonEnable = true;
            }
            else if (CurrentLoginModel.Permission == ePermission.User)
            {
                IsTimeDelayEnable = false;
                IsTimeIntervalEnable = false;
                IsPHEndable = false;
                IsOffsetEnable = false;
                IsTestModeEnable = false;
                IsButtonEnable = false;
            }
        }

        private ESP32ControlFirebaseToESP32Model _ESP32ControlFirebaseP32ToFirebase;
        public ESP32ControlFirebaseToESP32Model ESP32ControlFirebaseP32ToFirebase
        {
            get { return _ESP32ControlFirebaseP32ToFirebase; }
            set
            {
                if (_ESP32ControlFirebaseP32ToFirebase != value)
                {
                    _ESP32ControlFirebaseP32ToFirebase = value;
                    OnPropertyChanged(nameof(ESP32ControlFirebaseP32ToFirebase));
                }
            }
        }
        private ESP32LogKeepDay eSP32LogKeepDay;
        public ESP32LogKeepDay ESP32LogKeepDay
        {
            get => eSP32LogKeepDay;
            set
            {
                if (eSP32LogKeepDay != value)
                {
                    eSP32LogKeepDay = value;
                    DeleteOldDayAsync(ESP32LogKeepDay.LogKeepDay);
                    OnPropertyChanged(nameof(ESP32LogKeepDay));
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

        private int _logKeepDay;
        public int LogkeepDay
        {
            get => _logKeepDay;
            set
            {
                if (_logKeepDay != value)
                {
                    _logKeepDay = value;
                    OnPropertyChanged(nameof(LogkeepDay));
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

        // permision hidden
        private bool _isTimeIntervalEnable = false;
        public bool IsTimeIntervalEnable
        {
            get { return _isTimeIntervalEnable; }
            set
            {
                if (_isTimeIntervalEnable != value)
                {
                    _isTimeIntervalEnable = value;
                    OnPropertyChanged(nameof(IsTimeIntervalEnable));
                }
            }
        }
        private bool _isTimeDelayEnable = false;
        public bool IsTimeDelayEnable
        {
            get { return _isTimeDelayEnable; }
            set
            {
                if (_isTimeDelayEnable != value)
                {
                    _isTimeDelayEnable = value;
                    OnPropertyChanged(nameof(IsTimeDelayEnable));
                }
            }
        }
        private bool _isPHEndable = false;
        public bool IsPHEndable
        {
            get { return _isPHEndable; }
            set
            {
                if (_isPHEndable != value)
                {
                    _isPHEndable = value;
                    OnPropertyChanged(nameof(IsPHEndable));
                }
            }
        }
        private bool _isOffsetEnable = false;
        public bool IsOffsetEnable
        {
            get { return _isOffsetEnable; }
            set
            {
                if (_isOffsetEnable != value)
                {
                    _isOffsetEnable = value;
                    OnPropertyChanged(nameof(IsOffsetEnable));
                }
            }
        }
        private bool _isTestModeEnable = false;
        public bool IsTestModeEnable
        {
            get { return _isTestModeEnable; }
            set
            {
                if (_isTestModeEnable != value)
                {
                    _isTestModeEnable = value;
                    OnPropertyChanged(nameof(IsTestModeEnable));
                }
            }
        }
        private bool _isButtonEnable = false;
        public bool IsButtonEnable
        {
            get { return _isButtonEnable; }
            set
            {
                if (_isButtonEnable != value)
                {
                    _isButtonEnable = value;
                    OnPropertyChanged(nameof(IsButtonEnable));
                }
            }
        }
        //create a ICommnand to accepted to save setting


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
            StreamDataTranfer.Instance.ESP32ControlFirebaseToESP32.TimeInterval = TimeInterval;
            StreamDataTranfer.Instance.ESP32ControlFirebaseToESP32.TimeDelay = TimeDelay;
            StreamDataTranfer.Instance.ESP32ControlFirebaseToESP32.OffsetX0 = OffsetX0;
            StreamDataTranfer.Instance.ESP32ControlFirebaseToESP32.OffsetY0 = OffsetY0;
            StreamDataTranfer.Instance.ESP32ControlFirebaseToESP32.PH_Max = pHMax;
            StreamDataTranfer.Instance.ESP32ControlFirebaseToESP32.PH_Min = pHMin;
            StreamDataTranfer.Instance.ESP32ControlFirebaseToESP32.TestMode = TestMode;
            StreamDataTranfer.Instance.ESP32LogKeepDay = ESP32LogKeepDay;
            
            StreamDataTranfer.Instance.UpdateDataAsync($"{Global.pathESP32ControlFirebaseToESP32}", StreamDataTranfer.Instance.ESP32ControlFirebaseToESP32);
            
        }
        //create a ICommnand to accepted to save setting
        public ICommand SaveSettingCommand { get; set; }
        //create a ICommnand to accepted to cancel setting
        public ICommand CancelSettingCommand { get; set; }
    }
}
