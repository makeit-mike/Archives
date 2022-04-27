using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace cs;
public class JsonParsing
{
    const string FilePath = "../data/test.json";
    const string LiteralJson = "{'FirstName':'Michael','Job':'Software Engineer'}";

    // Basic Example. For JSON this simple, I normally wouldnt go through the work
    // To write out a class for the data, I would just use JObject below (part of newtonsoft.Linq)
    public static void ParseJsonUsingJsonConvert()
    {
        var parseLiteralByClass =
            JsonConvert.DeserializeObject<LiteralJsonObject>(LiteralJson);
        Console.WriteLine($"FirstName: {parseLiteralByClass?.FirstName ?? ""}");
    }

    // The "Normal" way I would parse JSON for data that lives at the root level.
    // This gets ugly when there are child components. In the case of more complex JSON
    // Use the other methods below.
    public static void ParseJsonUsingJObject()
    {
        var parseLiteralByObjectParsing =
            JObject.Parse(LiteralJson);
        Console.WriteLine($"Job: {parseLiteralByObjectParsing["Job"]}");
    }

    // The 'Normal' way I would do things day to day for complex objects.
    // In VS you can "Paste JSON as classes" and always have a statically typed
    // view of what your expected JSON looks like. Easier to debug.
    public static void ParseComplexJsonFromFile()
    {
        var jsonData = File.ReadAllText(FilePath);
        Console.WriteLine(jsonData);
        Root? glossary = JsonConvert.DeserializeObject<Root>(jsonData);
        Console.WriteLine("Title: " + glossary.Glossary.Title ?? "");
    }

    // Same thing but you don't have to make a class.
    public static void ParseComplexJsonFromFileDynamic()
    {
        var jsonData = File.ReadAllText(FilePath);
        Console.WriteLine(jsonData);
        dynamic glossary = JsonConvert.DeserializeObject(jsonData);
        Console.WriteLine("Title: " + glossary.Glossary.Title ?? "");
    }
}

// ----------------------------------------------------------------------------

public class LiteralJsonObject
{
    public string? FirstName { get; set; }
    public string? Job { get; set; }
}


// ----------------------------------------------------------------------------
public class GlossDef
{
    public string para { get; set; }
    public List<string> GlossSeeAlso { get; set; }
}

public class GlossEntry
{
    public string ID { get; set; }
    public string SortAs { get; set; }
    public string GlossTerm { get; set; }
    public string Acronym { get; set; }
    public string Abbrev { get; set; }
    public GlossDef GlossDef { get; set; }
    public string GlossSee { get; set; }
}

public class GlossList
{
    public GlossEntry GlossEntry { get; set; }
}

public class GlossDiv
{
    public string Title { get; set; }
    public GlossList GlossList { get; set; }
}

public class Glossary
{
    public string Title { get; set; }
    public GlossDiv GlossDiv { get; set; }
}

public class Root
{
    public Glossary Glossary { get; set; }
}

// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
