using System.Text.Json;
using PersonalFinanceExpenses.Abstraction;
using PersonalFinanceExpenses.Model;
using PersonalFinanceExpenses.Service.Interface;

namespace PersonalFinanceExpenses.Service;

public class TagsService: TagsBase, ITagsService
{
    private List<Tag> _tags;

    public TagsService()
    {
        _tags = LoadTags();
    }
    
    public List<Tag> GetTags()
    {
        return _tags;
    }
    
    public void AddTag(Tag tag)
    {
        _tags.Add(tag);
        SaveTags(_tags);
    }
    
    public void DeleteTag(int id)
    {
        var tag = _tags.FirstOrDefault(t => t.Id == id);
        if (tag != null)
        {
            _tags.Remove(tag);
            SaveTags(_tags);
        }
    }
}