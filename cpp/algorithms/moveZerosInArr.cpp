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

void moveZeroesWithCopy(std::vector<int> &nums)
{
    std::vector<int> outs(nums.size(), 0);
    int k = 0;
    for (int i = 0; i < nums.size(); i++)
    {
        if (nums[i] != 0)
        {
            outs[k] = nums[i];
            k++;
        }

        printV(outs, i);
    }
    nums = outs;
}
void moveZeroes(std::vector<int> &nums) // doesnt use an extra array... lol not any faster.
{
    int k = 0;
    int countOfZeros = 0;

    for (int i = 0; i < nums.size(); i++)
    {
        if (nums[i] != 0)
        {
            nums[k] = nums[i];
            k++;
        }
        else
            countOfZeros++;
        printV(nums, k);
    }
    while (countOfZeros != 0)
    {
        nums[k] = 0;
        k++;
        countOfZeros--;
        printV(nums, k);
    }
}
#pragma region TESTING

void performTest(std::vector<int> &nums, std::vector<int> &outs, int version = 1)
{
    std::cout << "-----------------------------------" << std::endl;
    std::cout << "INPUT: ";
    printV(nums);
    std::cout << std::endl;

    moveZeroes(nums);

    if (nums == outs)
    {
        std::cout << "--ACCEPTED--" << std::endl;
    }
    else
    {
        std::cout << "--FAILDED--." << std::endl;
    }

    std::cout << std::endl
              << "EXPECTED: ";
    printV(outs);
    std::cout << std::endl;
}
#pragma endregion

int main()
{
    std::vector<int> nums = {0, 1, 0, 3, 12};
    std::vector<int> outs = {1, 3, 12, 0, 0};

    std::vector<int> nums2 = {0};

    performTest(nums, outs);
    // performTest(nums2, nums2);

    return 0;
}