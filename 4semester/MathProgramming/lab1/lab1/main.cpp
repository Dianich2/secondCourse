#pragma comment(linker, "/STACK:30000000")
#include "stdafx.h"
#include "Auxil.h"
#include "factor.h"
#include <ctime>
#include <locale>

using namespace std;

#define CYCLE 10000000


int main() {

	double av1 = 0, av2 = 0;
	clock_t t1 = 0, t2 = 0;

	setlocale(LC_ALL, "Russian");

	auxil::start();
	t1 = clock();

	for (int i = 0; i < CYCLE; i++) {

		av1 += (double)auxil::iget(-100, 100);
		av2 += auxil::dget(-100, 100);
	}
	t2 = clock();
	cout << "кол-во циклов:             " << CYCLE << endl;
	cout << "среднее значение (int):    " << av1 / CYCLE << endl;
	cout << "среднее значение (double): " << av2 / CYCLE << endl;
	cout << "продолжительность(y.e):    " << t2 - t1 << endl;
	cout << "                 (cek):    " 
		<< ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC) << endl;


	clock_t t3 = clock();
	long double res = factorial(100);
	cout << "              Значение: " << res << endl;
	clock_t t4 = clock();
	cout << "продолжительность(y.e):    " << t4 - t3 << endl;
	cout << "                 (cek):    "
		<< ((double)(t4 - t3)) / ((double)CLOCKS_PER_SEC) << endl;



	system("pause");
	return 0;
}