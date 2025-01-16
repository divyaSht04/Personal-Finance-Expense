using Microsoft.AspNetCore.Components;
using PersonalFinanceExpenses.Model;
using PersonalFinanceExpenses.Service;

namespace PersonalFinanceExpenses.Components.Pages;

public partial class TranscationPage : ComponentBase
{
    private string SearchQuery
    {
        get => _searchQuery;
        set
        {
            _searchQuery = value;
            FilterTransactions();
        }
    }
    private string _searchQuery = string.Empty;

    private List<Transaction> Transactions { get; set; } = new();
    private List<Transaction> FilteredTransactions { get; set; } = new();
    private List<Transaction> HighestTransactions { get; set; } = new();
    private List<Transaction> LowestTransactions { get; set; } = new();

    protected override async Task OnInitializedAsync()
    {
        Transactions = TranscationService.GetTranscations();
        FilteredTransactions = Transactions;
        HighestTransactions = Transactions.OrderByDescending(t => t.TransactionAmount).Take(5).ToList();
        LowestTransactions = Transactions.OrderBy(t => t.TransactionAmount).Take(5).ToList();
    }

    private void FilterTransactions()
    {
        FilteredTransactions = string.IsNullOrWhiteSpace(SearchQuery)
            ? Transactions
            : Transactions.Where(t =>
                t.Type.Contains(SearchQuery, StringComparison.OrdinalIgnoreCase) ||
                t.Note?.Contains(SearchQuery, StringComparison.OrdinalIgnoreCase) == true ||
                t.Source.Any(source => source.Contains(SearchQuery, StringComparison.OrdinalIgnoreCase)) ||
                t.TransactionAmount.ToString().Contains(SearchQuery, StringComparison.OrdinalIgnoreCase) ||
                t.Date.ToString("yyyy-MM-dd").Contains(SearchQuery)
            ).ToList();
    }

    private void SortByDate(bool ascending)
    {
        FilteredTransactions = ascending
            ? FilteredTransactions.OrderBy(t => t.Date).ToList()
            : FilteredTransactions.OrderByDescending(t => t.Date).ToList();
    }

    private void SortByAmount(bool ascending)
    {
        FilteredTransactions = ascending
            ? FilteredTransactions.OrderBy(t => t.TransactionAmount).ToList()
            : FilteredTransactions.OrderByDescending(t => t.TransactionAmount).ToList();
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
