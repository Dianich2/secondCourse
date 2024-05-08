SELECT SUBJECT_NAME FROM SUBJECT WHERE PULPIT = 'Исит'

DECLARE Task1Cursor CURSOR 
			FOR SELECT SUBJECT_NAME FROM SUBJECT 
				WHERE PULPIT = 'Исит'
DECLARE @SubjectName char(30), @Result char(400) = '';
OPEN Task1Cursor;
FETCH Task1Cursor into @SubjectName;
PRINT 'Subjects: ';
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @Result = TRIM(@SubjectName) + ', ' + @Result;
	FETCH Task1Cursor into @SubjectName;
END;
PRINT @Result;
CLOSE Task1Cursor;
DEALLOCATE Task1Cursor






DECLARE Task2CursorLocal CURSOR LOCAL 
			FOR SELECT SUBJECT_NAME FROM SUBJECT 
				WHERE PULPIT = 'Исит'
DECLARE @SubjectName2 char(30), @Result2 char(400) = '';
OPEN Task2CursorLocal;
FETCH Task2CursorLocal into @SubjectName2;
PRINT 'Subjects: ';
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @Result2 = TRIM(@SubjectName2) + ', ' + @Result2;
	FETCH Task2CursorLocal into @SubjectName2;
END;
PRINT @Result2;
CLOSE Task2CursorLocal;



DECLARE Task2CursorGlobal CURSOR GLOBAL
			FOR SELECT SUBJECT_NAME FROM SUBJECT 
				WHERE PULPIT = 'Исит'
DECLARE @SubjectName_2 char(30), @Result_2 char(400) = '';
OPEN Task2CursorGlobal;
FETCH Task2CursorGlobal into @SubjectName_2;
PRINT 'Subjects: ';
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @Result_2 = TRIM(@SubjectName_2) + ', ' + @Result_2;
	FETCH Task2CursorGlobal into @SubjectName_2;
END;
PRINT @Result_2;
CLOSE Task2CursorGlobal;
DEALLOCATE Task2CursorGlobal;



DELETE FROM EX1 WHERE ID = 3;
SELECT * FROM EX1;


DECLARE Task3CursorStatic CURSOR LOCAL DYNAMIC
		FOR SELECT VAL FROM EX1
DECLARE @value char(10);
OPEN Task3CursorStatic;
PRINT 'Number of rows: ' + cast(@@CURSOR_ROWS as varchar(5));

INSERT EX1(ID, VAL) VALUES(3, 'value3');

FETCH Task3CursorStatic into @value;
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @value;
	FETCH Task3CursorStatic into @value;
END;
CLOSE Task3CursorStatic






DECLARE Task4CursorScroll CURSOR LOCAL DYNAMIC SCROLL
	FOR SELECT ROW_NUMBER() OVER (ORDER BY IDSTUDENT) Номер,
	* FROM PROGRESS;

DECLARE @number VARCHAR(100), @sub VARCHAR(10), @idstudent VARCHAR(6), @pdate VARCHAR (11), @note VARCHAR (2);

OPEN Task4CursorScroll
FETCH Task4CursorScroll INTO @number, @sub ,@idstudent ,@pdate,@note;
PRINT 'Первая выбранная строка: ' + CHAR(10) + 
rtrim(@number) + ' ' + rtrim(@sub) + ' ' + rtrim(@idstudent) + ' ' + rtrim(@pdate) + ' ' + rtrim(@note);

FETCH LAST FROM Task4CursorScroll INTO @number, @sub ,@idstudent ,@pdate,@note;
PRINT 'Последняя строка: ' + CHAR(10) + 
rtrim(@number) + ' ' + rtrim(@sub) + ' ' + rtrim(@idstudent) + ' ' + rtrim(@pdate) + ' ' + rtrim(@note);

