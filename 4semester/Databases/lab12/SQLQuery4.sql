--4 задание, неподтвержденное чтения для 5
BEGIN TRANSACTION 
SELECT @@SPID 'SID';
INSERT INTO Показатели VALUES('Доход', 10);
UPDATE Оценки SET [Значение Показателя] = 1 WHERE Номер_оценки = 2;
-------------------------- t1 --------------------
-------------------------- t2 --------------------
WAITFOR DELAY '00:00:05';
INSERT INTO Оценки VALUES(10, '2024-02-21', 'Предприятие 1', 'Прибыль', 1.5);
WAITFOR DELAY '00:00:05';
rollback;



DELETE Оценки WHERE Номер_оценки = 10
--работа фантомного и неповторяющегося чтения
BEGIN TRANSACTION 
SELECT @@SPID 'SID';
WAITFOR DELAY '00:00:05';
UPDATE Оценки SET [Значение Показателя] = 1.1 WHERE Номер_оценки = 2;
INSERT INTO Оценки VALUES(10, '2024-02-21', 'Предприятие 1', 'Прибыль', 1.5);
COMMIT



--6
DELETE Показатели WHERE Название_показателя = 'Доход';
--не работа неподтвежденного чтения
BEGIN TRANSACTION 
SELECT @@SPID 'SID'
INSERT INTO Показатели VALUES('Доход', 10);
UPDATE Оценки SET [Значение Показателя] = 1 WHERE Номер_оценки = 2;
WAITFOR DELAY '00:00:05';
rollback;

--не работа неповторяющегося чтения
BEGIN TRANSACTION 
SELECT @@SPID 'SID';
WAITFOR DELAY '00:00:05';
UPDATE Оценки SET [Значение Показателя] = 1.1 WHERE Номер_оценки = 2;
COMMIT;


DELETE Оценки WHERE Номер_оценки = 10
--работа фантомного чтения
BEGIN TRANSACTION 
SELECT @@SPID 'SID';
WAITFOR DELAY '00:00:05';
INSERT INTO Оценки VALUES(10, '2024-02-21', 'Предприятие 1', 'Прибыль', 1.5);
COMMIT;



--7
DELETE Показатели WHERE Название_показателя = 'Доход';
--не работа неподтвежденного чтения

BEGIN TRANSACTION 
SELECT @@SPID 'SID'
INSERT INTO Показатели VALUES('Доход', 10);
UPDATE Оценки SET [Значение Показателя] = 1 WHERE Номер_оценки = 2;
WAITFOR DELAY '00:00:05';
rollback;

--не работа неповторяющегося чтения
BEGIN TRANSACTION 
SELECT @@SPID 'SID';
WAITFOR DELAY '00:00:05';
UPDATE Оценки SET [Значение Показателя] = 1.2 WHERE Номер_оценки = 2;
COMMIT;


DELETE Оценки WHERE Номер_оценки = 10
--не работа фантомного чтения
BEGIN TRANSACTION 
SELECT @@SPID 'SID';
WAITFOR DELAY '00:00:05';
INSERT INTO Оценки VALUES(10, '2024-02-21', 'Предприятие 1', 'Прибыль', 1.5);
COMMIT;


