using Microsoft.AspNetCore.Components;
using PersonalFinanceExpenses.Model;

namespace PersonalFinanceExpenses.Components.Pages;

public partial class TranscationForm : ComponentBase
{
    private Transaction transaction = new();
    private string sourceInput = "";

    private async Task HandleSubmit()
    {
        transaction.Source = sourceInput.Split(',', StringSplitOptions.RemoveEmptyEntries);
        TranscationService.AddTransaction(transaction);
        transaction = new Transaction();
        sourceInput = "";

        await InvokeAsync(StateHasChanged);
    }
}