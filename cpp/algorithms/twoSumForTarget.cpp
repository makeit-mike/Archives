#include <iostream>
#include <vector>

#pragma region My Code Library / BOILER
int absolute(int v)
{
    int const mask = v >> sizeof(int) * 8 - 1;
    unsigned int r = (v + mask) ^ mask;
    return r;
}

int modulus(int input, int ceiling)
{
    return input >= ceiling ? input % ceiling : input;
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

std::vector<int> twoSumBRUTE(std::vector<int> &nums, int target)
{
    int startP = 0;
    int endP = nums.size() - 1;

    std::vector<int> out(2, 0);

    if (nums.size() == 2)
        return {1, 2};

    std::cout << "[" << startP << "(" << nums[startP] << "), " << endP << "(" << nums[endP] << ")]" << std::endl;

    for (int i = 0; i < nums.size(); i++)
    {
        for (int j = 1; j < nums.size(); j++)
        {
            int run = nums[i] + nums[j];
            std::cout << "[" << startP << "(" << nums[startP] << "), " << endP << "(" << nums[endP] << ")] --> " << run << std::endl;

            if (run == target)
            {
                return {i + 1, j + 1};
            }
        }
    }

    return out;
}
std::vector<int> twoSum(std::vector<int> &nums, int target)
{
    int startP = 0;
    int endP = nums.size() - 1;
    std::vector<int> out;

    while (startP < endP)
    {
        int run = nums[startP] + nums[endP];
        std::cout << "[" << startP << "(" << nums[startP] << "), " << endP << "(" << nums[endP] << ")] --> " << run << std::endl;
        if (run == target)
        {
            return {startP + 1, endP + 1};
        }

        if (run > target)
        {
            endP--;
        }
        else
        {
            startP++;
        }
    }

    return out;
}

#pragma region TESTING

void performTest(std::vector<int> &input, int target, std::vector<int> &expected, int version = 1)
{
    std::cout << "-----------------------------------" << std::endl;
    std::cout << "INPUT: ";
    printV(input);

    std::cout << "TARGET: " << target << std::endl;

    std::vector<int> actual = twoSum(input, target);

    std::cout << "OUTPUT: ";
    printV(actual);
    std::cout << std::endl;

    if (actual == expected)
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
    std::vector<int> nums = {2, 7, 11, 15};
    int target = 9;
    std::vector<int> out = {1, 2};

    std::vector<int> nums2 = {2, 3, 4};
    int target2 = 6;
    std::vector<int> out2 = {1, 3};

    std::vector<int> nums3 = {-1, 0};
    int target3 = -1;
    std::vector<int> out3 = {1, 2};

    std::vector<int> nums4 = {-4, 3, 4, 9};
    int target4 = 0;
    std::vector<int> out4 = {1, 3};

    performTest(nums, target, out);
    performTest(nums2, target2, out2);
    performTest(nums3, target3, out3);
    performTest(nums4, target4, out4);
    return 0;
}

/*
167. Two Sum II - Input array is sorted
    Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, 
    find two numbers such that they add up to a specific target number. 
    Let these two numbers be numbers[index1] and numbers[index2] 
    where 1 <= first < second <= numbers.length.
    Return the indices of the two numbers, index1 and index2, 
    as an integer array [index1, index2] of length 2.
    The tests are generated such that there is exactly one solution. 
    You may not use the same element twice.

Example 1:
    Input: numbers = [2,7,11,15], target = 9
    Output: [1,2]
    Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.

Example 2:
    Input: numbers = [2,3,4], target = 6
    Output: [1,3]
    Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3.

Example 3:
    Input: numbers = [-1,0], target = -1
    Output: [1,2]
    Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2.

Constraints:
    2 <= numbers.length <= 3 * 104
    -1000 <= numbers[i] <= 1000
    numbers is sorted in non-decreasing order.
    -1000 <= target <= 1000
    The tests are generated such that there is exactly one solution.


*/