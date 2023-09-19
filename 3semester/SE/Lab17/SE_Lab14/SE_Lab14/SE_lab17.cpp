#include <cwchar>
#include <iostream>
#include "stdafx.h"
#include "Error.h"   //Errors handling
#include "Parm.h"  //Parms handling
#include "In.h"
#include "Log.h"   //вывод в файл до ошибки
#include "Out.h"

using namespace std;

int _tmain(int argc, wchar_t* argv[]) {
	setlocale(LC_ALL, "Russian");

	cout << "---  тест In::getin  ---" << endl;
	try
	{
		Parm::PARM parm = Parm::getparm(argc, argv);
		In::IN in = In::getin(parm.in);
		cout << in.text << endl;
		cout << "Всего символов: " << in.size << endl;
		cout << "Всего строк: " << in.lines << endl;
		cout << "Пропущено: " << in.ignore << endl;
	}
	catch (Error::ERROR e)
	{
		cout << "ID: " << e.id << " Сообщение: " << e.message << " Строка: " << e.inext.line << " Позиция:" << e.inext.col << endl;
		if (e.id == 101)
			return 1;
	}
	 
	Log::LOG log = Log::INITLOG;
	Out::OUT out = Out::INITOUT;
	try
	{
		Parm::PARM parm = Parm::getparm(argc, argv);
		log = Log::getlog(parm.log);
		out = Out::getout(parm.out);
		/*Log::WriteLine(log, (char*)"Тест", (char*)" без ошибок \n", "");
		Log::WriteLine(log, (wchar_t*)L"Тест", (wchar_t*)L" без ошибок \n", L"");*/
		Log::WriteLog(log);
		Log::WriteParm(log, parm);
		In::IN in = In::getin(parm.in);
		Log::WriteIn(log, in);
		Log::Close(log);

		Out::WriteToFile(out, in);
		Out::Close(out);
	}
	catch (Error::ERROR e) {
		Log::WriteError(log, e);
		Out::WriteError(out, e);
	}

}