#include <iostream>
#include <fstream>
using namespace std;

int main()
{
	std::ofstream file;
	unsigned char IntMarker = 0x01;
	unsigned char stringMarker = 0x02;
	unsigned char intLength = sizeof(int);
	unsigned char stringLength;
	int IntValue;
	char str[127];

	cout << "Input int: ";
	cin >> IntValue;

	cout << "Input string: ";
	cin.ignore();
	cin.getline(str, 127);
	stringLength = strlen(str) + 1;

	file = ofstream("D:\\Study\\university\\3semester\\SE\\Asm4\\asm1\\bin.bin");

	file.clear();


	file.write((char*)&IntMarker, 1);
	file.write((char*)&intLength, 1);
	file.write(reinterpret_cast<char*>(&IntValue), intLength);



	file.write((char*)&stringMarker, 1);
	file.write((char*)&stringLength, 1);
	file.write(str, stringLength);

	file.close();
}