

namespace cs;

public class Root_ArrayEx
{
    public string[] Admins { get; set; }
    public string ApiKey { get; set; }
    public string mainLog { get; set; }
    public string UseSeparateProcesses { get; set; }
    public string AutoStartAllBots { get; set; }
    public Bot[] Bots { get; set; }
}

public class Bot
{
    public string Username { get; set; }
    public string Password { get; set; }
    public string DisplayName { get; set; }
    public string Backpack { get; set; }
    public string ChatResponse { get; set; }
    public string logFile { get; set; }
    public string BotControlClass { get; set; }
    public int MaximumTradeTime { get; set; }
    public int MaximumActionGap { get; set; }
    public string DisplayNamePrefix { get; set; }
    public int TradePollingInterval { get; set; }
    public string LogLevel { get; set; }
    public string AutoStart { get; set; }
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
    public string? para { get; set; }
    public List<string>? GlossSeeAlso { get; set; }
}

public class GlossEntry
{
    public string? ID { get; set; }
    public string? SortAs { get; set; }
    public string? GlossTerm { get; set; }
    public string? Acronym { get; set; }
    public string? Abbrev { get; set; }
    public GlossDef? GlossDef { get; set; }
    public string? GlossSee { get; set; }
}

public class GlossList
{
    public GlossEntry? GlossEntry { get; set; }
}

public class GlossDiv
{
    public string? Title { get; set; }
    public GlossList? GlossList { get; set; }
}

public class Glossary
{
    public string? Title { get; set; }
    public GlossDiv? GlossDiv { get; set; }
}

public class GlossaryJson
{
    public Glossary? Glossary { get; set; }
}
