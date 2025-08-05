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
        public void ListenToNodeChanges<T>(string nodeKey, string authToken)
        {
            EnsureFirebaseClient(authToken);

            firebaseClient
           .Child("Data")
           .Child("8Xd57DhumEMAJbtobZnciPT6eYj1")
           .Child("Control")
           .AsObservable<Dictionary<string, object>>()
           .Subscribe(d =>
           {
               Console.WriteLine($"🔥 EVENT: {d.EventType} | KEY: {d.Key} | OBJECT: {d.Object}");
           },
           ex =>
           {
               Console.WriteLine($"❌ ERROR: {ex.Message}");
           });
        }

        public void ListenForControlChanges(string userId, string authToken)
        {
            EnsureFirebaseClient(authToken);
            // Xây dựng đường dẫn đến node Control
            var path = firebaseClient
                .Child("Data")
                .Child(userId)
                .Child("Control");

            // Sử dụng AsObservable để lắng nghe. 
            // Bất cứ khi nào dữ liệu tại đường dẫn này thay đổi, hàm trong Subscribe sẽ được gọi.
            path.AsObservable<ESP32ControlModel>()
                .Subscribe(
                    e => // 'e' là một đối tượng IEvent chứa thông tin về sự kiện
                    {
                        if (e.Object != null)
                        {
                            // e.Object chính là dữ liệu đã được tự động chuyển đổi thành ControlModel
                            var controlData = e.Object;

                            // In ra để kiểm tra
                            System.Diagnostics.Debug.WriteLine($"[Firebase] Dữ liệu Control đã thay đổi!");
                            System.Diagnostics.Debug.WriteLine($" -> Chế độ điều khiển: {controlData.ControlMode}");
                            System.Diagnostics.Debug.WriteLine($" -> Ngưỡng pH Max: {controlData.PH_Max}");
                            System.Diagnostics.Debug.WriteLine($" -> Còi báo: {controlData.Buzze}");
                            System.Diagnostics.Debug.WriteLine("------------------------------------");

                            // Kích hoạt event để các thành phần khác (như ViewModel/UI) có thể nhận dữ liệu
                            StreamDataTranfer.Instance.NotifyDataChanged("Control");
                        }
                    },
                    ex => // Xử lý lỗi nếu có
                    {
                        System.Diagnostics.Debug.WriteLine($"[Firebase] Lỗi khi lắng nghe: {ex.Message}");
                    }
                );
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
