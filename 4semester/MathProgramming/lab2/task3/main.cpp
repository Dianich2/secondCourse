//#include <iostream>
//#include "Combi.h"
//#include <iomanip> 
//int main()
//{
//    setlocale(LC_ALL, "rus");
//    char  AA[][2] = { "A", "B", "C", "D" };
//    std::cout << std::endl << " --- Генератор перестановок ---";
//    std::cout << std::endl << "Исходное множество: ";
//    std::cout << "{ ";
//    for (int i = 0; i < sizeof(AA) / 2; i++)
//
//        std::cout << AA[i] << ((i < sizeof(AA) / 2 - 1) ? ", " : " ");
//    std::cout << "}";
//    std::cout << std::endl << "Генерация перестановок ";
//    combi::permutation p(sizeof(AA) / 2);
//    __int64  n = p.getfirst();
//    while (n >= 0)
//    {
//        std::cout << std::endl << std::setw(4) << p.np << ": { ";
//
//        for (int i = 0; i < p.n; i++)
//
//            std::cout << AA[p.ntx(i)] << ((i < p.n - 1) ? ", " : " ");
//
//        std::cout << "}";
//
//        n = p.getnext();
//    };
//    std::cout << std::endl << "всего: " << p.count() << std::endl;
//    system("pause");
//    return 0;
//}



#include <iostream>
#include <iomanip> 
#include "Salesman.h"
#define N 5
int main()
{
    setlocale(LC_ALL, "rus");
    int d[N][N] = { //0   1    2    3     4        
                  {  0,  45, INF,  25,   50},    //  0
                  { 45,   0,  55,  20,  100},    //  1
                  { 70,  20,   0,  10,   30},    //  2 
                  { 80,  INF,  40,   0,   10},    //  3
                  { 30,  50,  INF,  10,    0} };   //  4  
    int r[N];                     // результат 
    int s = salesman(
        N,          // [in]  количество городов 
        (int*)d,          // [in]  массив [n*n] расстояний 
        r           // [out] массив [n] маршрут 0 x x x x  

    );
    std::cout << std::endl << "-- Задача коммивояжера -- ";
    std::cout << std::endl << "-- количество  городов: " << N;
    std::cout << std::endl << "-- матрица расстояний : ";
    for (int i = 0; i < N; i++)
    {
        std::cout << std::endl;
        for (int j = 0; j < N; j++)

            if (d[i][j] != INF) std::cout << std::setw(3) << d[i][j] << " ";

            else std::cout << std::setw(3) << "INF" << " ";
    }
    std::cout << std::endl << "-- оптимальный маршрут: ";
    for (int i = 0; i < N; i++) std::cout << r[i] << "-->"; std::cout << 0;
    std::cout << std::endl << "-- длина маршрута     : " << s;
    std::cout << std::endl;
    system("pause");
    return 0;
}



//#include "Auxil.h"
//#include <iostream>
//#include <iomanip> 
//#include <time.h>
//#include "Salesman.h"
//#define SPACE(n) std::setw(n)<<" "
//#define N 12
//int main()
//{
//    setlocale(LC_ALL, "rus");
//    int d[N * N + 1], r[N];
//    auxil::start();
//    for (int i = 0; i <= N * N; i++) d[i] = auxil::iget(10, 100);
//    std::cout << std::endl << "-- Задача коммивояжера -- ";
//    std::cout << std::endl << "-- количество ------ продолжительность -- ";
//    std::cout << std::endl << "      городов           вычисления  ";
//    clock_t t1, t2;
//    for (int i = 7; i <= N; i++)
//    {
//        t1 = clock();
//        salesman(i, (int*)d, r);
//        t2 = clock();
//        std::cout << std::endl << SPACE(7) << std::setw(2) << i
//            << SPACE(15) << std::setw(5) << (t2 - t1);
//    }
//    std::cout << std::endl;
//    system("pause");
//    return 0;
//}
