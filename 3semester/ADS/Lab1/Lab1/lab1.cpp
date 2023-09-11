#include <iostream>
#include <Windows.h>

void hanoiTower(int n, int strart_rod, int finish_rod, int support) {
    if (n == 1) {
        std::cout << "Move disk 1 from " << strart_rod << " to " << finish_rod << " rod" << std::endl;
        return;
    }

    hanoiTower(n - 1, strart_rod, support, finish_rod);
    std::cout << "Move disk " << n << " from " << strart_rod << " to " << finish_rod << " rod" << std::endl;
    hanoiTower(n - 1, support, finish_rod, strart_rod);
}

int main() {
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    int disks_amount, rod_amount;
    std::cout << "Enter amount of disdk: ";
    std::cin >> disks_amount;
    std::cout << "Enter amount of rods: ";
    std::cin >> rod_amount;

    if (disks_amount < 1 || rod_amount < 3) {
        std::cout << "Incorrect input. Amount of disks have to be mort then 0, and amount of rods more then 2." << std::endl;
        return 1;
    }
    
    hanoiTower(disks_amount, 1, rod_amount, 2);

    return 0;
}
