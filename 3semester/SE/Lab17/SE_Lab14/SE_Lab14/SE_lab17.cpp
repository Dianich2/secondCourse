#include <cwchar>
#include <iostream>
#include "stdafx.h"
#include "Error.h"   //Errors handling
#include "Parm.h"  //Parms handling
#include "In.h"
#include "Log.h"   //����� � ���� �� ������
#include "Out.h"

using namespace std;

int _tmain(int argc, wchar_t* argv[]) {
	setlocale(LC_ALL, "Russian");

	cout << "---  ���� In::getin  ---" << endl;
	try
	{
		Parm::PARM parm = Parm::getparm(argc, argv);
		In::IN in = In::getin(parm.in);
		cout << in.text << endl;
		cout << "����� ��������: " << in.size << endl;
		cout << "����� �����: " << in.lines << endl;
		cout << "���������: " << in.ignore << endl;
	}
	catch (Error::ERROR e)
	{
		cout << "ID: " << e.id << " ���������: " << e.message << " ������: " << e.inext.line << " �������:" << e.inext.col << endl;
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
		/*Log::WriteLine(log, (char*)"����", (char*)" ��� ������ \n", "");
		Log::WriteLine(log, (wchar_t*)L"����", (wchar_t*)L" ��� ������ \n", L"");*/
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