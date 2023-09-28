#include "stdafx.h"
#include <iomanip>
#include <algorithm>
#include <iterator>
#include <string>
#include <string>
#include <sstream>
using namespace std;

#define IN_CODE_DELIMETER '|'
#define SPACE ' '
#define PLUS '+'
#define MINUS '-'
#define STAR '*'
#define DIRSLASH '/'
#define EQUAL '='

LT::LexTable __LexTable = LT::Create(LT_MAXSIZE - 1);
IT::IdTable __IdTable = IT::Create(TI_MAXSIZE - 1);
std::fstream file;

namespace Lex_analyser
{

	unsigned char** divideText(unsigned char text[], int size)
	{
		unsigned char** word = new unsigned char* [max_word];
		for (int i = 0; i < max_word; i++)
			word[i] = new unsigned char[size_word] {NULL};

		bool findSP, findLit = false;
		int j = 0;
		char SP[] = { " ,;(){}=+-*/|" };
		for (int i = 0, k = 0; i < size - 1; i++, k++)
		{
			findSP = false;
			if (text[i] == '\'')
				findLit = !findLit;
			for (int t = 0; t < sizeof(SP) - 1; t++)
			{
				if ((text[i] == SP[t]) && !findLit)
				{
					findSP = true;
					if (word[j][0] != NULL)
					{
						word[j++][k] = '\0';
						k = 0;
					}
					if (SP[t] == ' ')
					{
						k = -1;
						break;
					}
					word[j][k++] = SP[t];
					word[j++][k] = '\0';
					k = -1;
					break;
				}
			}
			if (!findSP)
				word[j][k] = text[i];
		}
		word[j] = NULL;

		for (int i = 0; i < j; i++)                // âûâîä ïîñòðî÷íîãî ðàçäåëåíèÿ â êîíñîëü
		{
			if (!strcmp((char*)word[i], ""))
				return NULL;
			std::cout << i << "." << word[i] << endl;
		}
		return word;
	}


	void Add_To_LT(int line, char c)
	{
		LT::Entry entry;
		entry.sn = line;
		if (c != 'i')
			entry.idxTI = LT_TI_NULLIDX;
		else
			entry.idxTI = __IdTable.size;
		memset(entry.lexema, '\0', strlen(entry.lexema) - 1);
		entry.lexema[0] = c;
		LT::Add(__LexTable, entry);
	}


