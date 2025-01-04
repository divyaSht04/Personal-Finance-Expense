using System.Text.Json;
using PersonalFinanceExpenses.Model;

namespace PersonalFinanceExpenses.Abstraction;

public abstract class TranscationBase
{
    private static string FilePath = Path.Combine(FileSystem.AppDataDirectory, "transcation.json");
    protected List<Transaction> LoadUser()
    {
        if (!File.Exists(FilePath)) return new List<Transaction>();
        var json = File.ReadAllText(FilePath);
        return JsonSerializer.Deserialize<List<Transaction>>(json) ?? new List<Transaction>();
    }
    protected void SaveUser(List<Transaction> transactions)
    {
        var json = JsonSerializer.Serialize(transactions);
        File.WriteAllText(FilePath, json);
    }
}