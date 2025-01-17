using Microsoft.AspNetCore.Components;
using PersonalFinanceExpenses.Model;

namespace PersonalFinanceExpenses.Components.Pages;

public partial class TranscationForm : ComponentBase
{
    private Transaction transaction = new()
    {
        Source = Array.Empty<string>() 
    };

    private List<Tag> Tags = new();
    private string ErrorMessage = string.Empty;

    private decimal SummaryAmount;

    protected override void OnInitialized()
    {
        Tags = TagsService.GetTags();
        var transactions = TranscationService.GetTranscations();
        var debts = DebtService.GetDebts();

        var totalInflow = transactions.Where(t => t.Type == "Credit").Sum(t => (decimal)t.TransactionAmount);
        var totalOutflow = transactions.Where(t => t.Type == "Debit").Sum(t => (decimal)t.TransactionAmount);
        var pendingDebt = debts.Where(d => d.Status == "Pending").Sum(d => (decimal)d.Amount);

        SummaryAmount = totalInflow + pendingDebt - totalOutflow;
    }

    private void HandleSubmit()
    {
        if (transaction.Type == "Debit" && SummaryAmount <= 0)
        {
            ErrorMessage = "Cannot perform a debit transaction when the total amount is zero or negative.";
            return;
        }
        ErrorMessage = string.Empty;
        TranscationService.AddTransaction(transaction);
        Nav.NavigateTo("/transactions");
    }
}