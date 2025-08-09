using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using ESP32pH.DTOs;
using ESP32pH.Helpers;
using ESP32pH.Models;
using ESP32pH.Views;
using ESP32pH.Views.UserControl;
using Firebase.Auth;
using Microsoft.Maui.Storage;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ESP32pH.ViewModels
{
    public class LoginViewModel : ObservableObject
    {
        private string _userName;
        private string _password;
        private ePermission _permission;
        private bool _rememberMe;
        private bool _isPasswordHidden = true;
        private string token = string.Empty;                   
        public LoginViewModel()
        {
            LoginCommand = new AsyncRelayCommand(LoginCommandAct);          
            LoadCookie();
        }

        private async Task SaveCookie()
        {
            Preferences.Set("Username", UserName);
            Preferences.Set("Password", Password);
            if (RememberMe)
            {
                Preferences.Set("RememberMe", true);
                return;
            }
            else Preferences.Set("RememberMe", false);

            await SecureStorage.SetAsync("AccessToken", token);
        }

        private void LoadCookie()
        {
            if (Preferences.Get("RememberMe", true))
            {
                UserName = Preferences.Get("Username", UserName);
                Password = Preferences.Get("Password", Password);
                RememberMe = true;
            }
        }

        // Tiến hành đăng nhập
        private async Task LoginCommandAct()
        {
            if (string.IsNullOrWhiteSpace(UserName))
            {
                await ShowAlertAsync("Lỗi", "Vui lòng nhập tên đăng nhập");
                return;
            }

            if (string.IsNullOrWhiteSpace(Password))
            {
                await ShowAlertAsync("Lỗi", "Vui lòng nhập mật khẩu");
                return;
            }

            try
            {               
               var user = await StreamDataTranfer.Instance.LoginAsync(UserName, Password);
                
                if (user != null)
                {
                    //await ShowAlertAsync("Thành công", $"Đăng nhập thành công. Quyền: {user.Permission}");
                    SaveCookie();
                    //chuyển trang hoặc xử lý sau đăng nhập
                    StreamDataTranfer.Instance.CurrentLoginModel = user;
                    AppShell.Current.FlyoutHeader = new FlyoutHeaderControl();
                    await Shell.Current.GoToAsync($"//{nameof(MainView)}");
                   
                }
                else
                {
                    await ShowAlertAsync("Lỗi", "Sai tên đăng nhập hoặc mật khẩu.");
                }
            }
            catch (Exception ex)
            {
                await ShowAlertAsync("Lỗi hệ thống", $"Không thể đăng nhập.\n{ex.Message}");
            }
        }
        private Task ShowAlertAsync(string title, string message)
        {
            return Shell.Current.DisplayAlert(title, message, "OK");
        }

        public string UserName
        {
            get => _userName;
            set
            {
                if (_userName != value)
                {
                    _userName = value;
                    OnPropertyChanged(nameof(UserName));
                }
            }
        }
        public string Password
        {
            get => _password;
            set
            {
                if (value != _password)
                {
                    _password = value;
                    OnPropertyChanged(nameof(Password));
                }
            }
        }
        public ePermission Permission
        {
            get => _permission;
            set
            {
                if (value != _permission)
                {
                    _permission = value;
                    OnPropertyChanged(nameof(Permission));
                }
            }
        }
        public bool RememberMe
        {
            get => _rememberMe;
            set
            {
                if (_rememberMe != value)
                {
                    _rememberMe = value;
                    OnPropertyChanged(nameof(RememberMe));
                }
            }
        }
        public bool IsPasswordHidden
        {
            get => _isPasswordHidden;
            set
            {
                if (_isPasswordHidden != value)
                    _isPasswordHidden = value;
                OnPropertyChanged(nameof(IsPasswordHidden));
                OnPropertyChanged(nameof(PasswordToggleIcon));
                OnPropertyChanged(nameof(PasswordToggleColor));

            }
        }
        public ICommand LoginCommand { get; set; }
        public ICommand TogglePasswordVisibilityCommand => new Command(() =>
        {
            IsPasswordHidden = !IsPasswordHidden;
        });

        public string PasswordToggleIcon => IsPasswordHidden ? "eyeclose.svg" : "eyeopen.svg";
        public Color PasswordToggleColor => IsPasswordHidden ? Color.FromArgb("#7A7A9A") : Color.FromArgb("#667EEA");
    }
}
