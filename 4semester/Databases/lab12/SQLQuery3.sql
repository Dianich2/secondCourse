SELECT * FROM ������

BEGIN TRY
	BEGIN TRAN
	INSERT ������ VALUES(7, '2024-02-25', '����������� 2', '�������', 1);
	INSERT ������ VALUES(8, '2024-02-25', '����������� 3', '�������', 2);
	COMMIT TRAN;
END TRY
BEGIN CATCH --547
	PRINT 'Error: ' + CASE
	WHEN error_number() = 547 THEN 'Foreign key conflict'
	ELSE 'Unnown error' + cast(error_number()as varchar(5))
	END
	IF @@TRANCOUNT > 0 ROLLBACK TRAN;
END CATCH





DELETE ������ WHERE �����_������=7
SELECT * FROM ������


DECLARE @point VARCHAR(32);
BEGIN TRY
	BEGIN TRAN
	INSERT ������ VALUES(7, '2024-02-25', '����������� 2', '�������', 1);
	SET @point = 'p1'; SAVE TRAN @point;
	INSERT ������ VALUES(8, '2024-02-25', '����������� 3', '�������', 2);
	SET @point = 'p2'; SAVE TRAN @point;
	INSERT ������ VALUES(9, '2024-02-25', '����������� 1', '�������', 3);
	COMMIT TRAN;
END TRY
BEGIN CATCH
	PRINT 'Error: ' + CASE
	WHEN error_number() = 547 THEN 'Foreign key conflict'
	ELSE 'Unnown error' + cast(error_number()as varchar(5))
	END

	if @@TRANCOUNT > 0
	BEGIN
		PRINT 'checkpoint: ' + @point;
		ROLLBACK TRAN @point;
		COMMIT TRAN;
	END
END CATCH



SELECT * FROM ������
-- A ---
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION
-------------------------- t1 ------------------
SELECT @@SPID 'SID', 'insert ����������' '���������', * FROM ���������� 
	                                                                WHERE ��������_����������= '�����';
																	
SELECT @@SPID 'SID', 'update ������'  '���������',  �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������  WHERE �����_������=2;

SELECT @@SPID 'SID', 'select ������' '���������', �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������   WHERE [�������� ����������]=1.5;

WAITFOR DELAY '00:00:05';
SELECT @@SPID 'SID', 'select ������' '���������', �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������   WHERE [�������� ����������]=1.5;
COMMIT; 
-------------------------- t2 -----------------


DELETE ���������� WHERE ��������_���������� = '�����';



----5

--���������������� ������
-- A ---
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION
-------------------------- t1 ------------------
SELECT @@SPID 'SID', 'insert ����������' '���������', * FROM ���������� 
	                                                                WHERE ��������_����������= '�����';
																	
SELECT @@SPID 'SID', 'update ������'  '���������',  �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������  WHERE �����_������=2;

WAITFOR DELAY '00:00:05';
COMMIT; 



--������ ���������� � ���������������� ������
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'update ������'  '���������',  �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������  WHERE �����_������=2;

SELECT @@SPID 'SID', 'select ������' '���������', �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������   WHERE [�������� ����������]=1.5;

WAITFOR DELAY '00:00:05';

SELECT @@SPID 'SID', 'update ������'  '���������',  �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������  WHERE �����_������=2;

SELECT @@SPID 'SID', 'select ������' '���������', �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������   WHERE [�������� ����������]=1.5;
COMMIT;





--6
--�� ������ ����������������� ������
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'insert ����������' '���������', * FROM ���������� 
	                                                                WHERE ��������_����������= '�����';
																	
SELECT @@SPID 'SID', 'update ������'  '���������',  �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������  WHERE �����_������=2;
COMMIT;


--�� ������ ���������������� ������
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'update ������'  '���������',  �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������  WHERE �����_������=2;
WAITFOR DELAY '00:00:05';
SELECT @@SPID 'SID', 'update ������'  '���������',  �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������  WHERE �����_������=2;
COMMIT;


--������ ���������� ������
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'select ������' '���������', �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������   WHERE [�������� ����������]=1.5;
					
WAITFOR DELAY '00:00:05';

SELECT @@SPID 'SID', 'select ������' '���������', �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������   WHERE [�������� ����������]=1.5;
COMMIT;




--7
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'insert ����������' '���������', * FROM ���������� 
	                                                                WHERE ��������_����������= '�����';
																	
SELECT @@SPID 'SID', 'update ������'  '���������',  �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������  WHERE �����_������=2;
COMMIT;


--�� ������ ���������������� ������
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'update ������'  '���������',  �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������  WHERE �����_������=2;
WAITFOR DELAY '00:00:05';
SELECT @@SPID 'SID', 'update ������'  '���������',  �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������  WHERE �����_������=2;
COMMIT;


--�� ������ ���������� ������
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'select ������' '���������', �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������   WHERE [�������� ����������]=1.5;
					
WAITFOR DELAY '00:00:05';

SELECT @@SPID 'SID', 'select ������' '���������', �����_������, ����_������, �����������,
					����������, [�������� ����������] FROM ������   WHERE [�������� ����������]=1.5;
COMMIT;




SELECT * FROM ������
--8

begin tran
		INSERT into ������ values(11, '2024-02-21', '����������� 2', '�������', 7);
		begin tran
		update ������ set ���������� ='�������������' where �����_������=11;
		commit  
		if @@TRANCOUNT > 0 rollback;
select count(*) 'amount' from ������ where �����_������=7;