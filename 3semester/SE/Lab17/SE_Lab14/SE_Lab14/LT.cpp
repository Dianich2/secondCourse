#include "stdafx.h"
#include <iostream>
#include "LT.h"
#include "Error.h"

namespace LT
{
	LexTable Create(int size)
	{
		LexTable* tabl = new LexTable;
		if (size > LT_MAXSIZE)
		{
			throw ERROR_THROW(113);
		}
		tabl->maxsize = size;
		tabl->size = 0;
		tabl->table = new Entry[size];
		return *tabl;
	}

	void Add(LexTable& lextable, Entry entry)
	{
		if (lextable.size + 1 > lextable.maxsize)
		{
			throw ERROR_THROW(114);
		}

		lextable.table[lextable.size] = entry;
		lextable.size += 1;
	}

	Entry GetEntry(LexTable& lextable, int n)
	{
		return lextable.table[n];
	}

	void Delete(LexTable& lextable)
	{
		delete[] lextable.table;
		delete& lextable;
	}

	Entry writeEntry(Entry& entry, unsigned char lexema, int indx, int line)
	{
		entry.lexema = lexema;
		entry.idxTI = indx;
		entry.sn = line;
		return entry;
	}

	void showTable(LexTable lextable, Parm::PARM parm)		// âûâîä òàáëèöû ëåêñåì
	{
		std::fstream fout;
		fout.open(parm.out, std::ios::app);//ios::app - äîïèñûââàòü â êîíåö ôàéëà
		if (!fout.is_open())
			throw ERROR_THROW(110);
		fout << "01 ";

		int number = 1;
		for (int i = 0; i < lextable.size; i++)
		{
			if (lextable.table[i].sn != number && lextable.table[i].sn != -1)   //íóìåðàöèÿ ñòðîê
			{
				while (lextable.table[i].sn - number > 1)	// ïîêà íå äîéä¸ì äî ïîñëåäíåé ñòðîêè
					number++;
				if (number < 9)
					fout << std::endl << '0' << lextable.table[i].sn << ' ';
				else
					fout << std::endl << lextable.table[i].sn << ' ';
				number++;
			}
			fout << lextable.table[i].lexema;
			if (lextable.table[i].lexema == LEX_ID || lextable.table[i].lexema == LEX_OPERATOR || lextable.table[i].lexema == LEX_LITERAL)
				fout << "<" << lextable.table[i].idxTI << ">";
		}
	}
};