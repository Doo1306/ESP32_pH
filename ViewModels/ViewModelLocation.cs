using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ESP32_pH.ViewModels
{
    public class ViewModelLocation
    {
        private ViewModelLocation _instance;
        public ViewModelLocation Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ViewModelLocation();
                return _instance;
            }
            set { _instance = value; }
        }

        public ViewModelLocation()
        {
            LoginViewModel = new LoginViewModel();
            MainViewModel = new MainViewModel();
            AppShellViewModel = new AppShellViewModel();
        }
        public LoginViewModel LoginViewModel { get; set; }
        public MainViewModel MainViewModel { get; set; }
        public AppShellViewModel AppShellViewModel { get; set; }
    }
}
