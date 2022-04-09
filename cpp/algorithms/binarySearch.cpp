#include <iostream>
#include <vector>
#include <algorithm>
#include <iterator>

int binarySearch(std::vector<int> &nums, int target, int low, int high)
{
	if (low > high)
		return -1;

	int mid = low + (high - low) / 2;

	if (target > nums[mid])
	{
		return binarySearch(nums, target, mid + 1, high);
	}
	else if (target < nums[mid])
	{
		return binarySearch(nums, target, low, mid - 1);
	}
	else
	{
		return mid;
	}
}

int search(std::vector<int> &nums, int target)
{
	return binarySearch(nums, target, 0, nums.size() - 1);
}

int main()
{
	std::vector<int> list = {-1, 0, 3, 5, 10, 12};
	std::vector<int> list2 = {1, 3, 4, 5};
	int target = 3;
	int expectedOutput = 1;
	int actualOutput = binarySearch(list2, target, 0, list2.size() - 1);

	if (expectedOutput == actualOutput)
	{
		std::cout << "Target exists and its index is: " << actualOutput;
	}
	else
	{
		std::cout << "Target not found in list, or list was null. " << actualOutput;
	}

	return 0;
}
