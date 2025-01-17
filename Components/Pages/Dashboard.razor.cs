using PersonalFinanceExpenses.Model;

namespace PersonalFinanceExpenses.Components.Pages;

public partial class Dashboard
{
    private DateTime? StartDate = null;
    private DateTime? EndDate = null;

    private decimal TotalCredit = 0;
    private decimal TotalDebit = 0;
    private decimal PendingDebt = 0;
    private decimal ClearedDebt = 0;
    private decimal TotalAmount = 0;

    private List<string> TransactionLabels = new();
    private List<int> TransactionData = new();
    private List<string> BarChartLabels = new() { "Inflow", "Outflow" };
    private List<decimal> BarChartData = new();
    private List<Debt> PendingDebts = new();
    private List<Transaction> HighestTransactions = new();
    private List<Transaction> LowestTransactions = new();

    protected override void OnInitialized()
    {
        LoadData();
    }

    private void LoadData()
    {
        var transactions = TranscationService.GetTranscations();
        var debts = DebtService.GetDebts();

        // Filter transactions and debts based on the date range
        if (StartDate.HasValue && EndDate.HasValue)
        {
            transactions = transactions.Where(t => t.Date.Date >= StartDate.Value.Date && t.Date.Date <= EndDate.Value.Date).ToList();
            debts = debts.Where(d => d.Date.Date >= StartDate.Value.Date && d.Date.Date <= EndDate.Value.Date).ToList();
        }

        HighestTransactions = transactions.OrderByDescending(t => t.TransactionAmount).Take(5).ToList();
        LowestTransactions = transactions.OrderBy(t => t.TransactionAmount).Take(5).ToList();

        TotalCredit = transactions.Where(t => t.Type == "Credit").Sum(t => (decimal)t.TransactionAmount);
        TotalDebit = transactions.Where(t => t.Type == "Debit").Sum(t => (decimal)t.TransactionAmount);
        PendingDebt = debts.Where(d => d.Status == "Pending").Sum(d => (decimal)d.Amount);
        ClearedDebt = debts.Where(d => d.Status == "Paid").Sum(d => (decimal)d.Amount);

        // Summary Amount
        TotalAmount = TotalCredit + PendingDebt - TotalDebit;

        TransactionLabels = transactions.GroupBy(t => t.Type).Select(g => g.Key).ToList();
        TransactionData = transactions.GroupBy(t => t.Type).Select(g => g.Count()).ToList();

        BarChartData = new List<decimal> { TotalCredit, TotalDebit };

        // Pending Debts Table
        PendingDebts = debts.Where(d => d.Status == "Pending").ToList();
    }

    private void ApplyFilters()
    {
        LoadData();
    }

    private void ResetFilters()
    {
        StartDate = null;
        EndDate = null;
        LoadData();
    }
}
