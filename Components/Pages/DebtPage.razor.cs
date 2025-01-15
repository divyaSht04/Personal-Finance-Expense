using Microsoft.AspNetCore.Components;
using PersonalFinanceExpenses.Model;

namespace PersonalFinanceExpenses.Components.Pages;

public partial class DebtPage : ComponentBase
{
    private Debt newDebt = new() { Status = "Pending" };
    private List<Debt> Debts = new();

    protected override void OnInitialized()
    {
        Debts = DebtService.GetDebts();
    }

    private void HandleSubmit()
    {
        DebtService.AddDebt(newDebt);
        Debts = DebtService.GetDebts(); // Reload debts
        newDebt = new() { Status = "Pending" }; // Reset form
    }
}