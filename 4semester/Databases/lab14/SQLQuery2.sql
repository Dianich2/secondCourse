select * from Оценки
select * from Показатели
select * from Предприятия


---1
go
CREATE FUNCTION COUNT_ESTIMATIONS(@factory varchar(20), @indicator varchar(20)) returns int
AS BEGIN
	DECLARE @rc int = 0;
	SET @RC = (SELECT count(*) FROM Оценки e 
		WHERE e.Предприятие = @factory AND e.Показатель = @indicator);
	RETURN @rc;
END;


go
DECLARE @f int = dbo.COUNT_ESTIMATIONS('Предприятие 1', 'Прибыль');
print 'Number of estimations: ' + cast(@f as varchar(4));



---2
go
CREATE FUNCTION FINDICATORS(@factory varchar(20)) returns varchar(300)
AS BEGIN
	DECLARE Indicator CURSOR FOR SELECT e.Показатель FROM Оценки e
							WHERE e.Предприятие = @factory;
	DECLARE @indicator varchar(20), @indicator_ret varchar(300) = '';
	OPEN Indicator;
	FETCH Indicator into @indicator;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @indicator_ret = RTRIM(@indicator) + ', ' + @indicator_ret;
		FETCH Indicator into @indicator;
	END;
	CLOSE Indicator;
	SET @indicator_ret = 'Indicators: ' + @indicator_ret;
	RETURN @indicator_ret;
END;

go
SELECT e.Предприятие, dbo.FINDICATORS(e.Предприятие) [Indicators] FROM Оценки e;




---3
go
CREATE FUNCTION TASK3(@factory varchar(20), @indic_imp real) returns table
AS RETURN
SELECT e.Показатель, i.Важность_показателя FROM Оценки e left outer join Показатели i 
	ON e.Показатель = i.Название_показателя
	WHERE e.Показатель = isnull(@factory, e.Показатель)
	AND i.Важность_показателя = isnull(@indic_imp, i.Важность_показателя);

go
SELECT * FROM dbo.TASK3(NULL, NULL)
SELECT * FROM dbo.TASK3('Предприятие 1', NULL)
SELECT * FROM dbo.TASK3(NULL, 1)
SELECT * FROM dbo.TASK3('Предприятие 1', 1)



---4
go
CREATE FUNCTION FESTIMATION (@factory varchar(20)) returns int
AS BEGIN
	DECLARE @result int = 0
	SET @result = (SELECT COUNT(*) FROM	
							Предприятия f inner join Оценки e
							ON f.Название = e.Предприятие
							WHERE f.Название = isnull(@factory, e.Предприятие));
	RETURN @result;
END;

go
SELECT f.Название, dbo.FESTIMATION(f.Название) 'Number of estimations' FROM Предприятия f
SELECT dbo.FESTIMATION('Предприятие 1');