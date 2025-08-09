using CommunityToolkit.Mvvm.ComponentModel;
using ESP32pH.Helpers;
using ESP32pH.Models;
using ESP32pH.Services;
using ESP32pH.ViewModels;
using Firebase.Auth;
using Firebase.Database;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32pH.DTOs
{
    public class StreamDataTranfer  : ObservableObject, IRepositoryService
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
            ESP32pHReadingModel = new ESP32pHModel();
            ObCollectionESP32pHReadingModel = new ObservableCollection<ESP32pHModel>();
        }

        private void InitFirebaseListeners()
        {          
            firebase.ListenToNodeChanges<ESP32ControlModel>($"{Global.pathESP32Control}", FireBaseToken, data =>
            {          
                ESP32Control = data.Object; // Update the ESP32Control property
                NotifyDataChanged(Global.pathESP32Control); // Notify listeners about the change
            });
            firebase.ListenToNodeChanges<ESP32pHModel>($"{Global.pathESP32LiveDatapH}", FireBaseToken, data =>
            {
                ESP32pHReadingModel = data.Object;                        // Update the ESP32Control property
                NotifyDataChanged(Global.pathESP32LiveDatapH); // Notify listeners about the change
            });
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
        public ESP32pHModel ESP32pHReadingModel { get; set; }
        public SettingViewModel SettingViewModel { get; set; }
        public MainViewModel MainViewModel { get; set; }
        public ObservableCollection<ESP32pHModel> ObCollectionESP32pHReadingModel { get; set; }
        public bool IsAuthenticated => throw new NotImplementedException();

        public event Action<string> EP32DataChanged;       
        public void NotifyDataChanged(string key)
        {
            EP32DataChanged?.Invoke(key);
        }

        public async Task<int> Initialize()
        {
            FireBaseToken = await GetCurrentTokenAsync();
            CreateSettingComponents();
            CreateMainComponents();
            InitFirebaseListeners();
            return DefSystem.Success;
        }

        public async Task CreateMainComponents()
        {
            DateTime timenow = DateTime.Now;
            string timeDDMMYYYY = timenow.ToString("dd_MM_yyyy");
            string timeHour = timenow.ToString("HH");
            string link = $"{Global.pathESP32pH}{"/"}{timeDDMMYYYY}{"/"}{timeHour}";
            var value = await GetDataAsync<PhDataResponse>(link);
            if (value != null)
            {
                foreach (var item in value)
                {
                    ESP32pHModel eSP32PH = new ESP32pHModel();
                    eSP32PH.SamplingTime = TimeSpan.Parse(item.Value.TimeLine);
                    eSP32PH.pH = item.Value.pH_Value;
                    ObCollectionESP32pHReadingModel.Add(eSP32PH);
                }
                NotifyDataChanged(Global.pathESP32pHUpdatebByHour);
            }
            else
            {
                //
            }
        }

        // read data by hour
        public async Task ReadDataByHour(int number)
        {
            ObCollectionESP32pHReadingModel.Clear();

            DateTime now = DateTime.Now;

            // Lặp từ giờ lùi về number tiếng trước
            for (int i = number; i >= 0; i--)
            {
                DateTime targetTime = now.AddHours(-i);

                string timeDDMMYYYY = targetTime.ToString("dd_MM_yyyy");
                string timeHour = targetTime.ToString("HH");

                string link = $"{Global.pathESP32pH}/{timeDDMMYYYY}/{timeHour}";
                var value = await GetDataAsync<PhDataResponse>(link);

                if (value != null)
                {
                    foreach (var item in value)
                    {
                        ESP32pHModel eSP32PH = new ESP32pHModel
                        {
                            SamplingTime = TimeSpan.Parse(item.Value.TimeLine),
                            pH = item.Value.pH_Value
                        };
                        ObCollectionESP32pHReadingModel.Add(eSP32PH);
                    }
                }
            }

            NotifyDataChanged(Global.pathESP32pHUpdatebByHour);
        }
        private async Task CreateSettingComponents()
        {                   
            // Load Data FireBase bằng cách gọi đến Helper FireBase          
            var value = await GetDataAsync<ESP32ControlModel>(Global.pathESP32ControlReadOne);
            ESP32Control = value;
            SettingViewModel = new SettingViewModel(ESP32Control);
            MainViewModel = new MainViewModel(ESP32Control);
        }
        // CRUD operations for Firebase
        public async Task<T> GetDataAsync<T>(string path)
        {
            return await firebase.GetDataAsync<T>(path, FireBaseToken);           
        }

        public Task<T> GetDataByIdAsync<T>(string path, string id)
        {
            throw new NotImplementedException();
        }

        public async Task<List<T>> GetAllDataAsync<T>(string path)
        {
            return await firebase.GetAllDataAsync<T>(path, FireBaseToken);
        }

        public Task<bool> AddDataAsync<T>(string path, T data)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> UpdateDataAsync<T>(string path, T data)
        {
            return await firebase.UpdateDataAsync(path, data, FireBaseToken);
        }

        public Task<bool> DeleteDataAsync(string path)
        {
            throw new NotImplementedException();
        }
        // Authentication and User Management
        public Task<bool> CheckConnectionAsync()
        {
            throw new NotImplementedException();
        }

        // Login and Authentication
        public async Task<LoginModel> LoginAsync(string userName, string password)
        {
            if (FireBaseToken == null) GetCurrentTokenAsync();

            var data = await firebase.GetDataAsync<Dictionary<string, object>>(Global.pathLogin, FireBaseToken);

            // Chuyển object → JObject → LoginModel
            var loginDict = data.ToDictionary(
                x => x.Key,
                x => ((JObject)x.Value).ToObject<LoginModel>()
            );

            LoginModels = new ObservableCollection<LoginModel>(loginDict.Values);

            //Check đăng nhập
            var user = LoginModels
                .FirstOrDefault(x =>
                    string.Equals(x.UserName, userName, StringComparison.OrdinalIgnoreCase) &&
                    x.Password == password
                    );
            if (user != null)
            {
                CurrentLoginModel = user;
                return user;
            }
            else
            {
                throw new Exception("Invalid username or password");
            }
        }

        public Task<bool> LogoutAsync()
        {
            throw new NotImplementedException();
        }

        public Task<string> RegisterAsync(string email, string password)
        {
            throw new NotImplementedException();
        }

        // get current token
        public async Task<string> GetCurrentTokenAsync()
        {
            try
            {
                var token = await firebase.FirebaseAuthenticLogin(Global.UserNameFirebase, Global.PasswordFirebase);

                if (token.Contains("Login failed"))
                {
                    await ShowConfirmationAsync("Error", "Unable to connect to database.");
                    return null;
                }

                FireBaseToken = token;
                return token;
            }
            catch (Exception ex)
            {
                await ShowConfirmationAsync("Error",$"Error Detail: {ex.Message}");
                return null;
            }
        }
        //User Management   
        public Task<User> GetUserByIdAsync(string userId)
        {
            throw new NotImplementedException();
        }

        public Task<List<User>> GetAllUsersAsync()
        {
            throw new NotImplementedException();
        }

        public Task<bool> CreateUserAsync(User user)
        {
            throw new NotImplementedException();
        }

        public Task<bool> UpdateUserAsync(User user)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteUserAsync(string userId)
        {
            throw new NotImplementedException();
        }

        public Task ShowMessageAsync(string title, string message)
        {
            throw new NotImplementedException();
        }

        public Task ShowConfirmationAsync(string title, string message)
        {       
            return Shell.Current.DisplayAlert(title, message, "OK");        
        }

        public Task NavigateToAsync(string viewName, object parameter = null)
        {
            throw new NotImplementedException();
        }

        public Task GoBackAsync()
        {
            throw new NotImplementedException();
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
