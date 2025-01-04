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
        string filename = FileSystem.AppDataDirectory;
        string credentialsPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Data", "credentials.json");
        string jsonContent = File.ReadAllText(credentialsPath);
        user = JsonSerializer.Deserialize<User>(jsonContent) ?? throw new InvalidOperationException("Failed to load default credentials");
        _users = LoadUser();
        if (!_users.Any())
        {
            _users.Add(new User 
            { 
                username = user.username, 
                password = user.password 
            });
            SaveUser(_users);
        }
    }
    public bool Login(User users)
    {
        if (string.IsNullOrEmpty(users.username) || string.IsNullOrEmpty(users.password))
        {
            return false;
        }
        return _users.Any(u => u.username == users.username && u.password == users.password);
    }
    public bool Register(User users)
    {
        throw new NotImplementedException();
    }
}