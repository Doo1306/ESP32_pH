using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using ESP32_pH.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ESP32_pH.ViewModels
{
    public partial class AppShellViewModel : ObservableObject
    {
        public ICommand SignOutCommand { get; set; }
        public AppShellViewModel()
        {
            SignOutCommand = new AsyncRelayCommand(SignOutCommandAct);
        }
        
        async Task SignOutCommandAct()
        {
            await Shell.Current.GoToAsync($"//{nameof(LoginView)}");
        }
    }
}
