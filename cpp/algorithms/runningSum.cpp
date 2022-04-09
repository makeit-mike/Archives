#include <iostream>
#include <bits/stdc++.h>
using namespace std;

vector<int> RunningSum(vector<int> &nums)
{
    //running sum of a 1d array.
    // ex: 1, 3, 5 = 1, 1+3, 1+3+5
    vector<int> runningSumList;
    int prev = 0;
    for (int i : nums)
    {
        prev += i;
        runningSumList.push_back(prev);
    }
    return newList;
}

int main()
{
    // Create some array of ints.
    vector<int> vect{1, 2, 3, 4, 5, 6};
    // Calculate the Running Sum of the vector above.
    vector<int> runningSum = RunningSum(vect);

    for (int x : runningSum)
        cout << x << "\t";

    return 0;
}