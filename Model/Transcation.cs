using System.Runtime.InteropServices.JavaScript;

namespace PersonalFinanceExpenses.Model;

public class Transaction
{
    public int Id { get; set; }
    public double TransactionAmount { get; set; }
    public DateOnly Date { get; set; }
    
    public string Type { get; set; }
    public string[] Source { get; set; }
    public string? Note { get; set; }
}