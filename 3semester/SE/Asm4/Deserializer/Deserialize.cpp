#include <iostream>
#include <fstream>
#include "AsmTemplate.h"

using namespace std;

int main() {
	std::ifstream file;
	std::ofstream fileAsm;
	unsigned char intMarker = 0x01;
	unsigned char stringMarker = 0x02;

	int IntValue;
	char str[127];

	//Deserializing
	file = ifstream("D:\\Study\\university\\3semester\\SE\\Asm4\\asm1\\bin.bin");
	unsigned char marker;
	unsigned char currentLength;

	while (!file.eof())
	{
		file.read(reinterpret_cast<char*>(&marker), 1);
		file.read(reinterpret_cast<char*>(&currentLength), 1);

		if (marker == 0x01)
			file.read(reinterpret_cast<char*>(&IntValue), currentLength);
		else if (marker == 0x02)
			file.read(str, currentLength);
	}

	cout << IntValue << " " << str << endl;

	file.close();

	//Assembling
	fileAsm = ofstream("D:\\Study\\university\\3semester\\SE\\Asm4\\asm1\\Asm.asm");


	fileAsm.clear();

	fileAsm ASM_HEAD;

	fileAsm << "INTF	DD " << IntValue << endl;
	fileAsm << "STRF	DB \"" << str << "\", 0" << endl << endl;

	fileAsm ASM_FOOTER;

	fileAsm.close();

	exit(0);
}

