﻿#include "FST.h"
#include <tchar.h>
#include <iostream>

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
	setlocale(LC_ALL, "rus");
	FST::FST fst0(			// недетермнированный конечный автомат (a+b)*aba
		(char*)"aabbabaaba",					// цепочка для распознования
		4,										// количество состяний
		FST::NODE(3, FST::RELATION('a', 0), FST::RELATION('b', 0), FST::RELATION('a', 1)),	// состояние 0 (начальное)
		FST::NODE(1, FST::RELATION('b', 2)),												// состояние 1
		FST::NODE(1, FST::RELATION('a', 3)),												// состояние 2
		FST::NODE()																			// состояние 3 (конечное)
	);
	if (FST::execute(fst0))
		cout << "Цепочка " << fst0.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst0.string << " не распознана" << endl;


	FST::FST fst1(
		(char*)"abcbkbj",
		8,
		FST::NODE(2, FST::RELATION('a', 1), FST::RELATION('a', 2)),
		FST::NODE(1, FST::RELATION('b', 2)),
		FST::NODE(3, FST::RELATION('b', 2), FST::RELATION('c', 3), FST::RELATION('c', 4)),
		FST::NODE(1, FST::RELATION('b', 4)),
		FST::NODE(5, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('l', 6), FST::RELATION('k', 6)),
		FST::NODE(3, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst1))
		cout << "Цепочка " << fst1.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst1.string << " не распознана" << endl;

	FST::FST fst2(
		(char*)"abcbblbj",
		8,
		FST::NODE(2, FST::RELATION('a', 1), FST::RELATION('a', 2)),
		FST::NODE(1, FST::RELATION('b', 2)),
		FST::NODE(3, FST::RELATION('b', 2), FST::RELATION('c', 3), FST::RELATION('c', 4)),
		FST::NODE(1, FST::RELATION('b', 4)),
		FST::NODE(5, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('l', 6), FST::RELATION('k', 6)),
		FST::NODE(3, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst2))
		cout << "Цепочка " << fst2.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst2.string << " не распознана" << endl;

	FST::FST fst3(
		(char*)"acbbbkkllbbbbj",
		8,
		FST::NODE(2, FST::RELATION('a', 1), FST::RELATION('a', 2)),
		FST::NODE(1, FST::RELATION('b', 2)),
		FST::NODE(3, FST::RELATION('b', 2), FST::RELATION('c', 3), FST::RELATION('c', 4)),
		FST::NODE(1, FST::RELATION('b', 4)),
		FST::NODE(5, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('l', 6), FST::RELATION('k', 6)),
		FST::NODE(3, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst3))
		cout << "Цепочка " << fst3.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst3.string << " не распознана" << endl;

	FST::FST fst4(
		(char*)"acbblj",
		8,
		FST::NODE(2, FST::RELATION('a', 1), FST::RELATION('a', 2)),
		FST::NODE(1, FST::RELATION('b', 2)),
		FST::NODE(3, FST::RELATION('b', 2), FST::RELATION('c', 3), FST::RELATION('c', 4)),
		FST::NODE(1, FST::RELATION('b', 4)),
		FST::NODE(5, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('l', 6), FST::RELATION('k', 6)),
		FST::NODE(3, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst4))
		cout << "Цепочка " << fst4.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst4.string << " не распознана" << endl;

	FST::FST fst5(
		(char*)"aclj",
		8,
		FST::NODE(2, FST::RELATION('a', 1), FST::RELATION('a', 2)),
		FST::NODE(1, FST::RELATION('b', 2)),
		FST::NODE(3, FST::RELATION('b', 2), FST::RELATION('c', 3), FST::RELATION('c', 4)),
		FST::NODE(1, FST::RELATION('b', 4)),
		FST::NODE(5, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('l', 6), FST::RELATION('k', 6)),
		FST::NODE(3, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst5))
		cout << "Цепочка " << fst5.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst5.string << " не распознана" << endl;

	FST::FST fst6(
		(char*)"aclbbbj",
		8,
		FST::NODE(2, FST::RELATION('a', 1), FST::RELATION('a', 2)),
		FST::NODE(1, FST::RELATION('b', 2)),
		FST::NODE(3, FST::RELATION('b', 2), FST::RELATION('c', 3), FST::RELATION('c', 4)),
		FST::NODE(1, FST::RELATION('b', 4)),
		FST::NODE(5, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('l', 6), FST::RELATION('k', 6)),
		FST::NODE(3, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst6))
		cout << "Цепочка " << fst6.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst6.string << " не распознана" << endl;

	FST::FST fst7(
		(char*)"ackbj",
		8,
		FST::NODE(2, FST::RELATION('a', 1), FST::RELATION('a', 2)),
		FST::NODE(1, FST::RELATION('b', 2)),
		FST::NODE(3, FST::RELATION('b', 2), FST::RELATION('c', 3), FST::RELATION('c', 4)),
		FST::NODE(1, FST::RELATION('b', 4)),
		FST::NODE(5, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('l', 6), FST::RELATION('k', 6)),
		FST::NODE(3, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst7))
		cout << "Цепочка " << fst7.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst7.string << " не распознана" << endl;

	FST::FST fst8(
		(char*)"abcbkb",
		8,
		FST::NODE(2, FST::RELATION('a', 1), FST::RELATION('a', 2)),
		FST::NODE(1, FST::RELATION('b', 2)),
		FST::NODE(3, FST::RELATION('b', 2), FST::RELATION('c', 3), FST::RELATION('c', 4)),
		FST::NODE(1, FST::RELATION('b', 4)),
		FST::NODE(5, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('l', 6), FST::RELATION('k', 6)),
		FST::NODE(3, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst8))
		cout << "Цепочка " << fst8.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst8.string << " не распознана" << endl;

	FST::FST fst9(
		(char*)"abocbkbj",
		8,
		FST::NODE(2, FST::RELATION('a', 1), FST::RELATION('a', 2)),
		FST::NODE(1, FST::RELATION('b', 2)),
		FST::NODE(3, FST::RELATION('b', 2), FST::RELATION('c', 3), FST::RELATION('c', 4)),
		FST::NODE(1, FST::RELATION('b', 4)),
		FST::NODE(5, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('l', 6), FST::RELATION('k', 6)),
		FST::NODE(3, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst9))
		cout << "Цепочка " << fst9.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst9.string << " не распознана" << endl;
}