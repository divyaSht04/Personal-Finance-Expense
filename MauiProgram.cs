using Microsoft.Extensions.Logging;
using PersonalFinanceExpenses.Service;
using PersonalFinanceExpenses.Service.Interface;

namespace PersonalFinanceExpenses
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
                });


            builder.Services.AddScoped<IUserService, UserService>();
            builder.Services.AddScoped<ITranscations, TranscationService>();
            builder.Services.AddScoped<ITagsService, TagsService>();
            builder.Services.AddScoped<IDeptService, DebtService>();

            builder.Services.AddMauiBlazorWebView();

#if DEBUG
    		builder.Services.AddBlazorWebViewDeveloperTools();
    		builder.Logging.AddDebug();
#endif
            return builder.Build();
        }
    }
}
