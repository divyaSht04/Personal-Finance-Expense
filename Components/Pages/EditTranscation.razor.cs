using Microsoft.AspNetCore.Components;
using PersonalFinanceExpenses.Model;

namespace PersonalFinanceExpenses.Components.Pages;

public partial class EditTranscation : ComponentBase
{
    [Parameter] public int TransactionId { get; set; }
    private Transaction transaction = new();
    private List<Tag> Tags = new();
    
    protected override void OnInitialized()
    {
        var existingTransaction = TranscationService
            .GetTranscations()
            .FirstOrDefault(t => t.Id == TransactionId);

        if (existingTransaction != null)
        {
            transaction = existingTransaction;
        }
        else
        {
            Nav.NavigateTo("/transactions");
        }
        
        Tags = TagsService.GetTags();
    }

    private void HandleSubmit()
    {
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