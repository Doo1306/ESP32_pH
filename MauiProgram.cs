using ESP32_pH.ViewModels;
using ESP32_pH.Views;
using IeuanWalker.Maui.Switch;
using LiveChartsCore.SkiaSharpView.Maui;
using Microsoft.Extensions.Logging;
using SkiaSharp.Views.Maui.Controls.Hosting;

namespace ESP32_pH
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

            builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseSwitch();
            builder
            .UseMauiApp<App>()     
            .UseSkiaSharp()        
            .UseLiveCharts();      
#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
