using Microsoft.AspNetCore.Components;
using PersonalFinanceExpenses.Model;
using PersonalFinanceExpenses.Service;

namespace PersonalFinanceExpenses.Components.Pages;

public partial class TranscationPage : ComponentBase
{
    private List<Transaction> Transactions { get; set; } = new();
    private List<Transaction> HighestTransactions { get; set; } = new();
    private List<Transaction> LowestTransactions { get; set; } = new();

    protected override async Task OnInitializedAsync()
    {
        Transactions = TranscationService.GetTranscations();
        HighestTransactions = Transactions.OrderByDescending(t => t.TransactionAmount).Take(5).ToList();
        LowestTransactions = Transactions.OrderBy(t => t.TransactionAmount).Take(5).ToList();
    }

    private void ExportTransactions()
    {
        Console.WriteLine("Export Transactions button clicked!");
    }
    
    private void DeleteTransaction(int transactionId)
    {
        var transaction = Transactions.FirstOrDefault(t => t.Id == transactionId);
        if (transaction != null)
        {
            Transactions.Remove(transaction);
            TranscationService.SaveTranscation(Transactions);
        }
        OnInitializedAsync();
    }
    
    private void EditTransaction(int transactionId)
    {
        Nav.NavigateTo($"/transactionForm/edit/{transactionId}");
    }
}