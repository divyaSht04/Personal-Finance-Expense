using System.Text.Json;
using PersonalFinanceExpenses.Abstraction;
using PersonalFinanceExpenses.Model;
using PersonalFinanceExpenses.Service.Interface;

namespace PersonalFinanceExpenses.Service;

public class UserService : Userbase, IUserService
{
    private List<User> _users;
    private readonly User user;
    public UserService()
    {
        string credentialsPath = Path.Combine("D:\\Third Year All folder\\dotNet\\First Sem\\PersonalFinanceExpenses\\wwwroot", "Data", "credentials.json");
        string jsonContent = File.ReadAllText(credentialsPath);
        user = JsonSerializer.Deserialize<User>(jsonContent) ?? throw new InvalidOperationException("Failed to load default credentials");
        _users = LoadUser();
        if (!_users.Any())
        {
            User newUser = new User();
            newUser.Username = user.Username;
            newUser.Password = user.Password;
            _users.Add(newUser);
            SaveUser(_users);
        }
    }

    public bool Login(User users)
    {
        if (string.IsNullOrEmpty(users.Username) || string.IsNullOrEmpty(users.Password))
        {
            return false;
        }
        return _users.Any(u => u.Username == users.Username && u.Password == users.Password);
    }
    public bool Register(User users)
    {
        throw new NotImplementedException();
    }
}