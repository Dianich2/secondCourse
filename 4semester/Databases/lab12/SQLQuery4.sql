--4 �������, ���������������� ������ ��� 5
BEGIN TRANSACTION 
SELECT @@SPID 'SID';
INSERT INTO ���������� VALUES('�����', 10);
UPDATE ������ SET [�������� ����������] = 1 WHERE �����_������ = 2;
-------------------------- t1 --------------------
-------------------------- t2 --------------------
WAITFOR DELAY '00:00:05';
INSERT INTO ������ VALUES(10, '2024-02-21', '����������� 1', '�������', 1.5);
WAITFOR DELAY '00:00:05';
rollback;



DELETE ������ WHERE �����_������ = 10
--������ ���������� � ���������������� ������
BEGIN TRANSACTION 
SELECT @@SPID 'SID';
WAITFOR DELAY '00:00:05';
UPDATE ������ SET [�������� ����������] = 1.1 WHERE �����_������ = 2;
INSERT INTO ������ VALUES(10, '2024-02-21', '����������� 1', '�������', 1.5);
COMMIT



--6
DELETE ���������� WHERE ��������_���������� = '�����';
--�� ������ ���������������� ������
BEGIN TRANSACTION 
SELECT @@SPID 'SID'
INSERT INTO ���������� VALUES('�����', 10);
UPDATE ������ SET [�������� ����������] = 1 WHERE �����_������ = 2;
WAITFOR DELAY '00:00:05';
rollback;

--�� ������ ���������������� ������
BEGIN TRANSACTION 
SELECT @@SPID 'SID';
WAITFOR DELAY '00:00:05';
UPDATE ������ SET [�������� ����������] = 1.1 WHERE �����_������ = 2;
COMMIT;


DELETE ������ WHERE �����_������ = 10
--������ ���������� ������
BEGIN TRANSACTION 
SELECT @@SPID 'SID';
WAITFOR DELAY '00:00:05';
INSERT INTO ������ VALUES(10, '2024-02-21', '����������� 1', '�������', 1.5);
COMMIT;



--7
DELETE ���������� WHERE ��������_���������� = '�����';
--�� ������ ���������������� ������

BEGIN TRANSACTION 
SELECT @@SPID 'SID'
INSERT INTO ���������� VALUES('�����', 10);
UPDATE ������ SET [�������� ����������] = 1 WHERE �����_������ = 2;
WAITFOR DELAY '00:00:05';
rollback;

--�� ������ ���������������� ������
BEGIN TRANSACTION 
SELECT @@SPID 'SID';
WAITFOR DELAY '00:00:05';
UPDATE ������ SET [�������� ����������] = 1.2 WHERE �����_������ = 2;
COMMIT;


DELETE ������ WHERE �����_������ = 10
--�� ������ ���������� ������
BEGIN TRANSACTION 
SELECT @@SPID 'SID';
WAITFOR DELAY '00:00:05';
INSERT INTO ������ VALUES(10, '2024-02-21', '����������� 1', '�������', 1.5);
COMMIT;


