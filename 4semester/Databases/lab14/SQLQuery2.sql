select * from ������
select * from ����������
select * from �����������


---1
go
CREATE FUNCTION COUNT_ESTIMATIONS(@factory varchar(20), @indicator varchar(20)) returns int
AS BEGIN
	DECLARE @rc int = 0;
	SET @RC = (SELECT count(*) FROM ������ e 
		WHERE e.����������� = @factory AND e.���������� = @indicator);
	RETURN @rc;
END;


go
DECLARE @f int = dbo.COUNT_ESTIMATIONS('����������� 1', '�������');
print 'Number of estimations: ' + cast(@f as varchar(4));



---2
go
CREATE FUNCTION FINDICATORS(@factory varchar(20)) returns varchar(300)
AS BEGIN
	DECLARE Indicator CURSOR FOR SELECT e.���������� FROM ������ e
							WHERE e.����������� = @factory;
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
SELECT e.�����������, dbo.FINDICATORS(e.�����������) [Indicators] FROM ������ e;




---3
go
CREATE FUNCTION TASK3(@factory varchar(20), @indic_imp real) returns table
AS RETURN
SELECT e.����������, i.��������_���������� FROM ������ e left outer join ���������� i 
	ON e.���������� = i.��������_����������
	WHERE e.���������� = isnull(@factory, e.����������)
	AND i.��������_���������� = isnull(@indic_imp, i.��������_����������);

go
SELECT * FROM dbo.TASK3(NULL, NULL)
SELECT * FROM dbo.TASK3('����������� 1', NULL)
SELECT * FROM dbo.TASK3(NULL, 1)
SELECT * FROM dbo.TASK3('����������� 1', 1)



---4
go
CREATE FUNCTION FESTIMATION (@factory varchar(20)) returns int
AS BEGIN
	DECLARE @result int = 0
	SET @result = (SELECT COUNT(*) FROM	
							����������� f inner join ������ e
							ON f.�������� = e.�����������
							WHERE f.�������� = isnull(@factory, e.�����������));
	RETURN @result;
END;

go
SELECT f.��������, dbo.FESTIMATION(f.��������) 'Number of estimations' FROM ����������� f
SELECT dbo.FESTIMATION('����������� 1');