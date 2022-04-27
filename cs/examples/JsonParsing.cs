using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace cs;
public class JsonParsing
{
    public const string FilePath_Ex1 = "../../data/test.json";
    public const string FilePath_Ex2 = "../../data/testArray.json";
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
    public static void ParseComplexJsonFromFile_Glossary(string filePath)
    {
        GlossaryJson? glossary = JsonConvert.DeserializeObject<GlossaryJson>(ReadJsonFile(filePath));
        Console.WriteLine("Title: " + glossary?.Glossary?.Title ?? "");
    }

    public static string ReadJsonFile(string filePath)
    {
        var jsonData = File.ReadAllText(filePath);
        Console.WriteLine(jsonData);
        return jsonData;
    }

    public static void ParseComplexJsonFromFile_Array(string filePath)
    {
        Root_ArrayEx? data = JsonConvert.DeserializeObject<Root_ArrayEx>(ReadJsonFile(filePath));
        Console.WriteLine(data.Bots[0].Username);
        // Console.WriteLine("Title: " + glossary?.Glossary?.Title ?? "");
    }

    public static void UpdateGlossaryTitle(string filePath)
    {
        var jsonData = File.ReadAllText(filePath);
        var glossary = JsonConvert.DeserializeObject<GlossaryJson>(jsonData);
        glossary.Glossary.Title = "Some NEW title";
        //Console.WriteLine("Updated content: " + JsonConvert.SerializeObject(glossary));
        File.WriteAllText(filePath, JsonConvert.SerializeObject(glossary));
    }

    // Same thing but you don't have to make a class.
    public static void ParseComplexJsonFromFileDynamic(string filePath)
    {
        var jsonData = File.ReadAllText(filePath);
        Console.WriteLine(jsonData);
        dynamic glossary = JsonConvert.DeserializeObject(jsonData);
        Console.WriteLine("Title: " + glossary?.Glossary?.Title ?? "");
    }
}