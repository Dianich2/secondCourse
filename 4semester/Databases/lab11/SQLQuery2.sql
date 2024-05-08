SELECT * FROM Оценки

DECLARE Task1Cursor CURSOR LOCAL
		FOR SELECT Показатель FROM Оценки

DECLARE @IndicatorName char(30), @Result char(300) = '';
OPEN Task1Cursor;
FETCH Task1Cursor into @IndicatorName;
PRINT 'Indicators: ';
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @Result = TRIM(@IndicatorName) + ', ' + @Result;
	FETCH Task1Cursor into @IndicatorName;
END;
PRINT @Result;
CLOSE Task1Cursor;


DECLARE Task1CursorGlobal CURSOR GLOBAL
		FOR SELECT Показатель FROM Оценки

DECLARE @IndicatorName2 char(30), @Result2 char(300) = '';
OPEN Task1CursorGlobal;
FETCH Task1CursorGlobal into @IndicatorName2;
PRINT 'Indicators: ';
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @Result2 = TRIM(@IndicatorName2) + ', ' + @Result2;
	FETCH Task1CursorGlobal into @IndicatorName2;
END;
PRINT @Result2;
CLOSE Task1CursorGlobal;


DELETE FROM Показатели WHERE Название_показателя = 'sm indicaotro'
SELECT * FROM Показатели;

DECLARE Task2Cursor CURSOR LOCAL STATIC  --DYNMIC
		FOR SELECT Название_показателя FROM Показатели

DECLARE @IndName char(20);
OPEN Task2Cursor;
PRINT 'Number of rows: ' + cast(@@CURSOR_ROWS as varchar(5));

INSERT Показатели VALUES('sm indicator', 2);

FETCH Task2Cursor into @IndName;
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @IndName;
	FETCH Task2Cursor into @IndName;
END;
CLOSE Task2Cursor;


SELECT * FROM Оценки

DECLARE Task3Cursor CURSOR LOCAL DYNAMIC SCROLL
	FOR SELECT ROW_NUMBER() OVER (ORDER BY Дата_оценки) Номер, 
	Дата_оценки, Предприятие, Показатель, [Значение Показателя] FROM Оценки

DECLARE @number varchar(100), @date DATETIME, @factory varchar(200), @indic varchar(20), @indValue real;

OPEN Task3Cursor;
FETCH Task3Cursor INTO @number, @date, @factory, @indic, @indValue;
PRINT 'Первая выбранная строка: ' + CHAR(10) + 
rtrim(@number) + ' ' + rtrim(@date) + ' ' + rtrim(@factory) + ' ' + rtrim(@indic) + ' ' + rtrim(@indValue);


FETCH LAST FROM Task3Cursor INTO @number, @date, @factory, @indic, @indValue;
PRINT 'Последняя выбранная строка: ' + CHAR(10) + 
rtrim(@number) + ' ' + rtrim(@date) + ' ' + rtrim(@factory) + ' ' + rtrim(@indic) + ' ' + rtrim(@indValue);


FETCH RELATIVE -1 FROM Task3Cursor INTO @number, @date, @factory, @indic, @indValue;
PRINT 'Первая до последней строка: ' + CHAR(10) + 
rtrim(@number) + ' ' + rtrim(@date) + ' ' + rtrim(@factory) + ' ' + rtrim(@indic) + ' ' + rtrim(@indValue);


FETCH ABSOLUTE 2 FROM Task3Cursor INTO @number, @date, @factory, @indic, @indValue;
PRINT 'Вторя с начала строка: ' + CHAR(10) + 
rtrim(@number) + ' ' + rtrim(@date) + ' ' + rtrim(@factory) + ' ' + rtrim(@indic) + ' ' + rtrim(@indValue);

FETCH RELATIVE 1 FROM Task3Cursor INTO @number, @date, @factory, @indic, @indValue;
PRINT 'Первая после предыдущей строка: ' + CHAR(10) + 
rtrim(@number) + ' ' + rtrim(@date) + ' ' + rtrim(@factory) + ' ' + rtrim(@indic) + ' ' + rtrim(@indValue);



SELECT * FROM Показатели
DECLARE Task4Cursor CURSOR LOCAL DYNAMIC
	FOR SELECT * FROM Показатели FOR UPDATE

DECLARE @name VARCHAR(20), @imp real;

OPEN Task4Cursor;
FETCH Task4Cursor INTO @name, @imp;
UPDATE Показатели SET Важность_показателя = 3 WHERE CURRENT OF Task4Cursor;
CLOSE Task4Cursor;