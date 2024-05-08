
---1
go
CREATE PROCEDURE PSUBJECT
AS
BEGIN
	DECLARE @n INT = (SELECT COUNT(*) FROM SUBJECT);
	SELECT * FROM SUBJECT;
	RETURN @n;
END;

go
DECLARE @n INT = 0;
EXEC @n = PSUBJECT;
print 'rows count = ' + cast(@n as varchar(3));





---2
go
DECLARE @n int = 0, @r int = 0, @p varchar(20) = 'ИСиТ';
EXEC @n = PSUBJECT2 @p, @c = @r output;
PRINT 'Rows at all = ' + cast(@n as varchar(20));
PRINT @p + ' rows = ' + cast(@r as varchar(3));





--3
go
CREATE PROCEDURE PSUBJECT3 @p varchar(20) = null
AS
BEGIN
	DECLARE @n INT = (SELECT COUNT(*) FROM SUBJECT);
	SELECT * FROM SUBJECT WHERE PULPIT = @p;
END;

CREATE TABLE #SUBJECT
			(subject varchar(10) primary key,
			 subject_name varchar(100),
			 pulpit varchar(20))

INSERT #SUBJECT EXEC PSUBJECT3 @p = 'Исит';
SELECT * FROM #SUBJECT;
DROP TABLE #SUBJECT;




SELECT * FROM AUDITORIUM
---4

go
CREATE PROCEDURE PAUDITORIUM_INSERT @a CHAR(20), @n VARCHAR(50), @c INT = 0, @t CHAR(10)
AS
BEGIN TRY
	INSERT INTO AUDITORIUM VALUES(@a, @n, @c, @t);
	RETURN 1;
END TRY
BEGIN CATCH
	PRINT 'номер ошибки: ' + cast(error_number() as varchar(6));
	PRINT 'сообщение: ' + error_message();
	PRINT 'уровень: ' + cast(error_severity() as varchar(6));
	PRINT 'метка:' + cast(error_state() as varchar(8));
	PRINT 'номер строки: ' + cast(error_line() as varchar(8));
	if ERROR_PROCEDURE() is not null
	PRINT 'имя процедуры: ' + error_procedure();
	RETURN -1; 
END CATCH

DECLARE @ret int;
EXEC @ret = PAUDITORIUM_INSERT @a = '512-1', @n = 'ЛБ-К', @c = 40, @t = '512-1';
PRINT 'ret = ' + cast(@ret as varchar(3));
SELECT * FROM AUDITORIUM
DELETE AUDITORIUM WHERE AUDITORIUM = '512-1';







---5
go
create procedure SUBJECT_REPORT @p char(10)
as
DECLARE @rc int = 0;
DECLARE @subject CHAR(35), @subjects CHAR(500) = '';
begin try
	DECLARE discpipline CURSOR FOR SELECT SUBJECT_NAME FROM SUBJECT WHERE PULPIT = @p;
	OPEN discpipline;
	FETCH discpipline INTO @subject;
	PRINT 'Дисциплины кафедры ' + @p + ' : ';
	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @subjects = RTRIM(@subject) +', ' +  @subjects;
			SET @rc = @rc + 1;
			FETCH  discpipline INTO @subject;
		END;
		PRINT @subjects;
	CLOSE discpipline;

	IF(@rc = 0)
	BEGIN
		RAISERROR('ошибка в параметрах', 11, 1);
		RETURN -1;
	END;

	ELSE
		RETURN @rc;
END TRY

BEGIN CATCH
	PRINT 'Ошибка: ' + cast(error_number() as varchar(6));
	PRINT 'Сообщение: ' + error_message();
	RETURN -1;
END CATCH;

DECLARE @ret INT;
EXEC @ret = SUBJECT_REPORT @p= 'Исит';
PRINT 'количество дисциплин: ' + cast(@ret as varchar(10));
DEALLOCATE discpipline;





---6
SELECT * FROM AUDITORIUM_TYPE
SELECT * FROM AUDITORIUM

go
CREATE PROCEDURE PAUDITORIUM_INSERTX @a CHAR(20), @n VARCHAR(50), @c INT = 0, @t CHAR(10), @tn VARCHAR(50)
AS
BEGIN TRY
	BEGIN TRAN
		INSERT INTO AUDITORIUM_TYPE VALUES(@n, @tn);
		EXEC PAUDITORIUM_INSERT @a, @n, @c, @t;
	COMMIT TRAN;
	RETURN 1;
END TRY
BEGIN CATCH
	PRINT 'номер ошибки: ' + cast(error_number() as varchar(6));
	PRINT 'сообщение: ' + error_message();
	PRINT 'уровень: ' + cast(error_severity() as varchar(6));
	PRINT 'метка:' + cast(error_state() as varchar(8));
	PRINT 'номер строки: ' + cast(error_line() as varchar(8));
	if ERROR_PROCEDURE() is not null
	PRINT 'имя процедуры: ' + error_procedure();
	RETURN -1; 
END CATCH;


DECLARE @ret int;
EXEC @ret = PAUDITORIUM_INSERTX @a = '513-1', @n = 'ПЗ-К', @c = 40, @t = '513-1', @tn = 'класс для практических занятий'
PRINT 'ret = ' + cast(@ret as varchar(3));
SELECT * FROM AUDITORIUM_TYPE
SELECT * FROM AUDITORIUM
DELETE AUDITORIUM WHERE AUDITORIUM = '513-1';
DELETE AUDITORIUM_TYPE WHERE AUDITORIUM_TYPE = 'ПЗ-К';
