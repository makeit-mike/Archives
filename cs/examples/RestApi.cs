using RestSharp;
namespace cs;

public class RestApi
{
    public static async Task TestConnection_HttpClient()
    {
        HttpClient client = new HttpClient();
        HttpResponseMessage response =
            await client.GetAsync("https://randomuser.me/api/");
        string responseBody = await response.Content.ReadAsStringAsync();

        Console.WriteLine($"Response: {responseBody}\r\n");
    }

    public static async Task TestConnection_HttpClient2()
    {
        HttpClient client = new HttpClient();
        string responseBody = await client.GetStringAsync("https://randomuser.me/api/");

        Console.WriteLine($"Response: {responseBody}\r\n");
    }

    public static async Task TestConnection_RestSharp()
    {
        var client = new RestSharp.RestClient("https://randomuser.me/");
        var request = new RestSharp.RestRequest("api/");
        var response = await client.GetAsync(request);

        Console.WriteLine($"Response: {response.Content}\r\n");
    }
}