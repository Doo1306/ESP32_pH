using ESP32pH.DTOs;
using ESP32pH.Models;
using Firebase.Auth;
using Firebase.Database;
using Firebase.Database.Query;
using Firebase.Database.Streaming;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32pH.Helpers
{
//    rele
//     {
//  "rules": {
//    "Data":{
//    	"$uid":{
//        ".read": "$uid === auth.uid",
//    		".write": "$uid === auth.uid"
//      }			
//    }
//	}
//}  
    public class FireBase
    {
        #region Fields
        private readonly HttpClient httpClient;
        private string firebaseUrl;
        private string authenticToken; 
        private FirebaseClient? firebaseClient;
        private IDisposable? _controlSubscription;
        private FirebaseAuthProvider authProvider;
        private FirebaseConfig firebaseConfig;
        public string token = string.Empty;
        #endregion

        #region Properties
        public string FirebaseUrl
        {
            get { return firebaseUrl; }
            set { firebaseUrl = value; }
        }
        public string AuthenticToken
        {
            get { return authenticToken; }
            set { authenticToken = value; }
        }
        #endregion

        #region  Constructor
        public FireBase(string _firebaseUrl, string _token)
        {
            httpClient = new HttpClient();
            FirebaseUrl = _firebaseUrl;
            AuthenticToken = _token;           
        }
        #endregion

        #region Methods
        // Generic listener
        public void ListenToNodeChanges<T>(string nodeKey, string authToken, Action<FirebaseObject<T>> onDataChanged)
        {
            EnsureFirebaseClient(authToken);

            firebaseClient
                .Child(nodeKey)
                 .AsObservable<T>()
                    .Subscribe(d =>
                    {
                        if (d.Object != null && d.EventType != FirebaseEventType.Delete)
                        {
                            onDataChanged(d);
                        }
                    });
        }       
        private void EnsureFirebaseClient(string authToken)
        {
            if (firebaseClient == null)
            {
                firebaseClient = new FirebaseClient(firebaseUrl,
                    new FirebaseOptions
                    {
                        AuthTokenAsyncFactory = () => Task.FromResult(authToken)
                    });
            }
        }
        public async Task<T> GetDataAsync<T>(string path, string authentoken)
        {
            try
            {
                string url = $"{FirebaseUrl}{path}.json?auth={authentoken}"; // Firebase sử dụng đuôi .json để gọi API
                string jsonResponse = await httpClient.GetStringAsync(url);
                return JsonConvert.DeserializeObject<T>(jsonResponse);                                 
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Lỗi khi lấy dữ liệu: {ex.Message}");
                return default;
            }
        }
        public async Task<string> FirebaseAuthenticLogin(string email, string password)
        {
            authProvider = new FirebaseAuthProvider(new FirebaseConfig(Global.ApiKey));
            token = await LoginWithEmailPassword(email, password); // Lấy token từ Firebase
            return token;
        }
        public async Task<string> LoginWithEmailPassword(string email, string password)
        {
            try
            {
                var auth = await authProvider.SignInWithEmailAndPasswordAsync(email, password);
                return auth.FirebaseToken; // Token này dùng để xác thực các request
            }
            catch (Exception ex)
            {
                return $"Login failed: {ex.Message}";
            }
        }
        public async Task<bool> AddDataAsync<T>(string path, T data, string authentoken)
        {
            try
            {
                string url = $"{FirebaseUrl}{path}.json?auth={authentoken}";
                string jsonData = JsonConvert.SerializeObject(data);
                var content = new StringContent(jsonData, Encoding.UTF8, "application/json");
                var response = await httpClient.PostAsync(url, content);
                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Lỗi khi thêm dữ liệu: {ex.Message}");
                return false;
            }
        }
        public async Task<bool> UpdateDataAsync<T>(string path, T data, string authentoken)
        {
            try
            {
                string url = $"{FirebaseUrl}{path}.json?auth={authentoken}";
                string jsonData = JsonConvert.SerializeObject(data);
                var content = new StringContent(jsonData, Encoding.UTF8, "application/json");
                var response = await httpClient.PutAsync(url, content);
                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Lỗi khi cập nhật dữ liệu: {ex.Message}");
                return false;
            }
        }
        public async Task<bool> DeleteDataAsync(string path, string authentoken)
        {
            try
            {
                string url = $"{FirebaseUrl}{path}.json?auth={authentoken}";
                var response = await httpClient.DeleteAsync(url);
                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Lỗi khi xóa dữ liệu: {ex.Message}");
                return false;
            }
        }
        public async Task<bool> CheckConnectionAsync()
        {
            try
            {
                var response = await httpClient.GetAsync(FirebaseUrl);
                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Lỗi kết nối: {ex.Message}");
                return false;
            }
        }
        // getbyid
        public async Task<T> GetDataByIdAsync<T>(string path, string id, string authentoken)
        {
            try
            {
                string url = $"{FirebaseUrl}{path}/{id}.json?auth={authentoken}";
                string jsonResponse = await httpClient.GetStringAsync(url);
                return JsonConvert.DeserializeObject<T>(jsonResponse);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Lỗi khi lấy dữ liệu theo ID: {ex.Message}");
                return default;
            }
        }
        // getAll
        public async Task<List<T>> GetAllDataAsync<T>(string path, string authentoken)
        {
            try
            {
                string url = $"{FirebaseUrl}{path}.json?auth={authentoken}";
                string jsonResponse = await httpClient.GetStringAsync(url);
                return JsonConvert.DeserializeObject<List<T>>(jsonResponse);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Lỗi khi lấy tất cả dữ liệu: {ex.Message}");
                return new List<T>();
            }
        }
        #endregion
    }
}
