using System.Text.Json;
using PersonalFinanceExpenses.Model;

namespace PersonalFinanceExpenses.Abstraction;

public abstract class TagsBase
{
    public static readonly string FilePath = Path.Combine("D:\\Third Year All folder\\dotNet\\First Sem\\CourseWork\\wwwroot", "Data", "tags.json");
    
    protected List<Tag> LoadTags()
    {
        if (!File.Exists(FilePath)) return new List<Tag>();
        var json = File.ReadAllText(FilePath);
        return JsonSerializer.Deserialize<List<Tag>>(json) ?? new List<Tag>();
    }

    protected void SaveTags(List<Tag> tags)
    {
        var json = JsonSerializer.Serialize(tags,  new JsonSerializerOptions { WriteIndented = true });
        File.WriteAllText(FilePath, json);
    }
}