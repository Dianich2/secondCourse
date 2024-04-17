EXEC SP_HELPINDEX 'Оценки';
EXEC SP_HELPINDEX 'Показатели';
EXEC SP_HELPINDEX 'Предприятия';

SELECT * FROM Оценки;

CHECKPOINT;
DBCC DROPCLEANBUFFERS;

CREATE CLUSTERED INDEX #Est_CL ON Оценки(Номер_оценки asc);



CREATE INDEX #Est_NONCLU ON Оценки(Номер_оценки, Дата_оценки);




CREATE INDEX #Est_EstNum_X ON Оценки(Номер_оценки) INCLUDE(Дата_оценки);

SELECT * FROM Оценки WHERE Номер_оценки > 1



SELECT * FROM Оценки
	WHERE [Значение Показателя] > 0.9
	AND [Значение Показателя] < 1.5;


CREATE INDEX #Est_WHERE ON Оценки(Номер_оценки)
	WHERE [Значение Показателя] > 0.9
	AND [Значение Показателя] < 1.5;



ALTER INDEX PK__Оценки__79636D6615357F41 ON Оценки REORGANIZE

ALTER INDEX PK__Оценки__79636D6615357F41 ON Оценки REBUILD WITH (online=off)


CREATE INDEX #Ind_name ON Показатели(Название_показателя) 
			WITH (FILLFACTOR = 65);


SELECT name [PK__Оценки__79636D6615357F41], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'Korneliuk_MyBase'), 
OBJECT_ID(N'Оценки'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  
WHERE name is not null