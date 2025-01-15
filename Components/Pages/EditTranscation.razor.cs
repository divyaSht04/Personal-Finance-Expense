using Microsoft.AspNetCore.Components;
using PersonalFinanceExpenses.Model;

namespace PersonalFinanceExpenses.Components.Pages;

public partial class EditTranscation : ComponentBase
{
    [Parameter] public int TransactionId { get; set; }
    private Transaction transaction = new();
    private string sourceInput = "";

    protected override void OnInitialized()
    {
        // Retrieve the transaction by ID
        var existingTransaction = TranscationService
            .GetTranscations()
            .FirstOrDefault(t => t.Id == TransactionId);

        if (existingTransaction != null)
        {
            transaction = existingTransaction;
            sourceInput = string.Join(", ", transaction.Source);
        }
        else
        {
            Nav.NavigateTo("/transactions");
        }
    }

    private void HandleSubmit()
    {
        transaction.Source = sourceInput.Split(',', StringSplitOptions.RemoveEmptyEntries);
        
        var transactions = TranscationService.GetTranscations();
        var index = transactions.FindIndex(t => t.Id == TransactionId);
        if (index != -1)
        {
            transactions[index] = transaction;
            TranscationService.SaveTransactions(transactions);
        }
        
        Nav.NavigateTo("/transactions");
    }

    private void CancelEdit()
    {
        Nav.NavigateTo("/transactions");
    }
}