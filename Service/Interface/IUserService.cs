using PersonalFinanceExpenses.Model;

namespace PersonalFinanceExpenses.Service.Interface;

public interface IUserService
{
   bool Login(User user);  
   bool Register(User user);
}

