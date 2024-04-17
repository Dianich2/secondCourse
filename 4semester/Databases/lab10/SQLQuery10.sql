EXEC SP_HELPINDEX '������';
EXEC SP_HELPINDEX '����������';
EXEC SP_HELPINDEX '�����������';

SELECT * FROM ������;

CHECKPOINT;
DBCC DROPCLEANBUFFERS;

CREATE CLUSTERED INDEX #Est_CL ON ������(�����_������ asc);



CREATE INDEX #Est_NONCLU ON ������(�����_������, ����_������);




CREATE INDEX #Est_EstNum_X ON ������(�����_������) INCLUDE(����_������);

SELECT * FROM ������ WHERE �����_������ > 1



SELECT * FROM ������
	WHERE [�������� ����������] > 0.9
	AND [�������� ����������] < 1.5;


CREATE INDEX #Est_WHERE ON ������(�����_������)
	WHERE [�������� ����������] > 0.9
	AND [�������� ����������] < 1.5;



ALTER INDEX PK__������__79636D6615357F41 ON ������ REORGANIZE

ALTER INDEX PK__������__79636D6615357F41 ON ������ REBUILD WITH (online=off)


CREATE INDEX #Ind_name ON ����������(��������_����������) 
			WITH (FILLFACTOR = 65);


SELECT name [PK__������__79636D6615357F41], avg_fragmentation_in_percent [������������ (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'Korneliuk_MyBase'), 
OBJECT_ID(N'������'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  
WHERE name is not null