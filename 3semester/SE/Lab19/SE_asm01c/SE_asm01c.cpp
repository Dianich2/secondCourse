#include <iostream>
#pragma comment(lib, "..\\Debug\\SE_asm01a.lib")

extern "C"
{
    int __stdcall getmin(int*, int);
    int __stdcall getmax(int*, int);
}

int main()
{
    int arr[10] = {2, 67, -5, 85, 10, -22, 11, 7, 8, 10 };
    int min = 0, max = 0, sum = 0;
    min = getmin(arr, 10);
    max = getmax(arr, 10);
    sum = min + max;
    std::cout << "getmax + getmin = " << sum << std::endl;
}