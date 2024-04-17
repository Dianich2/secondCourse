DECLARE @charVar CHAR(10) = 'Hello',
		@varcharVar VARCHAR(20) = 'World',
		@datetimeVar DATETIME,
		@timeVar TIME,
		@intVar INT,
		@smallIntVar SMALLINT,
		@tinyIntVar TINYINT,
		@numericVar NUMERIC(12, 5);


SET @datetimeVar = GETDATE();
SET @timeVar = GETDATE();
SET @intVar = 100;
SET @smallIntVar = 50;
SET @tinyIntVar = 5;
SET @numericVar = 1234.12345;

SELECT 
    @charVar AS CharVariable,
    @varcharVar AS VarcharVariable,
    @datetimeVar AS DatetimeVariable,
    @timeVar AS TimeVariable,
    @intVar AS IntVariable,
    @smallIntVar AS SmallintVariable,
    @tinyIntVar AS TinyintVariable,
    @numericVar AS NumericVariable;

PRINT 'Char Variable: ' + @charVar;
PRINT 'Varchar Variable: ' + @varcharVar;
PRINT 'Datetime Variable: ' + CONVERT(VARCHAR, @datetimeVar);
PRINT 'Time Variable: ' + CONVERT(VARCHAR, @timeVar, 108);
PRINT 'Int Variable: ' + CAST(@intVar AS VARCHAR);
PRINT 'Smallint Variable: ' + CAST(@smallIntVar AS VARCHAR);
PRINT 'Tinyint Variable: ' + CAST(@tinyIntVar AS VARCHAR);
PRINT 'Numeric Variable: ' + CAST(@numericVar AS VARCHAR);






DECLARE @commonCapacity INT = (SELECT SUM(a.AUDITORIUM_CAPACITY) FROM AUDITORIUM a);

DECLARE @auditoriumAmount INT, 
		@averageCapacity REAL,
		@lessAverageAuditoriumCapacity INT,
		@lessAverageAuditoriumCapacityPercentage REAL;
IF @commonCapacity > 200
BEGIN
	SELECT @auditoriumAmount = (SELECT COUNT(a.AUDITORIUM) FROM AUDITORIUM a),
	@averageCapacity = (SELECT AVG(a.AUDITORIUM_CAPACITY) FROM AUDITORIUM a),
	@lessAverageAuditoriumCapacity = (SELECT COUNT(a.AUDITORIUM) FROM AUDITORIUM a WHERE a.AUDITORIUM_CAPACITY < @averageCapacity),
	@lessAverageAuditoriumCapacityPercentage = (@lessAverageAuditoriumCapacity / @auditoriumAmount);
	SELECT @auditoriumAmount 'Количество аудиторий', 
	@averageCapacity 'Средняя вместимость', 
	@lessAverageAuditoriumCapacity 'Меньше средней', 
	@lessAverageAuditoriumCapacityPercentage 'Их процент'
END
ELSE
	SELECT @averageCapacity = (SELECT AVG(a.AUDITORIUM_CAPACITY) FROM AUDITORIUM a);
	PRINT @averageCapacity;





PRINT @@ROWCOUNT;
PRINT @@VERSION;
PRINT @@SPID;
PRINT @@ERROR;
PRINT @@SERVERNAME;
PRINT @@TRANCOUNT;
PRINT @@FETCH_STATUS;
PRINT @@NESTLEVEL;






DECLARE @t REAL=5, @x REAL=5, @z REAL;
IF @t > @x
BEGIN
	SET @z = power(sin(@t), 2);
END
ELSE IF @t < @z
BEGIN 
	SET @z = 4.0 * (@t + @x);
END
ELSE 
BEGIN
	SET @z = 1 - power(exp(1), @x - 2);
END
PRINT CAST(@z AS VARCHAR)






DECLARE @fullName NVARCHAR(100) = 'Макейчик Татьяна Леонидовна';
--DECLARE @fullName NVARCHAR(100) = 'Корнелюк Валентин Владимирович';

