namespace ESP32_pH.Views.UserControl;
using ESP32_pH.DTOs;

public partial class FlyoutHeaderControl : ContentView
{
	public FlyoutHeaderControl()
	{
		InitializeComponent();

        if (StreamDataTranfer.Instance.CurrentLoginModel != null)
        {
            lbUserName.Text = "User Name  : " + StreamDataTranfer.Instance.CurrentLoginModel.UserName;
            lbPermission.Text = "Permission : " + StreamDataTranfer.Instance.CurrentLoginModel.Permission.ToString();
        }
        else
        {
            lbUserName.Text = "Ch?a ??ng nh?p";
            lbPermission.Text = "Kh�ng c� quy?n";
        }
    }
}