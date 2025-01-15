using System.ComponentModel;
using System.Text.Json;
using System.Text.Json.Serialization;
using PersonalFinanceExpenses.Model;
using DateOnlyConverter = PersonalFinanceExpenses.HelperClasses.DateOnlyConverter;

namespace PersonalFinanceExpenses.Abstraction;

public abstract class TranscationBase
{
    public static readonly string FilePath = Path.Combine("D:\\Third Year All folder\\dotNet\\First Sem\\PersonalFinanceExpenses\\wwwroot", "Data", "transactions.json");

    protected List<Transaction> loadAllTransactions()
    {
        if (!File.Exists(FilePath)) return new List<Transaction>();

        var json = File.ReadAllText(FilePath);
        var options = new JsonSerializerOptions
        {
            Converters = { new DateOnlyConverter() }
        };

        return JsonSerializer.Deserialize<List<Transaction>>(json, options) ?? new List<Transaction>();
    }

    public void SaveTransactions(List<Transaction> transactions)
    {
        var options = new JsonSerializerOptions
        {
            Converters = { new DateOnlyConverter() },
            WriteIndented = true
        };

        var json = JsonSerializer.Serialize(transactions, options);
        File.WriteAllText(FilePath, json);
    }
    
    
}