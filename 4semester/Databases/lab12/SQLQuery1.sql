SET NOCOUNT ON

IF EXISTS (SELECT * FROM SYS.OBJECTS
					WHERE OBJECT_ID = object_id(N'DBO.X'))
DROP TABLE X;

--DECLARE @c INT, @flag CHAR='c';
DECLARE @c INT, @flag CHAR='r';

SET IMPLICIT_TRANSACTIONS ON
CREATE TABLE X(K INT);
	INSERT X VALUES (1), (2), (3);
	SET @c = (SELECT COUNT(*) FROM X);
	PRINT 'amount of rows in table X:' + CAST(@c AS VARCHAR(2));
	IF @flag = 'c' COMMIT;
	ELSE ROLLBACK;
SET IMPLICIT_TRANSACTIONS OFF

IF EXISTS (SELECT * FROM SYS.OBJECTS
			WHERE OBJECT_ID=object_id(N'DBO.X'))
PRINT 'Table X does exist';
ELSE PRINT 'Table X does NOT exist';





SELECT * FROM PROGRESS;

BEGIN TRY
	BEGIN TRAN
	INSERT PROGRESS VALUES('����', 1003, '2013-01-10', 9);
	INSERT PROGRESS VALUES('����', 2, '2013-01-10', 10);
	COMMIT TRAN;
END TRY
BEGIN CATCH --547
	PRINT 'Error: ' + CASE
	WHEN error_number() = 547 THEN 'Foreign key conflict'
	ELSE 'Unnown error' + cast(error_number()as varchar(5))
	END
	IF @@TRANCOUNT > 0 ROLLBACK TRAN;
END CATCH





DELETE PROGRESS WHERE IDSTUDENT=1003 AND NOTE=4
SELECT * FROM PROGRESS ORDER BY IDSTUDENT, NOTE


DECLARE @point VARCHAR(32);
BEGIN TRY
	BEGIN TRAN
	INSERT PROGRESS VALUES ('����', 1003, '2013-01-10', 4);
	SET @point = 'p1'; SAVE TRAN @point;
	INSERT PROGRESS VALUES ('����', 2, '2013-01-10', 5);
	SET @point = 'p2'; SAVE TRAN @point;
	INSERT PROGRESS VALUES ('����', 1003, '2013-01-10', 6);
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







-- A ---
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION
-------------------------- t1 ------------------
SELECT @@SPID 'SID', 'insert AUDITORIUM' '���������', * FROM SUBJECT 
	                                                                WHERE SUBJECT = '����';
																	
SELECT @@SPID 'SID', 'update AUDITORIUM'  '���������',  AUDITORIUM_NAME, 
                      AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_NAME='301-1';

SELECT @@SPID 'SID', 'select AUDITORIUM' '���������', AUDITORIUM_NAME, 
						AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_CAPACITY=60;

WAITFOR DELAY '00:00:05';
SELECT @@SPID 'SID', 'select AUDITORIUM' '���������', AUDITORIUM_NAME, 
						AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_CAPACITY=60;

COMMIT; 
-------------------------- t2 -----------------


delete SUBJECT where SUBJECT = '����';
SELECT * FROM SUBJECT
SELECT * FROM AUDITORIUM




----5

--���������������� ������
-- A ---
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
-------------------------- t1 ------------------
SELECT @@SPID 'SID', 'insert AUDITORIUM' '���������', * FROM SUBJECT 
	                                                                WHERE SUBJECT = '����';
																	
SELECT @@SPID 'SID', 'update AUDITORIUM'  '���������',  AUDITORIUM_NAME, 
                      AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_NAME='301-1';

SELECT @@SPID 'SID', 'select AUDITORIUM' '���������', AUDITORIUM_NAME, 
						AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_CAPACITY=60;

WAITFOR DELAY '00:00:05';
COMMIT; 

--������ ���������� � ���������������� ������
-- A ---
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
-------------------------- t1 ------------------

