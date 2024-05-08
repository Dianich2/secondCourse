

go
CREATE PROCEDURE EST
AS
BEGIN
	DECLARE @n INT = (SELECT COUNT(*) FROM Оценки);
	SELECT * FROM Оценки;
	RETURN @n;
END;

go
DECLARE @n INT = 0;
EXEC @n = EST;
print 'rows count = ' + cast(@n as varchar(3));




SELECT * FROM Оценки
go
CREATE PROCEDURE EST2 @p varchar(20), @c int output
AS
BEGIN
	DECLARE @n INT = (SELECT COUNT(*) FROM Оценки);
	SELECT * FROM Оценки WHERE Показатель = @p;
	set @c = @@ROWCOUNT;
	RETURN @n;
END;

go
DECLARE @n int = 0, @r int = 0, @p varchar(20) = 'Прибыль';
EXEC @n = EST2 @p, @c = @r output;
PRINT 'Rows at all = ' + cast(@n as varchar(20));
PRINT @p + ' rows = ' + cast(@r as varchar(3));



SELECT * FROM Показатели
go
CREATE PROCEDURE INDIC  @p int = 0
AS
BEGIN
	--DECLARE @n INT = (SELECT COUNT(*) FROM Показатели);
	SELECT * FROM Показатели WHERE Важность_показателя = @p;
END;

CREATE TABLE #IND
			(Название_показателя varchar(50) primary key,
			 Важность_показателя real);

INSERT #IND EXEC INDIC @p = 1;
SELECT * FROM #IND;
DROP TABLE #IND;
DROP PROCEDURE INDIC






go
CREATE PROCEDURE INDIC_INSERT @a CHAR(50), @c real
AS
BEGIN TRY
	INSERT INTO Показатели VALUES(@a, @c);
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
EXEC @ret = INDIC_INSERT @a = 'Доход', @c = 1.6;
PRINT 'ret = ' + cast(@ret as varchar(3));
SELECT * FROM Показатели
DELETE Показатели WHERE Название_показателя = 'Доход';







SELECT * FROM Оценки
go
create procedure Оценки_REPORT @p char(20)
as
DECLARE @rc int = 0;
DECLARE @indicator CHAR(35), @indicators CHAR(500) = '';
begin try
	DECLARE indicator CURSOR FOR SELECT Показатель FROM Оценки WHERE Предприятие = @p;
	OPEN indicator;
	FETCH indicator INTO @indicator;
	PRINT 'Показатели предприятия ' + @p + ': ';
	WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @indicators = RTRIM(@indicator) +', ' +  @indicators;
			SET @rc = @rc + 1;
			FETCH  indicator INTO @indicators;
		END;
		PRINT @indicators;
	CLOSE indicator;

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
EXEC @ret = Оценки_REPORT @p= 'Предприятие 1';
PRINT 'количество показателей: ' + cast(@ret as varchar(10));
DEALLOCATE indicator;







go
CREATE PROCEDURE INDIC_INSERTX @a CHAR(20), @c REAL = 0
AS
BEGIN TRY
	BEGIN TRAN
		EXEC INDIC_INSERT @a, @c;
		INSERT INTO Оценки VALUES(17, '2024-02-21', 'Предприятие 1', @a, 1);
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
EXEC @ret = INDIC_INSERTX @a = 'Доход 2',@c = 1.7;
PRINT 'ret = ' + cast(@ret as varchar(3));
SELECT * FROM Показатели
SELECT * FROM Оценки
DELETE Оценки WHERE Номер_оценки = 17;
DELETE Показатели WHERE Название_показателя = 'Доход 2';

