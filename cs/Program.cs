using cs;

Console.WriteLine("Program Started");
// See https://aka.ms/new-console-template for more information
// Console.WriteLine("Hello, World!");
// JsonParsing.ParseJsonUsingJsonConvert();
// JsonParsing.ParseJsonUsingJObject();
// JsonParsing.ParseComplexJsonFromFile();
// JsonParsing.ParseComplexJsonFromFileDynamic();
// SumOfDigits.DigitalRoot(234);

Try(() => RestApi.TestConnection_RestSharp().Wait());

Try(() => RestApi.TestConnection_HttpClient().Wait());

Console.WriteLine("Program Finished");


void Try(Action a)
{
    try
    {
        a();
    }
    catch (Exception ex)
    {
        Console.WriteLine(ex.Message);
    }
}