

go
CREATE PROCEDURE EST
AS
BEGIN
	DECLARE @n INT = (SELECT COUNT(*) FROM ������);
	SELECT * FROM ������;
	RETURN @n;
END;

go
DECLARE @n INT = 0;
EXEC @n = EST;
print 'rows count = ' + cast(@n as varchar(3));




SELECT * FROM ������
go
CREATE PROCEDURE EST2 @p varchar(20), @c int output
AS
BEGIN
	DECLARE @n INT = (SELECT COUNT(*) FROM ������);
	SELECT * FROM ������ WHERE ���������� = @p;
	set @c = @@ROWCOUNT;
	RETURN @n;
END;

go
DECLARE @n int = 0, @r int = 0, @p varchar(20) = '�������';
EXEC @n = EST2 @p, @c = @r output;
PRINT 'Rows at all = ' + cast(@n as varchar(20));
PRINT @p + ' rows = ' + cast(@r as varchar(3));



SELECT * FROM ����������
go
CREATE PROCEDURE INDIC  @p int = 0
AS
BEGIN
	--DECLARE @n INT = (SELECT COUNT(*) FROM ����������);
	SELECT * FROM ���������� WHERE ��������_���������� = @p;
END;

CREATE TABLE #IND
			(��������_���������� varchar(50) primary key,
			 ��������_���������� real);

INSERT #IND EXEC INDIC @p = 1;
SELECT * FROM #IND;
DROP TABLE #IND;
DROP PROCEDURE INDIC






go
CREATE PROCEDURE INDIC_INSERT @a CHAR(50), @c real
AS
BEGIN TRY
	INSERT INTO ���������� VALUES(@a, @c);
	RETURN 1;
END TRY
BEGIN CATCH
	PRINT '����� ������: ' + cast(error_number() as varchar(6));
	PRINT '���������: ' + error_message();
	PRINT '�������: ' + cast(error_severity() as varchar(6));
	PRINT '�����:' + cast(error_state() as varchar(8));
	PRINT '����� ������: ' + cast(error_line() as varchar(8));
	if ERROR_PROCEDURE() is not null
	PRINT '��� ���������: ' + error_procedure();
	RETURN -1; 
END CATCH

DECLARE @ret int;
EXEC @ret = INDIC_INSERT @a = '�����', @c = 1.6;
PRINT 'ret = ' + cast(@ret as varchar(3));
SELECT * FROM ����������
DELETE ���������� WHERE ��������_���������� = '�����';







SELECT * FROM ������
go
create procedure ������_REPORT @p char(20)
as
DECLARE @rc int = 0;
DECLARE @indicator CHAR(35), @indicators CHAR(500) = '';
begin try
	DECLARE indicator CURSOR FOR SELECT ���������� FROM ������ WHERE ����������� = @p;
	OPEN indicator;
	FETCH indicator INTO @indicator;
	PRINT '���������� ����������� ' + @p + ': ';
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
		RAISERROR('������ � ����������', 11, 1);
		RETURN -1;
	END;

	ELSE
		RETURN @rc;
END TRY

BEGIN CATCH
	PRINT '������: ' + cast(error_number() as varchar(6));
	PRINT '���������: ' + error_message();
	RETURN -1;
END CATCH;

DECLARE @ret INT;
EXEC @ret = ������_REPORT @p= '����������� 1';
PRINT '���������� �����������: ' + cast(@ret as varchar(10));
DEALLOCATE indicator;







go
CREATE PROCEDURE INDIC_INSERTX @a CHAR(20), @c REAL = 0
AS
BEGIN TRY
	BEGIN TRAN
		EXEC INDIC_INSERT @a, @c;
		INSERT INTO ������ VALUES(17, '2024-02-21', '����������� 1', @a, 1);
	COMMIT TRAN;
	RETURN 1;
END TRY
BEGIN CATCH
	PRINT '����� ������: ' + cast(error_number() as varchar(6));
	PRINT '���������: ' + error_message();
	PRINT '�������: ' + cast(error_severity() as varchar(6));
	PRINT '�����:' + cast(error_state() as varchar(8));
	PRINT '����� ������: ' + cast(error_line() as varchar(8));
	if ERROR_PROCEDURE() is not null
	PRINT '��� ���������: ' + error_procedure();
	RETURN -1; 
END CATCH;


DECLARE @ret int;
EXEC @ret = INDIC_INSERTX @a = '����� 2',@c = 1.7;
PRINT 'ret = ' + cast(@ret as varchar(3));
SELECT * FROM ����������
SELECT * FROM ������
DELETE ������ WHERE �����_������ = 17;
DELETE ���������� WHERE ��������_���������� = '����� 2';

