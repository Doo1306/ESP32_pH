using ESP32pH.DTOs;

namespace ESP32pH
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            var result = StreamDataTranfer.Instance.Initialize();
        }
    }
}