FETCH RELATIVE -1  FROM Task4CursorScroll INTO @number, @sub ,@idstudent ,@pdate,@note;
PRINT 'Первая до предыдущей строка: ' + CHAR(10) +
rtrim(@number) + ' ' + rtrim(@sub) + ' ' + rtrim(@idstudent) + ' ' + rtrim(@pdate) + ' ' + rtrim(@note);

FETCH ABSOLUTE 2  FROM Task4CursorScroll INTO @number, @sub ,@idstudent ,@pdate,@note;
PRINT 'Вторая с начала строка: ' + CHAR(10) +
rtrim(@number) + ' ' + rtrim(@sub) + ' ' + rtrim(@idstudent) + ' ' + rtrim(@pdate) + ' ' + rtrim(@note);

FETCH RELATIVE 1  FROM Task4CursorScroll INTO @number, @sub ,@idstudent ,@pdate,@note;
PRINT 'Первая после предыдущей строка: ' + CHAR(10) +
rtrim(@number) + ' ' + rtrim(@sub) + ' ' + rtrim(@idstudent) + ' ' + rtrim(@pdate) + ' ' + rtrim(@note);

FETCH ABSOLUTE -3  FROM Task4CursorScroll INTO @number, @sub ,@idstudent ,@pdate,@note;
PRINT 'Третья с конца строка: ' + CHAR(10) +
rtrim(@number) + ' ' + rtrim(@sub) + ' ' + rtrim(@idstudent) + ' ' + rtrim(@pdate) + ' ' + rtrim(@note);
CLOSE Task4CursorScroll







SELECT * FROM EX2
INSERT INTO EX2 VALUES (1, 'value1');

DECLARE @value_5 char(10), @id int;
DECLARE Task5Cursor CURSOR LOCAL DYNAMIC
	FOR SELECT ID, VAL FROM EX2 FOR UPDATE;

OPEN Task5Cursor;
FETCH Task5Cursor INTO @id, @value_5;
DELETE EX2 WHERE CURRENT OF Task5Cursor;
FETCH Task5Cursor INTO @id, @value_5;
UPDATE EX2 SET VAL = 'some value' WHERE CURRENT OF Task5Cursor;
CLOSE Task5Cursor;







DECLARE Task6Cursor CURSOR LOCAL DYNAMIC 
						FOR SELECT STUDENT.NAME, GROUPS.PROFESSION, PROGRESS.NOTE
						FROM STUDENT INNER JOIN GROUPS ON STUDENT.IDGROUP = GROUPS.IDGROUP INNER JOIN
						PROGRESS ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT;

DECLARE @name VARCHAR(300), @profession VARCHAR(300), @mark VARCHAR(2), @list VARCHAR(400);

OPEN Task6Cursor;
FETCH Task6Cursor INTO @name,@profession,@mark;
WHILE (@@FETCH_STATUS = 0)
BEGIN
	IF(@mark < 4)
	BEGIN
		DELETE PROGRESS WHERE CURRENT OF Task6Cursor;
	END;
	FETCH Task6Cursor INTO @name,@profession,@mark;
END;
CLOSE Task6Cursor;

SELECT * FROM PROGRESS ORDER BY NOTE;
INSERT INTO PROGRESS VALUES('ОАиП', 1003, '2013-01-10', 3);
INSERT INTO PROGRESS VALUES('ОАиП', 1003, '2013-01-10', 2);



select * FROM  PROGRESS

DECLARE @name2 VARCHAR(300), @mark2 VARCHAR(2)
DECLARE Task6Cursor2 CURSOR LOCAL DYNAMIC 
		FOR SELECT NOTE FROM PROGRESS WHERE IDSTUDENT = 1006

OPEN Task6Cursor2;
FETCH Task6Cursor2 INTO @mark2;
WHILE (@@FETCH_STATUS = 0)
BEGIN
	UPDATE PROGRESS SET NOTE = NOTE + 1 WHERE CURRENT OF Task6Cursor2;
	FETCH Task6Cursor2 INTO @mark2;
END;
CLOSE Task6Cursor2;