	LEX lexAnalys(Log::LOG log, In::IN in)
	{
		LEX lex;
		LT::LexTable lextable = LT::Create(LT_MAXSIZE);
		IT::IdTable idtable = IT::Create(TI_MAXSIZE);

		unsigned char** word = new unsigned char* [max_word];
		for (int i = 0; i < max_word; i++)
			word[i] = new unsigned char[size_word] {NULL};

		word = divideText(in.text, in.size); //ðàçäåëåíèå íà ëåêñåìû 


		int indexLex = 0;
		int indexID = 1;
		int countLit = 1;
		int line = 1;
		int position = 0;

		unsigned char emptystr[] = "";
		unsigned char* RegionPrefix = new unsigned char[10] { "" };
		unsigned char* buferRegionPrefix = new unsigned char[10] { "" };
		unsigned char* pastRegionPrefix = new unsigned char[10] { "" };
		unsigned char* L = new unsigned char[2] { "L" };
		unsigned char* bufL = new unsigned char[TI_STR_MAXSIZE];
		unsigned char* nameLiteral = new unsigned char[TI_STR_MAXSIZE] { "" };
		char* charCountLit = new char[10] { "" };

		bool findFunc = false;
		bool findParm = false;
		IT::Entry entryIT;

		for (int i = 0; word[i] != NULL; i++, indexLex++)
		{
			bool findSameID = false;

			FST::FST fstDeclare(word[i], FST_DECLARE);
			if (FST::execute(fstDeclare))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_DECLARE, LT_TI_NULLIDX, line);

				LT::Add(lextable, entryLT);
				continue;
			}
			FST::FST fstTypeInteger(word[i], FST_INTEGER);
			if (FST::execute(fstTypeInteger))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_INTEGER, LT_TI_NULLIDX, line);
				LT::Add(lextable, entryLT);

				entryIT.iddatatype = IT::INT;
				continue;
			}
			FST::FST fstTypeString(word[i], FST_STRING);
			if (FST::execute(fstTypeString))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_STRING, LT_TI_NULLIDX, line);
				LT::Add(lextable, entryLT);

				entryIT.iddatatype = IT::STR;
				_mbscpy(entryIT.value.vstr.str, emptystr);
				continue;
			}
			FST::FST fstFunction(word[i], FST_FUNCTION);
			if (FST::execute(fstFunction))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_FUNCTION, LT_TI_NULLIDX, line);
				LT::Add(lextable, entryLT);

				entryIT.idtype = IT::F;
				findFunc = true;
				continue;
			}
			FST::FST fstReturn(word[i], FST_RETURN);
			if (FST::execute(fstReturn))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_RETURN, LT_TI_NULLIDX, line);
				LT::Add(lextable, entryLT);
				continue;
			}
			FST::FST fstPrint(word[i], FST_PRINT);
			if (FST::execute(fstPrint))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_PRINT, LT_TI_NULLIDX, line);
				LT::Add(lextable, entryLT);
				continue;
			}
			FST::FST fstMain(word[i], FST_MAIN);
			if (FST::execute(fstMain))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_MAIN, LT_TI_NULLIDX, line);
				LT::Add(lextable, entryLT);

				_mbscpy(pastRegionPrefix, RegionPrefix);
				_mbscpy(RegionPrefix, word[i]);
				continue;
			}
			FST::FST fstIdentif(word[i], FST_ID);
			if (FST::execute(fstIdentif))
			{

				if (findFunc)
				{
					int idx = IT::IsId(idtable, word[i]);
					if (idx != TI_NULLIDX)
					{
						LT::Entry entryLT = writeEntry(entryLT, LEX_ID, idx, line);
						LT::Add(lextable, entryLT);
						findFunc = false;
						continue;
					}
				}
				else
				{
					int idx = IT::IsId(idtable, word[i]);
					if (idx != TI_NULLIDX)
					{
						LT::Entry entryLT = writeEntry(entryLT, LEX_ID, idx, line);
						LT::Add(lextable, entryLT);
						findFunc = false;
						continue;
					}
					_mbscpy(buferRegionPrefix, RegionPrefix);
					word[i] = _mbscat(buferRegionPrefix, word[i]);
					idx = IT::IsId(idtable, word[i]);
					if (idx != TI_NULLIDX)
					{
						LT::Entry entryLT = writeEntry(entryLT, LEX_ID, idx, line);
						LT::Add(lextable, entryLT);
						continue;
					}
				}
				LT::Entry entryLT = writeEntry(entryLT, LEX_ID, indexID++, line);
				LT::Add(lextable, entryLT);
				if (findParm)
				{
					entryIT.idtype = IT::P;
				}
				else if (!findFunc)
				{

					entryIT.idtype = IT::V;
					if (entryIT.iddatatype == IT::INT)
						entryIT.value.vint = TI_INT_DEFAULT;
					if (entryIT.iddatatype == IT::STR) {
						entryIT.value.vstr.len = 0;
						memset(entryIT.value.vstr.str, TI_STR_DEFAULT, sizeof(char));
					}
				}
				else {
					_mbscpy(pastRegionPrefix, RegionPrefix);
					_mbscpy(RegionPrefix, word[i]);
				}

				entryIT.idxfirstLE = indexLex;
				_mbscpy(entryIT.id, word[i]);
				IT::Add(idtable, entryIT);
				findFunc = false;
				continue;
			}

			FST::FST fstLiteralInt(word[i], FST_INTLIT);
			if (FST::execute(fstLiteralInt))
			{
				int value = atoi((char*)word[i]);
				for (int k = 0; k < idtable.size; k++)
				{
					if (idtable.table[k].value.vint == value && idtable.table[k].idtype == IT::L)
					{
						LT::Entry entryLT = writeEntry(entryLT, LEX_LITERAL, k, line);
						LT::Add(lextable, entryLT);
						findSameID = true;
						break;
					}
				}
				if (findSameID)
					continue;
				LT::Entry entryLT = writeEntry(entryLT, LEX_LITERAL, indexID++, line);
				LT::Add(lextable, entryLT);
				entryIT.idtype = IT::L;
				entryIT.iddatatype = IT::INT;
				entryIT.value.vint = value;
				entryIT.idxfirstLE = indexLex;
				_itoa_s(countLit++, charCountLit, sizeof(char) * 10, 10);
				_mbscpy(bufL, L);
				word[i] = _mbscat(bufL, (unsigned char*)charCountLit);
				_mbscpy(entryIT.id, word[i]);
				IT::Add(idtable, entryIT);
				continue;
			}
			FST::FST fstLiteralString(word[i], FST_STRLIT);
			if (FST::execute(fstLiteralString))
			{

				int length = _mbslen(word[i]);
				for (int k = 0; k < length; k++)
					word[i][k] = word[i][k + 1];
				word[i][length - 2] = 0;

				for (int k = 0; k < idtable.size; k++)
				{
					if (!(_mbscmp(idtable.table[k].value.vstr.str, word[i])))
					{
						findSameID = true;
						LT::Entry entryLT = writeEntry(entryLT, LEX_LITERAL, k, line);
						LT::Add(lextable, entryLT);
						break;
					}
				}
				if (findSameID)
					continue;
				LT::Entry entryLT = writeEntry(entryLT, LEX_LITERAL, indexID++, line);
				LT::Add(lextable, entryLT);
				_mbscpy(entryIT.value.vstr.str, word[i]);
				entryIT.value.vstr.len = length - 2;
				entryIT.idtype = IT::L;
				entryIT.iddatatype = IT::STR;
				entryIT.idxfirstLE = indexLex;

				_itoa_s(countLit++, charCountLit, sizeof(char) * 10, 10);
				_mbscpy(bufL, L);
				nameLiteral = _mbscat(bufL, (unsigned char*)charCountLit);
				_mbscpy(entryIT.id, nameLiteral);
				IT::Add(idtable, entryIT);
				continue;
			}

			FST::FST fstOperator(word[i], FST_OPERATOR);
			if (FST::execute(fstOperator))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_OPERATOR, indexID++, line);

				LT::Add(lextable, entryLT);
				_mbscpy(entryIT.id, word[i]);
				entryIT.idxfirstLE = indexLex;
				entryIT.idtype = IT::OP;
				IT::Add(idtable, entryIT);
				continue;
			}
			FST::FST fstSemicolon(word[i], FST_SEMICOLON);
			if (FST::execute(fstSemicolon))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_SEMICOLON, LT_TI_NULLIDX, line);
				LT::Add(lextable, entryLT);
				continue;
			}
			FST::FST fstComma(word[i], FST_COMMA);
			if (FST::execute(fstComma))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_COMMA, LT_TI_NULLIDX, line);

				LT::Add(lextable, entryLT);
				continue;
			}
			FST::FST fstLeftBrace(word[i], FST_LEFTBRACE);
			if (FST::execute(fstLeftBrace))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_LEFTBRACE, LT_TI_NULLIDX, line);
				LT::Add(lextable, entryLT);
				continue;
			}
			FST::FST fstRightBrace(word[i], FST_BRACELET);
			if (FST::execute(fstRightBrace))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_BRACELET, LT_TI_NULLIDX, line);
				LT::Add(lextable, entryLT);
				continue;
			}
			FST::FST fstLeftThesis(word[i], FST_LEFTTHESIS);
			if (FST::execute(fstLeftThesis))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_LEFTTHESIS, LT_TI_NULLIDX, line);
				LT::Add(lextable, entryLT);

				continue;
			}
			FST::FST fstRightThesis(word[i], FST_RIGHTTHESIS);
			if (FST::execute(fstRightThesis))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_RIGHTTHESIS, LT_TI_NULLIDX, line);
				if (findParm && word[i + 1][0] != LEX_LEFTBRACE && word[i + 2][0] != LEX_LEFTBRACE && !checkBrace(word, i + 1))
				{
					_mbscpy(RegionPrefix, pastRegionPrefix); //ïðåäûäóùóþ îáëàñòü âèäèìîñòè
				}
				findParm = false;
				LT::Add(lextable, entryLT);
				continue;
			}
			FST::FST fstEqual(word[i], FST_EQUAL);
			if (FST::execute(fstEqual))
			{
				LT::Entry entryLT = writeEntry(entryLT, LEX_EQUAL, LT_TI_NULLIDX, line);
				LT::Add(lextable, entryLT);
				continue;
			}
			position += _mbslen(word[i]);
			if (word[i][0] == IN_CODE_DELIMETER)
			{
				line++;
				position = 0;
				indexLex--;
				continue;
			}
			throw ERROR_THROW_IN(113, line, position);
		}
		lex.idtable = idtable;
		lex.lextable = lextable;
		return lex;
	}

	bool checkBrace(unsigned char** word, int k)
	{
		while (word[k][0] == IN_CODE_DELIMETER)
		{
			k++;
		}
		if (word[k][0] == LEX_LEFTBRACE)
			return 1;
		else
			return 0;
	}

	/*void Lexical_analysis(Parm::PARM parm, In::IN in)
	{
		unsigned char** word = new unsigned char* [max_word];
		for (int i = 0; i < max_word; i++)
			word[i] = new unsigned char[size_word] {NULL};

		word = divideText(in.text, in.size);


		LEX_FLAGS _LEX_FLAGS;
		IT::Entry _IT_entry;
		char tmp_char;
		char tmp_word[127] = "";
		int line = 0;
		short k = 0;
		char tmp_func[ID_MAXSIZE] = "";
		char tmp_func_external[ID_MAXSIZE * 2] = "";
		char tmp_func_standart_library[ID_MAXSIZE * 2] = "";
		unsigned short literal_count = 1;

		for (int i = 0; i < in.size; i++)
		{
			tmp_char = in.text[i];
			if (tmp_char == '|')
			{
				line++;
				Add_To_LT(line, '|');
				continue;
			}

			if (tmp_char != ' ')
			{
				tmp_word[k] = tmp_char;
				k++;
				continue;
			}
			else
			{
				tmp_word[k] = '\0';
				k = 0;
				switch (Check_FST(tmp_word))
				{
				case _TYPEINT:
					Add_To_LT(line, LEX_INTEGER);
					_LEX_FLAGS.__flag_int = true;
					break;
				case _TYPESTRING:
					Add_To_LT(line, LEX_STRING);
					_LEX_FLAGS.__flag_string = true;
					break;
				case _TYPEFUNCTION:
					Add_To_LT(line, LEX_FUNCTION);
					if ((_LEX_FLAGS.__flag_function && _LEX_FLAGS.__flag_declare) && (_LEX_FLAGS.__flag_int || _LEX_FLAGS.__flag_string))
						_LEX_FLAGS.__flag_function_external = true;
					_LEX_FLAGS.__flag_function = true;
					break;
				case _STRDECLARE:
					Add_To_LT(line, LEX_DECLARE);
					_LEX_FLAGS.__flag_declare = true;
					break;
				case _STRRETURN:
					Add_To_LT(line, LEX_RETURN);
					break;
				case _STRMAIN:
					Add_To_LT(line, LEX_MAINFUNC);
					strcpy_s(tmp_func, tmp_word);
					_LEX_FLAGS.__flag_function = true;
					break;
				case _STRPRINT:
					Add_To_LT(line, LEX_PRINT);
					break;
				case _LEFTBRACE:
					Add_To_LT(line, LEX_LEFTBRACE);
					break;
				case _RIGHTBRACE:
					Add_To_LT(line, LEX_BRACELET);
					_LEX_FLAGS.__flag_function = false;
					break;
				case _LEFTTHESIS:
					Add_To_LT(line, LEX_LEFTHESIS);
					_LEX_FLAGS.__flag_int = false;
					_LEX_FLAGS.__flag_string = false;
					if (_LEX_FLAGS.__flag_function || _LEX_FLAGS.__flag_function_external || _LEX_FLAGS.__flag_standard_library)
						_LEX_FLAGS.__flag_parameter = true;
					break;
				case _RIGHTTHESIS:
					Add_To_LT(line, LEX_RIGHTHESIS);
					_LEX_FLAGS.__flag_int = false;
					_LEX_FLAGS.__flag_string = false;
					_LEX_FLAGS.__flag_parameter = false;
					break;
				case _SEMICOLON:
					Add_To_LT(line, LEX_SEMICOLON);
					_LEX_FLAGS.__flag_int = false;
					_LEX_FLAGS.__flag_string = false;
					_LEX_FLAGS.__flag_parameter = false;
					_LEX_FLAGS.__flag_declare = false;
					_LEX_FLAGS.__flag_function_external = false;
					_LEX_FLAGS.__flag_standard_library = false;
					break;
				case _COMMA:
					Add_To_LT(line, LEX_COMMA);
					_LEX_FLAGS.__flag_int = false;
					_LEX_FLAGS.__flag_string = false;
					break;
				case _PLUS:
					Add_To_LT(line, LEX_PLUS);
					break;
				case _MINUS:
					Add_To_LT(line, LEX_MINUS);
					break;
				case _DEL:
					Add_To_LT(line, LEX_DIRSLASH);
					break;
				case _UMN:
					Add_To_LT(line, LEX_STAR);
					break;
				case _RAVNO:
					Add_To_LT(line, LEX_RAV);
					break;
				case _LITERAL_INT:
					Add_To_LT(line, LEX_LITERAL);
					break;
				case _LITERAL_STR:
					Add_To_LT(line, LEX_LITERAL);
					break;
				case _FSTIDENF:
					Add_To_LT(line, LEX_ID);
					break;
				case _STANDART_LIBRARY:
					Add_To_LT(line, LEX_ID);
					_LEX_FLAGS.__flag_standard_library = true;
				default:
					break;
				}
			}
		}

		std::fstream file;
		file.open(parm.out);
		if (file.fail())
		{
			throw ERROR_THROW(112);
		}
		file << '0' << __LexTable.table[0].sn + 1 << ' ';


		for (int i = 0; i < __LexTable.size; i++)
		{
			if (__LexTable.table[i].lexema[0] == '|')
			{
				file << '\n';
				if (i != (__LexTable.size - 1))
				{
					if (__LexTable.table[i].sn + 1 < 10)
						file << '0' << __LexTable.table[i].sn + 1 << ' ';
					else
						file << __LexTable.table[i].sn + 1 << ' ';
				}
				continue;
			}
			file << __LexTable.table[i].lexema;

		}
	}*/

	//short Check_FST(char* c)
	//{
	//	FST::FST typeint(c,
	//		8,
	//		FST::NODE(1, FST::RELATION('i', 1)),
	//		FST::NODE(1, FST::RELATION('n', 2)),
	//		FST::NODE(1, FST::RELATION('t', 3)),
	//		FST::NODE(1, FST::RELATION('e', 4)),
	//		FST::NODE(1, FST::RELATION('g', 5)),
	//		FST::NODE(1, FST::RELATION('e', 6)),
	//		FST::NODE(1, FST::RELATION('r', 7)),
	//		FST::NODE()
	//	);

	//	FST::FST typestring(c,
	//		7,
	//		FST::NODE(1, FST::RELATION('s', 1)),
	//		FST::NODE(1, FST::RELATION('t', 2)),
	//		FST::NODE(1, FST::RELATION('r', 3)),
	//		FST::NODE(1, FST::RELATION('i', 4)),
	//		FST::NODE(1, FST::RELATION('n', 5)),
	//		FST::NODE(1, FST::RELATION('g', 6)),
	//		FST::NODE()
	//	);

	//	FST::FST typefunction(c,
	//		9,
	//		FST::NODE(1, FST::RELATION('f', 1)),
	//		FST::NODE(1, FST::RELATION('u', 2)),
	//		FST::NODE(1, FST::RELATION('n', 3)),
	//		FST::NODE(1, FST::RELATION('c', 4)),
	//		FST::NODE(1, FST::RELATION('t', 5)),
	//		FST::NODE(1, FST::RELATION('i', 6)),
	//		FST::NODE(1, FST::RELATION('o', 7)),
	//		FST::NODE(1, FST::RELATION('n', 8)),
	//		FST::NODE()
	//	);

	//	FST::FST strdeclare(c,
	//		8,
	//		FST::NODE(1, FST::RELATION('d', 1)),
	//		FST::NODE(1, FST::RELATION('e', 2)),
	//		FST::NODE(1, FST::RELATION('c', 3)),
	//		FST::NODE(1, FST::RELATION('l', 4)),
	//		FST::NODE(1, FST::RELATION('a', 5)),
	//		FST::NODE(1, FST::RELATION('r', 6)),
	//		FST::NODE(1, FST::RELATION('e', 7)),
	//		FST::NODE()
	//	);

	//	FST::FST streturn(c,
	//		7,
	//		FST::NODE(1, FST::RELATION('r', 1)),
	//		FST::NODE(1, FST::RELATION('e', 2)),
	//		FST::NODE(1, FST::RELATION('t', 3)),
	//		FST::NODE(1, FST::RELATION('u', 4)),
	//		FST::NODE(1, FST::RELATION('r', 5)),
	//		FST::NODE(1, FST::RELATION('n', 6)),
	//		FST::NODE()
	//	);

	//	FST::FST strmain(c,
	//		5,
	//		FST::NODE(1, FST::RELATION('m', 1)),
	//		FST::NODE(1, FST::RELATION('a', 2)),
	//		FST::NODE(1, FST::RELATION('i', 3)),
	//		FST::NODE(1, FST::RELATION('n', 4)),
	//		FST::NODE()
	//	);

	//	FST::FST strprint(c,
	//		6,
	//		FST::NODE(1, FST::RELATION('p', 1)),
	//		FST::NODE(1, FST::RELATION('r', 2)),
	//		FST::NODE(1, FST::RELATION('i', 3)),
	//		FST::NODE(1, FST::RELATION('n', 4)),
	//		FST::NODE(1, FST::RELATION('t', 5)),
	//		FST::NODE()
	//	);

	//	FST::FST leftbrace(c,
	//		2,
	//		FST::NODE(1, FST::RELATION('{', 1)),
	//		FST::NODE()
	//	);

	//	FST::FST rightbrace(c,
	//		2,
	//		FST::NODE(1, FST::RELATION('}', 1)),
	//		FST::NODE()
	//	);

	//	FST::FST leftthesis(c,
	//		2,
	//		FST::NODE(1, FST::RELATION('(', 1)),
	//		FST::NODE()
	//	);

	//	FST::FST rightthesis(c,
	//		2,
	//		FST::NODE(1, FST::RELATION(')', 1)),
	//		FST::NODE()
	//	);

	//	FST::FST semicolon(c,
	//		2,
	//		FST::NODE(1, FST::RELATION(';', 1)),
	//		FST::NODE()
	//	);

	//	FST::FST comma(c,
	//		2,
	//		FST::NODE(1, FST::RELATION(',', 1)),
	//		FST::NODE()
	//	);

	//	FST::FST _plus(c,
	//		2,
	//		FST::NODE(1, FST::RELATION('+', 1)),
	//		FST::NODE());

	//	FST::FST _minus(c,
	//		2,
	//		FST::NODE(1, FST::RELATION('-', 1)),
	//		FST::NODE());

	//	FST::FST divider(c,
	//		2,
	//		FST::NODE(1, FST::RELATION('/', 1)),
	//		FST::NODE());

	//	FST::FST umn(c,
	//		2,
	//		FST::NODE(1, FST::RELATION('*', 1)),
	//		FST::NODE());

	//	FST::FST ravno(c,
	//		2,
	//		FST::NODE(1, FST::RELATION('=', 1)),
	//		FST::NODE());

	//	FST::FST Literal_int(c,
	//		2,
	//		FST::NODE(20,
	//			FST::RELATION('0', 0), FST::RELATION('1', 0), FST::RELATION('2', 0),
	//			FST::RELATION('3', 0), FST::RELATION('4', 0), FST::RELATION('5', 0),
	//			FST::RELATION('6', 0), FST::RELATION('7', 0), FST::RELATION('8', 0),
	//			FST::RELATION('9', 0), FST::RELATION('0', 1), FST::RELATION('1', 1),
	//			FST::RELATION('2', 1), FST::RELATION('3', 1), FST::RELATION('4', 1),
	//			FST::RELATION('5', 1), FST::RELATION('6', 1), FST::RELATION('7', 1),
	//			FST::RELATION('8', 1), FST::RELATION('9', 1)),
	//		FST::NODE()
	//	);

	//	FST::FST Literal_str(c,
	//		4,
	//		FST::NODE(1, FST::RELATION('\'', 1)),
	//		FST::NODE(20,
	//			FST::RELATION('0', 1), FST::RELATION('1', 1), FST::RELATION('2', 1),
	//			FST::RELATION('3', 1), FST::RELATION('4', 1), FST::RELATION('5', 1),
	//			FST::RELATION('6', 1), FST::RELATION('7', 1), FST::RELATION('8', 1),
	//			FST::RELATION('9', 1), FST::RELATION('0', 2), FST::RELATION('1', 2),
	//			FST::RELATION('2', 2), FST::RELATION('3', 2), FST::RELATION('4', 2),
	//			FST::RELATION('5', 2), FST::RELATION('6', 2), FST::RELATION('7', 2),
	//			FST::RELATION('8', 2), FST::RELATION('9', 2)),
	//		FST::NODE(1, FST::RELATION('\'', 3)),
	//		FST::NODE()
	//	);

	//	FST::FST fstidenf(c,
	//		2,
	//		FST::NODE(54,
	//			FST::RELATION('a', 1), FST::RELATION('a', 0), FST::RELATION('b', 1), FST::RELATION('b', 0),
	//			FST::RELATION('c', 1), FST::RELATION('c', 0), FST::RELATION('d', 1), FST::RELATION('d', 0), FST::RELATION('e', 1), FST::RELATION('e', 0),
	//			FST::RELATION('f', 1), FST::RELATION('f', 0), FST::RELATION('g', 1), FST::RELATION('g', 0), FST::RELATION('h', 0), FST::RELATION('h', 1), FST::RELATION('i', 0), FST::RELATION('i', 1),
	//			FST::RELATION('j', 0), FST::RELATION('j', 1), FST::RELATION('k', 0), FST::RELATION('k', 1), FST::RELATION('l', 0), FST::RELATION('l', 1),
	//			FST::RELATION('m', 0), FST::RELATION('m', 1), FST::RELATION('n', 0), FST::RELATION('n', 1), FST::RELATION('o', 0), FST::RELATION('o', 1),
	//			FST::RELATION('p', 0), FST::RELATION('p', 1), FST::RELATION('q', 0), FST::RELATION('q', 1), FST::RELATION('r', 0), FST::RELATION('r', 1),
	//			FST::RELATION('s', 0), FST::RELATION('s', 1), FST::RELATION('t', 0), FST::RELATION('t', 1), FST::RELATION('u', 0), FST::RELATION('u', 1),
	//			FST::RELATION('v', 0), FST::RELATION('v', 1), FST::RELATION('w', 0), FST::RELATION('w', 1), FST::RELATION('x', 0), FST::RELATION('x', 1),
	//			FST::RELATION('y', 0), FST::RELATION('y', 1), FST::RELATION('z', 0), FST::RELATION('z', 1)),
	//		FST::NODE()
	//	);

	//	FST::FST strlen_func(c,
	//		7,
	//		FST::NODE(1, FST::RELATION('s', 1)),
	//		FST::NODE(1, FST::RELATION('t', 2)),
	//		FST::NODE(1, FST::RELATION('r', 3)),
	//		FST::NODE(1, FST::RELATION('l', 4)),
	//		FST::NODE(1, FST::RELATION('e', 5)),
	//		FST::NODE(1, FST::RELATION('n', 6)),
	//		FST::NODE()
	//	);

	//	FST::FST substr_func(c,
	//		7,
	//		FST::NODE(1, FST::RELATION('s', 1)),
	//		FST::NODE(1, FST::RELATION('u', 2)),
	//		FST::NODE(1, FST::RELATION('b', 3)),
	//		FST::NODE(1, FST::RELATION('s', 4)),
	//		FST::NODE(1, FST::RELATION('t', 5)),
	//		FST::NODE(1, FST::RELATION('r', 6)),
	//		FST::NODE()
	//	);

	//	typeint.string = c;
	//	if (FST::execute(typeint))
	//		return _TYPEINT;
	//	typestring.string = c;
	//	if (FST::execute(typestring))
	//		return _TYPESTRING;
	//	typefunction.string = c;
	//	if (FST::execute(typefunction))
	//		return _TYPEFUNCTION;
	//	strdeclare.string = c;
	//	if (FST::execute(strdeclare))
	//		return _STRDECLARE;
	//	streturn.string = c;
	//	if (FST::execute(streturn))
	//		return _STRRETURN;
	//	strmain.string = c;
	//	if (FST::execute(strmain))
	//		return _STRMAIN;
	//	strprint.string = c;
	//	if (FST::execute(strprint))
	//		return _STRPRINT;

	//	leftbrace.string = c;
	//	if (FST::execute(leftbrace))
	//		return _LEFTBRACE;
	//	rightbrace.string = c;
	//	if (FST::execute(rightbrace))
	//		return _RIGHTBRACE;
	//	leftthesis.string = c;
	//	if (FST::execute(leftthesis))
	//		return _LEFTTHESIS;
	//	rightthesis.string = c;
	//	if (FST::execute(rightthesis))
	//		return _RIGHTTHESIS;
	//	rightthesis.string = c;
	//	if (FST::execute(rightthesis))
	//		return _RIGHTTHESIS;
	//	semicolon.string = c;
	//	if (FST::execute(semicolon))
	//		return _SEMICOLON;
	//	comma.string = c;
	//	if (FST::execute(comma))
	//		return _COMMA;
	//	_plus.string = c;
	//	if (FST::execute(_plus))
	//		return _PLUS;
	//	_minus.string = c;
	//	if (FST::execute(_minus))
	//		return _MINUS;
	//	divider.string = c;
	//	if (FST::execute(divider))
	//		return _DEL;
	//	umn.string = c;
	//	if (FST::execute(umn))
	//		return _UMN;
	//	ravno.string = c;
	//	if (FST::execute(ravno))
	//		return _RAVNO;
	//	ravno.string = c;
	//	if (FST::execute(ravno))
	//		return _RAVNO;
	//	// функции стандартной библиотеки
	//	strlen_func.string = c;
	//	if (FST::execute(strlen_func))
	//		return _STANDART_LIBRARY;
	//	substr_func.string = c;
	//	if (FST::execute(substr_func))
	//		return _STANDART_LIBRARY;

	//	Literal_int.string = c;
	//	if (FST::execute(Literal_int))
	//		return _LITERAL_INT;
	//	Literal_str.string = c;
	//	if (FST::execute(Literal_str))
	//		return _LITERAL_STR;

	//	fstidenf.string = c;
	//	if (FST::execute(fstidenf))
	//		return _FSTIDENF;

	//	return 0;
	//}
}