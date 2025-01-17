using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using PersonalFinanceExpenses.Model;
using System.Text.Json;
using System.Text;

namespace PersonalFinanceExpenses.Components.Pages;

public partial class TranscationPage : ComponentBase
{
    private string SearchQuery = string.Empty; 
    private DateTime? StartDate = null;
    private DateTime? EndDate = null;
    private string SearchType = string.Empty;

    private List<Transaction> Transactions { get; set; } = new();
    private List<Transaction> FilteredTransactions { get; set; } = new();

    protected override void OnInitialized()
    {
        Transactions = TranscationService.GetTranscations();
        FilteredTransactions = Transactions;
    }

    private void ApplyFilters()
    {
        FilteredTransactions = Transactions
            .Where(t =>
                (string.IsNullOrWhiteSpace(SearchQuery) || 
                    t.Source.Any(s => s.Contains(SearchQuery, StringComparison.OrdinalIgnoreCase)) ||
                    t.TransactionAmount.ToString().Contains(SearchQuery)) &&
                (!StartDate.HasValue || t.Date.Date >= StartDate.Value.Date) &&
                (!EndDate.HasValue || t.Date.Date <= EndDate.Value.Date) &&
                (string.IsNullOrWhiteSpace(SearchType) || t.Type.Equals(SearchType, StringComparison.OrdinalIgnoreCase))
            ).ToList();
    }
    

    private void DeleteTransaction(int transactionId)
    {
        var transaction = Transactions.FirstOrDefault(t => t.Id == transactionId);
        if (transaction != null)
        {
            Transactions.Remove(transaction);
            TranscationService.SaveTranscation(Transactions);
        }
        ApplyFilters();
    }

    private void EditTransaction(int transactionId)
    {
        Nav.NavigateTo($"/transactionForm/edit/{transactionId}");
    }

    private async Task ExportToJson()
    {
        var fileName = "All_Transactions.json";
        var jsonContent = JsonSerializer.Serialize(FilteredTransactions, new JsonSerializerOptions { WriteIndented = true });

        var byteArray = Encoding.UTF8.GetBytes(jsonContent);
        var stream = new MemoryStream(byteArray);

        await JSRuntime.InvokeVoidAsync("downloadFile", fileName, "application/json", stream.ToArray());
    }
}
