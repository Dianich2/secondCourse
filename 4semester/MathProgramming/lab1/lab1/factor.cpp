#include "stdafx.h"
using namespace std;

long double factorial(int num)
{
	if (num == 1) return 1;
	return num * factorial(num - 1);
}