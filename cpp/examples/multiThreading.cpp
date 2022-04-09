#include <iostream>
#include <thread>

// To run this program (at least in linux), 
//      g++ multiThreading.cpp -o multiThreading -pthread 

// Basic threading.
static bool s_Finished = false;

void DoWork()
{
    using namespace std::literals::chrono_literals;
    while (!s_Finished)
    {
        std::cout << "working...\n";
        std::this_thread::sleep_for(1s);
    }

    std::cout << "Worker thread terminated.\n";

}

int main()
{
    std::cout << "Press ENTER when you are done with this thread.\n";
    std::thread worker(DoWork); // This thread is continuing until s_Finished is flipped on.

    std::cin.get(); // Main thread is waiting for user to return an input.
    s_Finished = true; // Sets the flag to tell the thread to finish.

    worker.join(); // Blocks the thread in question. If you didn't do this, you will encounter a runtime error.

    std::cout << "Press ENTER to terminate the program.\n";
    std::cin.get();

    return 0; // You need to make sure all other threads are closed before the main thread is closed.
}
