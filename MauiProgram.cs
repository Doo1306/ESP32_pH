using ESP32pH.DTOs;
using ESP32pH.ViewModels;
using ESP32pH.Views;
using Microsoft.Extensions.Logging;


namespace ESP32pH
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });
            builder.Services.AddSingleton<LoginView>();
            builder.Services.AddSingleton<MainView>();
            builder.Services.AddSingleton<SettingView>();
            builder.Services.AddSingleton<LogView>();
            builder.Services.AddSingleton<AboutView>();

            builder.Services.AddSingleton<ViewModelLocation>();
            builder.Services.AddSingleton<LoginViewModel>();

            builder.Services.AddSingleton(StreamDataTranfer.Instance);

#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
