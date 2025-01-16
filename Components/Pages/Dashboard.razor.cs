namespace PersonalFinanceExpenses.Components.Pages;

public partial class Dashboard
{
    private decimal TotalCredit = 0;
    private decimal TotalDebit = 0;
    private decimal DueDebt = 0;
    private decimal ClearedDebt = 0;

    private List<string> TransactionLabels = new();
    private List<int> TransactionData = new();
    private List<string> BarChartLabels = new() { "Inflow", "Outflow" };
    private List<decimal> BarChartData = new();

    protected override void OnInitialized()
    {
        var transactions = TranscationService.GetTranscations();
        var debts = DebtService.GetDebts();

        // Calculate Summary Stats
        TotalCredit = transactions.Where(t => t.Type == "Credit").Sum(t => (decimal)t.TransactionAmount);
        TotalDebit = transactions.Where(t => t.Type == "Debit").Sum(t => (decimal)t.TransactionAmount);
        DueDebt = debts.Where(d => d.Status == "Pending").Sum(d => (decimal)d.Amount);
        ClearedDebt = debts.Where(d => d.Status == "Paid").Sum(d => (decimal)d.Amount);

        // Donut Chart Data
        TransactionLabels = transactions
            .GroupBy(t => t.Type)
            .Select(g => g.Key)
            .ToList();

        TransactionData = transactions
            .GroupBy(t => t.Type)
            .Select(g => g.Count())
            .ToList();

        // Bar Chart Data
        BarChartData = new List<decimal> { TotalCredit, TotalDebit };
    }
}