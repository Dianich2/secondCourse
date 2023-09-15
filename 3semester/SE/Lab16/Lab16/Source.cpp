//#include <iostream>
//#include "stdafx.h"
//using namespace fst;
//
//int main()
//{
//	setlocale(LC_ALL, "Rus");
//
//	fst::FST fst0(
//		(char*)"aabbbaba",
//		4,
//		fst::NODE(3, fst::RELATION('a', 0), fst::RELATION('b', 0), fst::RELATION('a', 1)),
//		fst::NODE(1, fst::RELATION('b', 2)),
//		fst::NODE(1, fst::RELATION('a', 3)),
//		fst::NODE()
//	);
//	if (fst::execute(fst0))
//	{
//		cout << "Цепочка " << fst0.string << " распознана" << endl;
//	}
//	else
//	{
//		cout << "Цепочка " << fst0.string << " не распознана" << endl;
//	}
//
//	fst::FST fst1(
//		(char*)"abcbkbj",
//		7,
//		NODE(1, RELATION('a', 1)),
//		fst::NODE(1, fst::RELATION('b', 2)),
//		fst::NODE(2, fst::RELATION('b', 2), fst::RELATION('c', 3)),
//		fst::NODE(1, fst::RELATION('b', 4)),
//		fst::NODE(3, fst::RELATION('b', 4), fst::RELATION('k', 5), fst::RELATION('l', 5)),
//		fst::NODE(4, fst::RELATION('k', 5), fst::RELATION('l', 5), fst::RELATION('b', 6), fst::RELATION('λ', 6)),
//		fst::NODE(2, fst::RELATION('b', 6), fst::RELATION('j', 7)),
//		NODE()
//	);
//	if (!execute(fst1))
//	{
//		cout << "Цепочка " << fst1.string << " распознана" << endl;
//	}
//	else
//	{
//		cout << "Цепочка " << fst1.string << " не распознана" << endl;
//	}
//
//	fst::FST fst2(
//		(char*)"abbcbblbj",
//		7,
//		fst::NODE(1, fst::RELATION('a', 1)),
//		fst::NODE(1, fst::RELATION('b', 2)),
//		fst::NODE(2, fst::RELATION('b', 2), fst::RELATION('c', 3)),
//		fst::NODE(1, fst::RELATION('b', 4)),
//		fst::NODE(3, fst::RELATION('b', 4), fst::RELATION('k', 5), fst::RELATION('l', 5)),
//		fst::NODE(4, fst::RELATION('k', 5), fst::RELATION('l', 5), fst::RELATION('b', 6), fst::RELATION('λ', 6)),
//		fst::NODE(2, fst::RELATION('b', 6), fst::RELATION('j', 7)),
//		NODE()
//	);
//	if (!execute(fst2))
//	{
//		cout << "Цепочка " << fst2.string << " распознана" << endl;
//	}
//	else
//	{
//		cout << "Цепочка " << fst2.string << " не распознана" << endl;
//	}
//
//	fst::FST fst3(
//		(char*)"acbbbkkllbbbbj",
//		7,
//		fst::NODE(1, fst::RELATION('a', 1)),
//		fst::NODE(1, fst::RELATION('b', 2)),
//		fst::NODE(2, fst::RELATION('b', 2), fst::RELATION('c', 3)),
//		fst::NODE(1, fst::RELATION('b', 4)),
//		fst::NODE(3, fst::RELATION('b', 4), fst::RELATION('k', 5), fst::RELATION('l', 5)),
//		fst::NODE(4, fst::RELATION('k', 5), fst::RELATION('l', 5), fst::RELATION('b', 6), fst::RELATION('λ', 6)),
//		fst::NODE(2, fst::RELATION('b', 6), fst::RELATION('j', 7)),
//		NODE()
//	);
//	if (!execute(fst3))
//	{
//		cout << "Цепочка " << fst3.string << " распознана" << endl;
//	}
//	else
//	{
//		cout << "Цепочка " << fst3.string << " не распознана" << endl;
//	}
//
//	fst::FST fst4(
//		(char*)"acbblj",
//		7,
//		fst::NODE(1, fst::RELATION('a', 1)),
//		fst::NODE(1, fst::RELATION('b', 2)),
//		fst::NODE(2, fst::RELATION('b', 2), fst::RELATION('c', 3)),
//		fst::NODE(1, fst::RELATION('b', 4)),
//		fst::NODE(3, fst::RELATION('b', 4), fst::RELATION('k', 5), fst::RELATION('l', 5)),
//		fst::NODE(4, fst::RELATION('k', 5), fst::RELATION('l', 5), fst::RELATION('b', 6), fst::RELATION('λ', 6)),
//		fst::NODE(2, fst::RELATION('b', 6), fst::RELATION('j', 7)),
//		NODE()
//	);
//	if (!execute(fst4))
//	{
//		cout << "Цепочка " << fst4.string << " распознана" << endl;
//	}
//	else
//	{
//		cout << "Цепочка " << fst4.string << " не распознана" << endl;
//	}
//
//	fst::FST fst5(
//		(char*)"aclj",
//		7,
//		fst::NODE(1, fst::RELATION('a', 1)),
//		fst::NODE(1, fst::RELATION('b', 2)),
//		fst::NODE(2, fst::RELATION('b', 2), fst::RELATION('c', 3)),
//		fst::NODE(1, fst::RELATION('b', 4)),
//		fst::NODE(3, fst::RELATION('b', 4), fst::RELATION('k', 5), fst::RELATION('l', 5)),
//		fst::NODE(4, fst::RELATION('k', 5), fst::RELATION('l', 5), fst::RELATION('b', 6), fst::RELATION('λ', 6)),
//		fst::NODE(2, fst::RELATION('b', 6), fst::RELATION('j', 7)),
//		NODE()
//	);
//	if (!execute(fst5))
//	{
//		cout << "Цепочка " << fst5.string << " распознана" << endl;
//	}
//	else
//	{
//		cout << "Цепочка " << fst5.string << " не распознана" << endl;
//	}
//
//	fst::FST fst6(
//		(char*)"aclbbbj",
//		7,
//		fst::NODE(1, fst::RELATION('a', 1)),
//		fst::NODE(1, fst::RELATION('b', 2)),
//		fst::NODE(2, fst::RELATION('b', 2), fst::RELATION('c', 3)),
//		fst::NODE(1, fst::RELATION('b', 4)),
//		fst::NODE(3, fst::RELATION('b', 4), fst::RELATION('k', 5), fst::RELATION('l', 5)),
//		fst::NODE(4, fst::RELATION('k', 5), fst::RELATION('l', 5), fst::RELATION('b', 6), fst::RELATION('λ', 6)),
//		fst::NODE(2, fst::RELATION('b', 6), fst::RELATION('j', 7)),
//		NODE()
//	);
//	if (!execute(fst6))
//	{
//		cout << "Цепочка " << fst6.string << " распознана" << endl;
//	}
//	else
//	{
//		cout << "Цепочка " << fst6.string << " не распознана" << endl;
//	}
//
//	fst::FST fst7(
//		(char*)"ackbj",
//		7,
//		fst::NODE(1, fst::RELATION('a', 1)),
//		fst::NODE(1, fst::RELATION('b', 2)),
//		fst::NODE(2, fst::RELATION('b', 2), fst::RELATION('c', 3)),
//		fst::NODE(1, fst::RELATION('b', 4)),
//		fst::NODE(3, fst::RELATION('b', 4), fst::RELATION('k', 5), fst::RELATION('l', 5)),
//		fst::NODE(4, fst::RELATION('k', 5), fst::RELATION('l', 5), fst::RELATION('b', 6), fst::RELATION('λ', 6)),
//		fst::NODE(2, fst::RELATION('b', 6), fst::RELATION('j', 7)),
//		NODE()
//	);
//	if (!execute(fst7))
//	{
//		cout << "Цепочка " << fst7.string << " распознана" << endl;
//	}
//	else
//	{
//		cout << "Цепочка " << fst7.string << " не распознана" << endl;
//	}
//
//	fst::FST fst8(
//		(char*)"aackbjjzljxc",
//		7,
//		fst::NODE(1, fst::RELATION('a', 1)),
//		fst::NODE(1, fst::RELATION('b', 2)),
//		fst::NODE(2, fst::RELATION('b', 2), fst::RELATION('c', 3)),
//		fst::NODE(1, fst::RELATION('b', 4)),
//		fst::NODE(3, fst::RELATION('b', 4), fst::RELATION('k', 5), fst::RELATION('l', 5)),
//		fst::NODE(4, fst::RELATION('k', 5), fst::RELATION('l', 5), fst::RELATION('b', 6), fst::RELATION('λ', 6)),
//		fst::NODE(2, fst::RELATION('b', 6), fst::RELATION('j', 7)),
//		NODE()
//	);
//	if (!execute(fst8))
//	{
//		cout << "Цепочка " << fst8.string << " распознана" << endl;
//	}
//	else
//	{
//		cout << "Цепочка " << fst8.string << " не распознана" << endl;
//	}
//
//	return 0;
//}