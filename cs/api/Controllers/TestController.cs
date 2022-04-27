using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;

[ApiController]
[Route("[controller]")] //Test
public class TestController : ControllerBase
{
    private readonly ILogger<TestController> _logger;

    public TestController(ILogger<TestController> logger)
    {
        _logger = logger;
    }

    [HttpGet("")]
    public string Get()
    {
        return "Hello, World";
    }

    [HttpPost("SendData/{name}")]
    public void Post(string name)
    {
        Console.WriteLine(name);
    }
}
