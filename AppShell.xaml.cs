using ESP32_pH.DTOs;

namespace ESP32_pH
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            int result = StreamDataTranfer.Instance.Initialize();
        }
    }
}
