using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using ESP32_pH.DTOs;
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
        public SettingViewModel()
        {
            SaveSettingCommand = new RelayCommand(SaveSettingAct);
            CancelSettingCommand = new RelayCommand(CancelSettingAct);
            CurrentLoginModel = StreamDataTranfer.Instance.CurrentLoginModel;
            LoadParameter();
        }

        private void LoadParameter()
        {
            
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
