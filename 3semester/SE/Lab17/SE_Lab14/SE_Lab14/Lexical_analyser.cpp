#include "stdafx.h"
#include <iomanip>
#include <algorithm>
#include <iterator>
#include <string>
#include <string>
#include <sstream>
using namespace std;

LT::LexTable __LexTable = LT::Create(LT_MAXSIZE - 1);
IT::IdTable __IdTable = IT::Create(TI_MAXSIZE - 1);
std::fstream file;

namespace Lex_analyser
{
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

	void Lexical_analysis(Parm::PARM parm, In::IN in)
	{
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
	}

	short Check_FST(char* c)
	{
		FST::FST typeint(c,
			8,
			FST::NODE(1, FST::RELATION('i', 1)),
			FST::NODE(1, FST::RELATION('n', 2)),
			FST::NODE(1, FST::RELATION('t', 3)),
			FST::NODE(1, FST::RELATION('e', 4)),
			FST::NODE(1, FST::RELATION('g', 5)),
			FST::NODE(1, FST::RELATION('e', 6)),
			FST::NODE(1, FST::RELATION('r', 7)),
			FST::NODE()
		);

		FST::FST typestring(c,
			7,
			FST::NODE(1, FST::RELATION('s', 1)),
			FST::NODE(1, FST::RELATION('t', 2)),
			FST::NODE(1, FST::RELATION('r', 3)),
			FST::NODE(1, FST::RELATION('i', 4)),
			FST::NODE(1, FST::RELATION('n', 5)),
			FST::NODE(1, FST::RELATION('g', 6)),
			FST::NODE()
		);

		FST::FST typefunction(c,
			9,
			FST::NODE(1, FST::RELATION('f', 1)),
			FST::NODE(1, FST::RELATION('u', 2)),
			FST::NODE(1, FST::RELATION('n', 3)),
			FST::NODE(1, FST::RELATION('c', 4)),
			FST::NODE(1, FST::RELATION('t', 5)),
			FST::NODE(1, FST::RELATION('i', 6)),
			FST::NODE(1, FST::RELATION('o', 7)),
			FST::NODE(1, FST::RELATION('n', 8)),
			FST::NODE()
		);

		FST::FST strdeclare(c,
			8,
			FST::NODE(1, FST::RELATION('d', 1)),
			FST::NODE(1, FST::RELATION('e', 2)),
			FST::NODE(1, FST::RELATION('c', 3)),
			FST::NODE(1, FST::RELATION('l', 4)),
			FST::NODE(1, FST::RELATION('a', 5)),
			FST::NODE(1, FST::RELATION('r', 6)),
			FST::NODE(1, FST::RELATION('e', 7)),
			FST::NODE()
		);

		FST::FST streturn(c,
			7,
			FST::NODE(1, FST::RELATION('r', 1)),
			FST::NODE(1, FST::RELATION('e', 2)),
			FST::NODE(1, FST::RELATION('t', 3)),
			FST::NODE(1, FST::RELATION('u', 4)),
			FST::NODE(1, FST::RELATION('r', 5)),
			FST::NODE(1, FST::RELATION('n', 6)),
			FST::NODE()
		);

		FST::FST strmain(c,
			5,
			FST::NODE(1, FST::RELATION('m', 1)),
			FST::NODE(1, FST::RELATION('a', 2)),
			FST::NODE(1, FST::RELATION('i', 3)),
			FST::NODE(1, FST::RELATION('n', 4)),
			FST::NODE()
		);

		FST::FST strprint(c,
			6,
			FST::NODE(1, FST::RELATION('p', 1)),
			FST::NODE(1, FST::RELATION('r', 2)),
			FST::NODE(1, FST::RELATION('i', 3)),
			FST::NODE(1, FST::RELATION('n', 4)),
			FST::NODE(1, FST::RELATION('t', 5)),
			FST::NODE()
		);

		FST::FST leftbrace(c,
			2,
			FST::NODE(1, FST::RELATION('{', 1)),
			FST::NODE()
		);

		FST::FST rightbrace(c,
			2,
			FST::NODE(1, FST::RELATION('}', 1)),
			FST::NODE()
		);

		FST::FST leftthesis(c,
			2,
			FST::NODE(1, FST::RELATION('(', 1)),
			FST::NODE()
		);

		FST::FST rightthesis(c,
			2,
			FST::NODE(1, FST::RELATION(')', 1)),
			FST::NODE()
		);

		FST::FST semicolon(c,
			2,
			FST::NODE(1, FST::RELATION(';', 1)),
			FST::NODE()
		);

		FST::FST comma(c,
			2,
			FST::NODE(1, FST::RELATION(',', 1)),
			FST::NODE()
		);

		FST::FST _plus(c,
			2,
			FST::NODE(1, FST::RELATION('+', 1)),
			FST::NODE());

		FST::FST _minus(c,
			2,
			FST::NODE(1, FST::RELATION('-', 1)),
			FST::NODE());

		FST::FST divider(c,
			2,
			FST::NODE(1, FST::RELATION('/', 1)),
			FST::NODE());

		FST::FST umn(c,
			2,
			FST::NODE(1, FST::RELATION('*', 1)),
			FST::NODE());

		FST::FST ravno(c,
			2,
			FST::NODE(1, FST::RELATION('=', 1)),
			FST::NODE());

		FST::FST Literal_int(c,
			2,
			FST::NODE(20,
				FST::RELATION('0', 0), FST::RELATION('1', 0), FST::RELATION('2', 0),
				FST::RELATION('3', 0), FST::RELATION('4', 0), FST::RELATION('5', 0),
				FST::RELATION('6', 0), FST::RELATION('7', 0), FST::RELATION('8', 0),
				FST::RELATION('9', 0), FST::RELATION('0', 1), FST::RELATION('1', 1),
				FST::RELATION('2', 1), FST::RELATION('3', 1), FST::RELATION('4', 1),
				FST::RELATION('5', 1), FST::RELATION('6', 1), FST::RELATION('7', 1),
				FST::RELATION('8', 1), FST::RELATION('9', 1)),
			FST::NODE()
		);

		FST::FST Literal_str(c,
			4,
			FST::NODE(1, FST::RELATION('\'', 1)),
			FST::NODE(20,
				FST::RELATION('0', 1), FST::RELATION('1', 1), FST::RELATION('2', 1),
				FST::RELATION('3', 1), FST::RELATION('4', 1), FST::RELATION('5', 1),
				FST::RELATION('6', 1), FST::RELATION('7', 1), FST::RELATION('8', 1),
				FST::RELATION('9', 1), FST::RELATION('0', 2), FST::RELATION('1', 2),
				FST::RELATION('2', 2), FST::RELATION('3', 2), FST::RELATION('4', 2),
				FST::RELATION('5', 2), FST::RELATION('6', 2), FST::RELATION('7', 2),
				FST::RELATION('8', 2), FST::RELATION('9', 2)),
			FST::NODE(1, FST::RELATION('\'', 3)),
			FST::NODE()
		);

		FST::FST fstidenf(c,
			2,
			FST::NODE(54,
				FST::RELATION('a', 1), FST::RELATION('a', 0), FST::RELATION('b', 1), FST::RELATION('b', 0),
				FST::RELATION('c', 1), FST::RELATION('c', 0), FST::RELATION('d', 1), FST::RELATION('d', 0), FST::RELATION('e', 1), FST::RELATION('e', 0),
				FST::RELATION('f', 1), FST::RELATION('f', 0), FST::RELATION('g', 1), FST::RELATION('g', 0), FST::RELATION('h', 0), FST::RELATION('h', 1), FST::RELATION('i', 0), FST::RELATION('i', 1),
				FST::RELATION('j', 0), FST::RELATION('j', 1), FST::RELATION('k', 0), FST::RELATION('k', 1), FST::RELATION('l', 0), FST::RELATION('l', 1),
				FST::RELATION('m', 0), FST::RELATION('m', 1), FST::RELATION('n', 0), FST::RELATION('n', 1), FST::RELATION('o', 0), FST::RELATION('o', 1),
				FST::RELATION('p', 0), FST::RELATION('p', 1), FST::RELATION('q', 0), FST::RELATION('q', 1), FST::RELATION('r', 0), FST::RELATION('r', 1),
				FST::RELATION('s', 0), FST::RELATION('s', 1), FST::RELATION('t', 0), FST::RELATION('t', 1), FST::RELATION('u', 0), FST::RELATION('u', 1),
				FST::RELATION('v', 0), FST::RELATION('v', 1), FST::RELATION('w', 0), FST::RELATION('w', 1), FST::RELATION('x', 0), FST::RELATION('x', 1),
				FST::RELATION('y', 0), FST::RELATION('y', 1), FST::RELATION('z', 0), FST::RELATION('z', 1)),
			FST::NODE()
		);

		FST::FST strlen_func(c,
			7,
			FST::NODE(1, FST::RELATION('s', 1)),
			FST::NODE(1, FST::RELATION('t', 2)),
			FST::NODE(1, FST::RELATION('r', 3)),
			FST::NODE(1, FST::RELATION('l', 4)),
			FST::NODE(1, FST::RELATION('e', 5)),
			FST::NODE(1, FST::RELATION('n', 6)),
			FST::NODE()
		);

		FST::FST substr_func(c,
			7,
			FST::NODE(1, FST::RELATION('s', 1)),
			FST::NODE(1, FST::RELATION('u', 2)),
			FST::NODE(1, FST::RELATION('b', 3)),
			FST::NODE(1, FST::RELATION('s', 4)),
			FST::NODE(1, FST::RELATION('t', 5)),
			FST::NODE(1, FST::RELATION('r', 6)),
			FST::NODE()
		);

		typeint.string = c;
		if (FST::execute(typeint))
			return _TYPEINT;
		typestring.string = c;
		if (FST::execute(typestring))
			return _TYPESTRING;
		typefunction.string = c;
		if (FST::execute(typefunction))
			return _TYPEFUNCTION;
		strdeclare.string = c;
		if (FST::execute(strdeclare))
			return _STRDECLARE;
		streturn.string = c;
		if (FST::execute(streturn))
			return _STRRETURN;
		strmain.string = c;
		if (FST::execute(strmain))
			return _STRMAIN;
		strprint.string = c;
		if (FST::execute(strprint))
			return _STRPRINT;

		leftbrace.string = c;
		if (FST::execute(leftbrace))
			return _LEFTBRACE;
		rightbrace.string = c;
		if (FST::execute(rightbrace))
			return _RIGHTBRACE;
		leftthesis.string = c;
		if (FST::execute(leftthesis))
			return _LEFTTHESIS;
		rightthesis.string = c;
		if (FST::execute(rightthesis))
			return _RIGHTTHESIS;
		rightthesis.string = c;
		if (FST::execute(rightthesis))
			return _RIGHTTHESIS;
		semicolon.string = c;
		if (FST::execute(semicolon))
			return _SEMICOLON;
		comma.string = c;
		if (FST::execute(comma))
			return _COMMA;
		_plus.string = c;
		if (FST::execute(_plus))
			return _PLUS;
		_minus.string = c;
		if (FST::execute(_minus))
			return _MINUS;
		divider.string = c;
		if (FST::execute(divider))
			return _DEL;
		umn.string = c;
		if (FST::execute(umn))
			return _UMN;
		ravno.string = c;
		if (FST::execute(ravno))
			return _RAVNO;
		ravno.string = c;
		if (FST::execute(ravno))
			return _RAVNO;
		// функции стандартной библиотеки
		strlen_func.string = c;
		if (FST::execute(strlen_func))
			return _STANDART_LIBRARY;
		substr_func.string = c;
		if (FST::execute(substr_func))
			return _STANDART_LIBRARY;

		Literal_int.string = c;
		if (FST::execute(Literal_int))
			return _LITERAL_INT;
		Literal_str.string = c;
		if (FST::execute(Literal_str))
			return _LITERAL_STR;

		fstidenf.string = c;
		if (FST::execute(fstidenf))
			return _FSTIDENF;

		return 0;
	}
}