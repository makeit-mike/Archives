#include <iostream>
#include <vector>
#include <algorithm>

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
#pragma endregion

void stdLib_reversed(std::vector<char> &s)
{
    std::reverse(s.begin(), s.end());
}

// seems to perform on par with the standard library function.
void reversed(std::vector<char> &s)
{
    std::vector<char> output(s.size());

    int j = 0;
    for (int i = s.size() - 1; i >= 0; i--)
    {
        output[j++] = s[i];
    }
    s = output;
}

#pragma region TESTING

void performTest(std::vector<char> &input, std::vector<char> &expected)
{
    std::cout << "-----------------------------------" << std::endl;
    std::cout << "INPUT: ";
    printV(input);

    reversed(input);

    std::cout << "OUTPUT: ";
    printV(input);
    std::cout << std::endl;

    if (input == expected)
    {
        std::cout << "--ACCEPTED--" << std::endl;
    }
    else
    {
        std::cout << "--FAILDED--." << std::endl;
    }

    std::cout << std::endl
              << "EXPECTED: ";
    printV(expected);
    std::cout << std::endl;
}
#pragma endregion

int main()
{
    std::vector<char> input = {'h', 'e', 'l', 'l', 'o'};
    std::vector<char> reversed = {'o', 'l', 'l', 'e', 'h'};

    performTest(input, reversed);
    return 0;
}

/*
344. Reverse String

Write a function that reverses a string. The input string is given as an array of characters s.

Example 1:
    Input: s = ['h','e','l','l','o']
    Output: ['o','l','l','e','h']

Example 2:
    Input: s = ['H','a','n','n','a','h']
    Output: ['h','a','n','n','a','H']

Constraints:
    1 <= s.length <= 105
    s[i] is a printable ascii character.

*/