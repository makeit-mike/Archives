#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

#pragma region My Code Library / BOILER
void printV(std::vector<char> &input, int target = -1)
{
    int size = input.size();
    std::cout << "\t[ ";
    for (int i = 0; i < size; i++)
    {
        if (i == target)
            std::cout << "(" << input[i] << ")";
        else
            std::cout << input[i];
        if (i + 1 < size)
            std::cout << ", ";
    }
    std::cout << " ]";

    std::cout << std::endl;
}

void printV(std::vector<int> &nums, int target = -1)
{
    int size = nums.size();
    std::cout << "\t[ ";
    for (int i = 0; i < size; i++)
    {
        if (i == target)
            std::cout << "(" << nums[i] << ")";
        else
            std::cout << nums[i];
        if (i + 1 < size)
            std::cout << ", ";
    }
    std::cout << " ]";

    std::cout << std::endl;
}
#pragma endregion

std::vector<std::string> split(std::string s, std::string delimiter)
{
    int pos_start = 0;
    int pos_end;
    int delim_len = delimiter.length();
    std::string token;
    std::vector<std::string> res;

    while ((pos_end = s.find(delimiter, pos_start)) != std::string::npos)
    {
        token = s.substr(pos_start, pos_end - pos_start);
        pos_start = pos_end + delim_len;
        res.push_back(token);
    }

    res.push_back(s.substr(pos_start));
    return res;
}

std::string reverseWords(std::string s)
{
    std::string out;
    std::vector<std::string> splitStr = split(s, " ");
    for (int i = 0; i < splitStr.size(); i++)
    {
        std::string s = splitStr[i];

        std::reverse(s.begin(), s.end());
        out.append(s);
        if (i + 1 < splitStr.size())
            out.append(" ");
    }
    return out;
}
void reverseString(std::string s, int i, int j)
{
    while (i < j)
    {
        std::swap(s[i], s[j]);
        i++;
        j--;
    }
}
std::string reverseWords2(std::string s)
{
    std::vector<char> c(s.begin(), s.end());
    std::vector<int> spacePos;

    for (int i = 0; i < c.size(); i++)
    {
        if (c[i] == ' ')
            spacePos.push_back(i);
    }
    spacePos.push_back(c.size());

    printV(c);
    printV(spacePos);
    int startP = 0;

    for (int i = 0; i < spacePos.size(); i++)
    {
        int endP = spacePos[i];

        std::string t(s.begin() + startP, s.begin() + endP);
        std::cout << "(i: " << startP << ", j: " << endP << ")  --> " << t << std::endl;

        std::reverse(s.begin() + startP, s.begin() + endP);
        //reverseString(s, startP, endP);
        startP = endP + 1;

        std::cout << "(i: " << startP << ", j: " << endP << ")  --> " << t << std::endl;
        std::cout << s << std::endl;
    }
    return s;
    // std::string sout(out.begin(), out.end());
}

#pragma region TESTING

void performTest(std::string &input, std::string &expected)
{
    std::cout << "-----------------------------------" << std::endl;
    std::cout << "INPUT: " << input << std::endl;

    std::string actual = reverseWords2(input);

    std::cout << "OUTPUT: " << actual << std::endl;

    if (actual == expected)
    {
        std::cout << "--ACCEPTED--" << std::endl;
    }
    else
    {
        std::cout << "--FAILDED--." << std::endl;
    }

    std::cout << "EXPECTED: " << expected << std::endl;
}
#pragma endregion

int main()
{
    std::string input = "Let's take LeetCode contest";
    std::string output = "s'teL ekat edoCteeL tsetnoc";

    performTest(input, output);
    return 0;
}

/*

557. Reverse Words in a String III
    iven a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

Example 1:
    Input: s = "Let's take LeetCode contest"
    Output: "s'teL ekat edoCteeL tsetnoc"
Example 2:
    Input: s = "God Ding"
    Output: "doG gniD"
 
Constraints:
    1 <= s.length <= 5 * 104
    s contains printable ASCII characters.
    s does not contain any leading or trailing spaces.
    There is at least one word in s.
    All the words in s are separated by a single space.

*/