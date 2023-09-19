#pragma once
#include <fstream>
#include "In.h"
#include "Parm.h"
#include "Error.h"

namespace Log
{
	struct LOG
	{
		wchar_t logfile[PARM_MAX_SIZE];
		std::ofstream* stream;
	};

	static const LOG INITLOG{ L"", NULL }; //структура для начальной инициализации LOG
	LOG getlog(wchar_t logfile[]); //сформировать структуру LOG
	void WriteLine(LOG log, char* c, ...); //вывести в протокол конкатенацю строк
	void WriteLine(LOG log, wchar_t* c, ...);//вывести в протокол конкатенацию строк
	void WriteLog(LOG log);//вывести в протокол заголовок
	void WriteParm(LOG log, Parm::PARM parm);//вывести в протокол информацию о входных параметрач
	void WriteIn(LOG log, In::IN in); //вывести в протокол о входном потоке
	void WriteError(LOG log, Error::ERROR error); //вывести в протокол об ошибке
	void Close(LOG log);
};