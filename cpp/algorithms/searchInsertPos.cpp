#include <iostream>
#include <vector>

int binarySearch(std::vector<int> &nums, int target, int low, int high)
{
    if (nums.empty())
        return -1;

    if (target > nums[nums.size() - 1])
        return nums.size();

    int mid = low + (high - low) / 2;

    if (low > high)
    {
        if (nums[mid] > target)
            return mid;
        else
            return mid - 1;
    }

    if (target == nums[mid])
    {
        return mid;
    }
    if (target > nums[mid])
    {
        low = mid + 1;
    }
    else if (target < nums[mid])
    {
        high = mid - 1;
    }
    return binarySearch(nums, target, low, high);
}

int searchInsert(std::vector<int> &nums, int target)
{
    return binarySearch(nums, target, 0, nums.size() - 1);
}

int main()
{
    std::vector<int> nums = {1, 3, 5, 6};
    int target = 5;
    int expected = 2;

    int actual = searchInsert(nums, target);

    if (expected == actual)
    {
        std::cout << "Accepted.";
    }
    else
    {
        std::cout << "Failed.";
    }

    return 0;
}