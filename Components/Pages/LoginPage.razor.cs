using Microsoft.AspNetCore.Components;
using PersonalFinanceExpenses.Model;
namespace PersonalFinanceExpenses.Components.Pages;

public partial class LoginPage : ComponentBase
{
    private string? errorMessage = "";
    public User? Users { get; set; } = new User(); 

    public void HandleLogin() 
    {
        if (UserService.Login(Users))
        {
            Nav.NavigateTo("/dashboard");
        }
        else
        {
            errorMessage = "Invalid username or password";
        }
    }
}