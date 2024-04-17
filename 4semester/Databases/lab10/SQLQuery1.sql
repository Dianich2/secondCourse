USE UNIVERSITY
EXEC SP_HELPINDEX 'AUDITORIUM_TYPE'
EXEC SP_HELPINDEX 'AUDITORIUM'
EXEC SP_HELPINDEX 'FACULTY'
EXEC SP_HELPINDEX 'GROUPS'
EXEC SP_HELPINDEX 'PROFESSTION'
EXEC SP_HELPINDEX 'PROGRESS'
EXEC SP_HELPINDEX 'PULPIT'
EXEC SP_HELPINDEX 'STUDENT'
EXEC SP_HELPINDEX 'SUBJECT'
EXEC SP_HELPINDEX 'TEACHER'

CREATE TABLE #MyTable(
	id int,
	val VARCHAR(40),
	)

DECLARE @i INT = 1;
WHILE @i < 1002
BEGIN
	INSERT #MyTable(id, val)
	VALUES(@i ,'line ' + CAST(@i AS VARCHAR));
	SET @i = @i + 1;
END

SELECT * FROM #MyTable

SELECT * 
	FROM #MyTable m	
	WHERE m.id BETWEEN 200 AND 1000
	ORDER BY m.id --0.0066053

CHECKPOINT;
DBCC DROPCLEANBUFFERS;

CREATE CLUSTERED INDEX #MyTable_CL on #MyTable(id asc);

SELECT * 
	FROM #MyTable m	
	WHERE m.id BETWEEN 200 AND 1000
	ORDER BY m.id --0.0063853


CREATE TABLE #MyTable2(
	id int,
	val int,
	line VARCHAR(40),
	)

DECLARE @j INT = 1;
WHILE @j < 15001
BEGIN
	INSERT #MyTable2(id, val, line)
	VALUES(@j, FLOOR(10000*RAND()), 'line ' + CAST(@j AS VARCHAR));
	SET @j = @j+ 1;
END

SELECT * FROM #MyTable2

SELECT * 
	FROM #MyTable2
	WHERE id > 2000 AND val < 5000
	ORDER BY id, val; --0.062745

CREATE INDEX #MyTable2_NONCLU on #MyTable2(id, val);

SELECT * 
	FROM #MyTable2
	WHERE id > 2000 AND val < 5000  --0.062745

SELECT * 
	FROM #MyTable2
	ORDER BY id, val --0.062745





CREATE TABLE #MyTable3(
	id int,
	val int,
	line VARCHAR(40),
	)

DECLARE @k INT = 1;
WHILE @k < 15001
BEGIN
	INSERT #MyTable3(id, val, line)
	VALUES(@k, FLOOR(10000*RAND()), 'line ' + CAST(@k AS VARCHAR));
	SET @k = @k+ 1;
END

SELECT * FROM #MyTable3

SELECT val FROM #MyTable3 WHERE val > 1000 --0.062745

CREATE INDEX #MyTable3_ID_X ON #MyTable3(id) INCLUDE (val)


SELECT val FROM #MyTable3 WHERE val > 1000 --0.0494116








CREATE TABLE #MyTable4(
	id int,
	val int,
	line VARCHAR(40),
	)

DECLARE @d INT = 1;
WHILE @d < 15001
BEGIN
	INSERT #MyTable4(id, val, line)
	VALUES(@d, FLOOR(15000*RAND()), 'line ' + CAST(@d AS VARCHAR));
	SET @d = @d+ 1;
END


SELECT val FROM #MyTable4 WHERE val > 1000 AND val < 12000 --0.062745
SELECT val FROM #MyTable4 WHERE val BETWEEN 3000 AND 15000 --0.062745

CREATE INDEX #MyTable4_WHERE ON #MyTable4(val) 
					WHERE (val > 1000 AND val < 12000);


SELECT val FROM #MyTable4 WHERE val > 1000 AND val < 12000 --0.028701
SELECT val FROM #MyTable4 WHERE val BETWEEN 3000 AND 15000 --0.062745




CREATE TABLE #MyTable5(
	id int,
	val int,
	line VARCHAR(40),
	)

DECLARE @m INT = 1;
WHILE @m < 15001
BEGIN
	INSERT #MyTable5(id, val, line)
	VALUES(@m, FLOOR(15000*RAND()), 'line ' + CAST(@m AS VARCHAR));
	SET @m = @m+ 1;
END

CREATE INDEX #MyTable5_id ON #MyTable5(id)


INSERT TOP(10000) #MyTable5(id, val, line)SELECT id, val, line 
FROM #MyTable5;

SELECT name [#MyTable5_id], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
OBJECT_ID(N'#MyTable5'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  
WHERE name is not null;

--21.296

ALTER INDEX #MyTable5_id ON #MyTable5 REORGANIZE
--0

ALTER INDEX #MyTable5_id ON #MyTable5 REBUILD WITH (online=off)
--0




CREATE TABLE #MyTable6(
	id int,
	val int,
	line VARCHAR(40),
	)

DECLARE @g INT = 1;
WHILE @g < 15001
BEGIN
	INSERT #MyTable6(id, val, line)
	VALUES(@g, FLOOR(15000*RAND()), 'line ' + CAST(@g AS VARCHAR));
	SET @g = @g+ 1;
END

CREATE INDEX #MyTable6_id ON #MyTable6(id) 
			WITH (FILLFACTOR = 65);

INSERT TOP(10000) #MyTable6(id, val, line)SELECT id, val, line 
FROM #MyTable6;


SELECT name [#MyTable6_id], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'), 
OBJECT_ID(N'#MyTable6'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  
WHERE name is not null;

