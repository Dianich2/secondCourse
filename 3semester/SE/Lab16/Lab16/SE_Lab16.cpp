#include "FST.h"
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
		FST::NODE(1, FST::RELATION('a', 1)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION(' ', 2)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION('c', 3)),
		FST::NODE(2, FST::RELATION('b', 4), FST::RELATION(' ', 4)),
		FST::NODE(3, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5)),
		FST::NODE(4, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6), FST::RELATION(' ', 6)),
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
		FST::NODE(1, FST::RELATION('a', 1)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION(' ', 2)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION('c', 3)),
		FST::NODE(2, FST::RELATION('b', 4), FST::RELATION(' ', 4)),
		FST::NODE(3, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5)),
		FST::NODE(4, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6), FST::RELATION(' ', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst2))
		cout << "Цепочка " << fst2.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst2.string << " не распознана" << endl;

	FST::FST fst3(
		(char*)"a cbbbkkllbbbbj",
		8,
		FST::NODE(1, FST::RELATION('a', 1)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION(' ', 2)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION('c', 3)),
		FST::NODE(2, FST::RELATION('b', 4), FST::RELATION(' ', 4)),
		FST::NODE(3, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5)),
		FST::NODE(4, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6), FST::RELATION(' ', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst3))
		cout << "Цепочка " << fst3.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst3.string << " не распознана" << endl;

	FST::FST fst4(
		(char*)"a cbbl j",
		8,
		FST::NODE(1, FST::RELATION('a', 1)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION(' ', 2)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION('c', 3)),
		FST::NODE(2, FST::RELATION('b', 4), FST::RELATION(' ', 4)),
		FST::NODE(3, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5)),
		FST::NODE(4, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6), FST::RELATION(' ', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst4))
		cout << "Цепочка " << fst4.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst4.string << " не распознана" << endl;

	FST::FST fst5(
		(char*)"a c l j",
		8,
		FST::NODE(1, FST::RELATION('a', 1)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION(' ', 2)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION('c', 3)),
		FST::NODE(2, FST::RELATION('b', 4), FST::RELATION(' ', 4)),
		FST::NODE(3, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5)),
		FST::NODE(4, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6), FST::RELATION(' ', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst5))
		cout << "Цепочка " << fst5.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst5.string << " не распознана" << endl;

	FST::FST fst6(
		(char*)"a c lbbbj",
		8,
		FST::NODE(1, FST::RELATION('a', 1)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION(' ', 2)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION('c', 3)),
		FST::NODE(2, FST::RELATION('b', 4), FST::RELATION(' ', 4)),
		FST::NODE(3, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5)),
		FST::NODE(4, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6), FST::RELATION(' ', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst6))
		cout << "Цепочка " << fst6.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst6.string << " не распознана" << endl;

	FST::FST fst7(
		(char*)"a c kbj",
		8,
		FST::NODE(1, FST::RELATION('a', 1)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION(' ', 2)),
		FST::NODE(2, FST::RELATION('b', 2), FST::RELATION('c', 3)),
		FST::NODE(2, FST::RELATION('b', 4), FST::RELATION(' ', 4)),
		FST::NODE(3, FST::RELATION('b', 4), FST::RELATION('k', 5), FST::RELATION('l', 5)),
		FST::NODE(4, FST::RELATION('k', 5), FST::RELATION('l', 5), FST::RELATION('b', 6), FST::RELATION(' ', 6)),
		FST::NODE(2, FST::RELATION('b', 6), FST::RELATION('j', 7)),
		FST::NODE()
	);
	if (FST::execute(fst7))
		cout << "Цепочка " << fst7.string << " распознана" << endl;
	else
		cout << "Цепочка " << fst7.string << " не распознана" << endl;


}