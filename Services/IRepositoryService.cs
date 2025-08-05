using ESP32pH.Models;
using Firebase.Auth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32pH.Services
{
    public interface IRepositoryService
    {
        Task<T> GetDataAsync<T>(string path);
        Task<T> GetDataByIdAsync<T>(string path, string id);
        Task<List<T>> GetAllDataAsync<T>(string path);
        Task<bool> AddDataAsync<T>(string path, T data);
        Task<bool> UpdateDataAsync<T>(string path, T data);
        Task<bool> DeleteDataAsync(string path);
        Task<bool> CheckConnectionAsync();       
        Task<LoginModel> LoginAsync(string email, string password);
        Task<bool> LogoutAsync();
        Task<string> RegisterAsync(string email, string password);
        Task<string> GetCurrentTokenAsync();
        bool IsAuthenticated { get; }

        Task<User> GetUserByIdAsync(string userId);
        Task<List<User>> GetAllUsersAsync();
        Task<bool> CreateUserAsync(User user);
        Task<bool> UpdateUserAsync(User user);
        Task<bool> DeleteUserAsync(string userId);

        Task ShowMessageAsync(string title, string message);
        Task ShowConfirmationAsync(string title, string message);

        Task NavigateToAsync(string viewName, object parameter = null);
        Task GoBackAsync();
    }
}
