namespace cs;

public class SumOfDigits
{
    public static int DigitalRoot(long n)
    {
        int res = 0;
        foreach (char a in n.ToString())
        {
            res += Convert.ToInt32(a.ToString());
        }
        return res.ToString().Length == 1 ? res : DigitalRoot(res);
    }
}