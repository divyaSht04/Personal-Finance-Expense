using PersonalFinanceExpenses.Model;

namespace PersonalFinanceExpenses.Service.Interface;

public interface IDeptService
{
    List<Debt> GetDebts();
    void AddDebt(Debt debt);
}