SELECT @@SPID 'SID', 'update AUDITORIUM'  '���������',  AUDITORIUM_NAME, 
                      AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_NAME='324-1';
SELECT @@SPID 'SID', 'select AUDITORIUM' '���������', AUDITORIUM_NAME, 
						AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_CAPACITY=60;

WAITFOR DELAY '00:00:05';
SELECT @@SPID 'SID', 'update AUDITORIUM'  '���������',  AUDITORIUM_NAME, 
                      AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_NAME='324-1';
SELECT @@SPID 'SID', 'select AUDITORIUM' '���������', AUDITORIUM_NAME, 
						AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_CAPACITY=60;
COMMIT;






---6
--�� ������ ���������������� ������
-- A ---
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
-------------------------- t1 ------------------

SELECT @@SPID 'SID', 'update AUDITORIUM'  '���������',  AUDITORIUM_NAME, 
                      AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_NAME='324-1';

WAITFOR DELAY '00:00:05';
SELECT @@SPID 'SID', 'update AUDITORIUM'  '���������',  AUDITORIUM_NAME, 
                      AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_NAME='324-1';
COMMIT;

--������ ���������� ������
-- A ---
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
-------------------------- t1 ------------------
SELECT @@SPID 'SID', 'select AUDITORIUM' '���������', AUDITORIUM_NAME, 
						AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_CAPACITY=60;

WAITFOR DELAY '00:00:05';
SELECT @@SPID 'SID', 'select AUDITORIUM' '���������', AUDITORIUM_NAME, 
						AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_CAPACITY=60;
COMMIT;


--�� ������ ����������������� ������
-- A ---
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
-------------------------- t1 ------------------
SELECT @@SPID 'SID', 'insert AUDITORIUM' '���������', * FROM SUBJECT 
	                                                                WHERE SUBJECT = '����';
																	
SELECT @@SPID 'SID', 'update AUDITORIUM'  '���������',  AUDITORIUM_NAME, 
                      AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_NAME='301-1';

COMMIT;





--7
--�� ������ ����������������� ������
-- A ---
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
-------------------------- t1 ------------------
SELECT @@SPID 'SID', 'insert AUDITORIUM' '���������', * FROM SUBJECT 
	                                                                WHERE SUBJECT = '����';
																	
SELECT @@SPID 'SID', 'update AUDITORIUM'  '���������',  AUDITORIUM_NAME, 
                      AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_NAME='301-1';

COMMIT;


--�� ������ ���������������� ������
-- A ---
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
-------------------------- t1 ------------------

SELECT @@SPID 'SID', 'update AUDITORIUM'  '���������',  AUDITORIUM_NAME, 
                      AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_NAME='324-1';

WAITFOR DELAY '00:00:05';
SELECT @@SPID 'SID', 'update AUDITORIUM'  '���������',  AUDITORIUM_NAME, 
                      AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_NAME='324-1';
COMMIT;


--�� ������ ���������� ������
-- A ---
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
-------------------------- t1 ------------------
SELECT @@SPID 'SID', 'select AUDITORIUM' '���������', AUDITORIUM_NAME, 
						AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_CAPACITY=60;

WAITFOR DELAY '00:00:05';
SELECT @@SPID 'SID', 'select AUDITORIUM' '���������', AUDITORIUM_NAME, 
						AUDITORIUM_TYPE,AUDITORIUM_CAPACITY FROM AUDITORIUM   WHERE  AUDITORIUM_CAPACITY=60;
COMMIT;




--8
delete SUBJECT where SUBJECT = '����';

begin tran
		INSERT into SUBJECT values('����','����������� ���������� ���������������� �  ���������','����');   ;
		begin tran
		update SUBJECT set SUBJECT_NAME='����' where SUBJECT='����';
		commit  
		if @@TRANCOUNT > 0 rollback;
select count(*) 'amount' from SUBJECT where SUBJECT='����'

