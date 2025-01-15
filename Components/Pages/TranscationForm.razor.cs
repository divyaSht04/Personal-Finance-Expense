using Microsoft.AspNetCore.Components;
using PersonalFinanceExpenses.Model;

namespace PersonalFinanceExpenses.Components.Pages;

public partial class TranscationForm : ComponentBase
{
    private Transaction transaction = new();
    private string sourceInput = "";

    private async Task HandleSubmit()
    {
        // Split the sourceInput into an array
        transaction.Source = sourceInput.Split(',', StringSplitOptions.RemoveEmptyEntries);
        // Add transaction via service
        TranscationService.AddTransaction(transaction);
        
        transaction = new Transaction();
        sourceInput = "";

        await InvokeAsync(StateHasChanged);
    }
}