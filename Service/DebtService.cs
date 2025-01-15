using PersonalFinanceExpenses.Abstraction;
using PersonalFinanceExpenses.Model;
using PersonalFinanceExpenses.Service.Interface;

namespace PersonalFinanceExpenses.Service;

public class DebtService: DebtBase, IDeptService
{
    private List<Debt> _debts;

    public DebtService()
    {
        _debts = LoadDebts();
    }

    public List<Debt> GetDebts()
    {
        return _debts;
    }

    public void AddDebt(Debt debt)
    {
        debt.Id = _debts.Any() ? _debts.Max(d => d.Id) + 1 : 1;
        
        _debts.Add(debt);
        SaveDebts(_debts);
    }
}