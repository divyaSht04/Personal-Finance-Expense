using System.Runtime.InteropServices.JavaScript;
using System.Text.Json;
using PersonalFinanceExpenses.Abstraction;
using PersonalFinanceExpenses.Model;

namespace PersonalFinanceExpenses.Service;

public class TranscationService : TranscationBase
{
    private List<Transaction> _transactions;
    private Transaction transaction;

    public TranscationService()
    {
        string transcationsPath = Path.Combine(AppContext.BaseDirectory, "Data", "transcations.json");
        string jsonContent = File.ReadAllText(transcationsPath);
        transaction = JsonSerializer.Deserialize<Transaction>(jsonContent) ?? throw new InvalidOperationException("Failed to load default credentials");
        _transactions = LoadUser();
        if (!_transactions.Any())
        {
            _transactions.Add(new Transaction
            {
                Id = transaction.Id,
                Date = transaction.Date,
                Note = transaction.Note,
                Source = transaction.Source,
                TransactionAmount = transaction.TransactionAmount,
            });
            SaveUser(_transactions);
        }
        
    }
}