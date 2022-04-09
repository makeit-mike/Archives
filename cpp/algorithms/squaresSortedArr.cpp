#include <random>
#include <algorithm>
#include <iterator>
#include <iostream>
#include <vector>

void printV(std::vector<int> &nums)
{
	std::cout << "[";
	for (int i = 0; i < nums.size(); i++)
	{
		std::cout << nums[i] << " ";
	}
	std::cout << "]";

	std::cout << std::endl;
}

int squared(int v)
{
	int const mask = v >> sizeof(int) * 8 - 1;
	unsigned int r = (v + mask) ^ mask;
	return r * r;
}

std::vector<int> sortedArr(std::vector<int> &nums)
{
	int pass = 1;

	int startP = 0;
	int endP = nums.size() - 1;
	int count = nums.size() - 1;

	std::vector<int> output(nums.size(), 0); // init with 0.
	std::cout << "Pass #0 >>" << std::endl;
	printV(output);

	while (startP <= endP)
	{
		// fills output array from largest to smallest.
		std::cout << "Pass #" << pass << " >>"
										 "\t[start: "
				  << startP << "(" << nums[startP] << ")"
				  << ", end: " << endP << "(" << nums[endP] << ")"
				  << "]" << std::endl;

		if (nums[startP] < nums[endP])
		{
			output[count--] = nums[endP];
			endP--;
		}
		else
		{
			output[count--] = nums[startP];
			startP++;
		}

		printV(output);

		pass++;
	}
	return output;
}

std::vector<int> sortedSquares(std::vector<int> &nums)
{
	for (int i = 0; i < nums.size(); i++)
	{
		nums[i] = squared(nums[i]);
	}
	return sortedArr(nums);
}

int main()
{
	std::vector<int> inputV = {-10, -5, -4, -1, 0, 3, 22, 44};

	sortedSquares(inputV);

	return 0;
}
