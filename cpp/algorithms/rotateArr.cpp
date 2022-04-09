#include <iostream>
#include <vector>

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

void rotate(std::vector<int> &nums, int k) // TRASH, but works for most cases
{
    int size = nums.size();

    if (size < 2)
        return;

    std::vector<int> outs(size, 0);

    for (int i = 0; i < size; i++)
    {
        int j = k + i;
        if (k % 2 != 0)
            j = j + 1;

        if (j >= size)
            j = (size - j) * -1;

        std::cout << "(i: " << i << ", j: " << j << ")" << std::endl;

        outs[i] = nums[j];
        printV(outs, j);
    }
    nums = outs;
}

void rotate2(std::vector<int> &nums, int k) // BETTER ALL TESTS PASSED
{
    int size = nums.size();

    if (size < 2)
        return;

    std::cout << k % size;
    k = modulus(k, size);
    std::vector<int> outs(nums.size(), 0);

    int outI = 0;
    for (int i = size - k; i < size; i++)
    {
        outs[outI] = nums[i];
        outI++;
        printV(outs, i);
    }
    for (int i = 0; i < size - k; i++)
    {
        outs[outI] = nums[i];
        outI++;
        printV(outs, i);
    }
    nums = outs;
}

void performTest(std::vector<int> nums, int k, std::vector<int> outs, int version = 1)
{
    std::cout << "-----------------------------------" << std::endl;
    std::cout << "INPUT: ";
    printV(nums);
    std::cout << std::endl;

    if (version == 1)
        rotate(nums, k);
    if (version == 2)
        rotate2(nums, k);

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

int main()
{
    // Test Case 1
    std::vector<int> nums = {-1, -100, 3, 99};
    std::vector<int> outs = {3, 99, -1, -100};
    int k = 2;
    // Test Case 2
    std::vector<int> nums2 = {1, 2, 3, 4, 5, 6, 7};
    std::vector<int> outs2 = {5, 6, 7, 1, 2, 3, 4};
    int k2 = 3;

    // Test Case 3
    std::vector<int> nums3 = {1, 2};
    std::vector<int> outs3 = {2, 1};
    int k3 = 2;

    //performTest(nums, k, outs);
    performTest(nums, k, outs, 2);
    //performTest(nums2, k2, outs2);
    //performTest(nums3, k3, outs3);

    return 0;
}