DECLARE @shortName NVARCHAR(30);
SELECT @shortName = SUBSTRING(@fullName, 1, CHARINDEX(' ', @fullName)) +
                   SUBSTRING(SUBSTRING(@fullName, CHARINDEX(' ', @fullName) + 1, LEN(@fullName)),
                             1, 1) + '. ' +
                   SUBSTRING(SUBSTRING(@fullName, CHARINDEX(' ', @fullName, CHARINDEX(' ', @fullName) + 1) + 1, LEN(@fullName)),
                             1, 1) + '.';


--CHARINDEX(substring, string, start)

PRINT 'Полное ФИО: ' + @fullName;
PRINT 'Сокращенное ФИО: ' + @shortName;



DECLARE @NextMonth DATE = DATEADD(MONTH, 1, GETDATE());
DECLARE @NextMonthStart DATE = DATEADD(DAY, 1, EOMONTH(@NextMonth, -1));
DECLARE @NextMonthEnd DATE = EOMONTH(@NextMonth);
PRINT cast(@NextMonth as varchar)
PRINT cast(@NextMonthStart as varchar)
PRINT cast(@NextMonthEnd as varchar)
SELECT 
    s.NAME,
	s.BDAY,
	DATEDIFF(YEAR, BDAY, @NextMonthStart)
FROM STUDENT s
WHERE MONTH(s.BDAY) >= MONTH(@NextMonthStart) AND MONTH(s.BDAY) <= MONTH(@NextMonthEnd);



SELECT DATEPART(WEEKDAY, p.PDATE) [WeekDay],
	p.PDATE [Date],
	s.IDGROUP
	FROM PROGRESS p JOIN STUDENT s
	ON p.IDSTUDENT = s.IDSTUDENT
	WHERE p.SUBJECT LIKE 'СУБД';



SELECT CASE
	WHEN p.NOTE BETWEEN 0 AND 4 THEN 'Bad'
	WHEN p.NOTE BETWEEN 5 AND 7 THEN 'Nice'
	WHEN p.NOTE BETWEEN 8 AND 10 THEN 'Fine'
	END NOTE, 
	COUNT(*)[Amount]
FROM PROGRESS p
GROUP BY CASE
	WHEN p.NOTE BETWEEN 0 AND 4 THEN 'Bad'
	WHEN p.NOTE BETWEEN 5 AND 7 THEN 'Nice'
	WHEN p.NOTE BETWEEN 8 AND 10 THEN 'Fine'
	END



CREATE TABLE #MyTable(
	nam VARCHAR(40),
	val int)

DECLARE @i INT = 0;
WHILE @i < 10
BEGIN
	INSERT #MyTable(nam, val)
	VALUES('line ' + CAST(@i+1 AS VARCHAR), FLOOR(100*RAND()));
	SET @i = @i + 1;
END

SELECT * FROM #MyTable



DECLARE @j INT = 0;
WHILE @j < 10
BEGIN
	PRINT CAST(@j AS VARCHAR)
	SET @j = @j + 1;
	IF @j = 5
		RETURN
END


BEGIN TRY
	DECLARE @a INT = 4/0
END TRY
BEGIN CATCH
	PRINT ERROR_NUMBER();
	PRINT ERROR_MESSAGE();
	PRINT ERROR_LINE();
	PRINT ERROR_PROCEDURE();
	PRINT ERROR_SEVERITY();
	PRINT ERROR_STATE();
END CATCH



DECLARE @variable INT, @f INT;
SET @variable = 10 + 5;

DECLARE @variable1 INT, @variable2 INT;
SELECT @variable1 = 10, @variable2 = 5+2;
PRINT 'Переменная 1: ' + CAST(@variable1 AS VARCHAR);
PRINT 'Переменная 2: ' + CAST(@variable2 AS VARCHAR);