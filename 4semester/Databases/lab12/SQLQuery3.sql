SELECT * FROM Оценки

BEGIN TRY
	BEGIN TRAN
	INSERT Оценки VALUES(7, '2024-02-25', 'Предприятие 2', 'Прибыль', 1);
	INSERT Оценки VALUES(8, '2024-02-25', 'Предприятие 3', 'Прибыль', 2);
	COMMIT TRAN;
END TRY
BEGIN CATCH --547
	PRINT 'Error: ' + CASE
	WHEN error_number() = 547 THEN 'Foreign key conflict'
	ELSE 'Unnown error' + cast(error_number()as varchar(5))
	END
	IF @@TRANCOUNT > 0 ROLLBACK TRAN;
END CATCH





DELETE Оценки WHERE Номер_оценки=7
SELECT * FROM Оценки


DECLARE @point VARCHAR(32);
BEGIN TRY
	BEGIN TRAN
	INSERT Оценки VALUES(7, '2024-02-25', 'Предприятие 2', 'Прибыль', 1);
	SET @point = 'p1'; SAVE TRAN @point;
	INSERT Оценки VALUES(8, '2024-02-25', 'Предприятие 3', 'Прибыль', 2);
	SET @point = 'p2'; SAVE TRAN @point;
	INSERT Оценки VALUES(9, '2024-02-25', 'Предприятие 1', 'Прибыль', 3);
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



SELECT * FROM Оценки
-- A ---
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION
-------------------------- t1 ------------------
SELECT @@SPID 'SID', 'insert Показатели' 'результат', * FROM Показатели 
	                                                                WHERE Название_показателя= 'Доход';
																	
SELECT @@SPID 'SID', 'update Оценки'  'результат',  Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки  WHERE Номер_оценки=2;

SELECT @@SPID 'SID', 'select Оценки' 'результат', Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки   WHERE [Значение Показателя]=1.5;

WAITFOR DELAY '00:00:05';
SELECT @@SPID 'SID', 'select Оценки' 'результат', Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки   WHERE [Значение Показателя]=1.5;
COMMIT; 
-------------------------- t2 -----------------


DELETE Показатели WHERE Название_показателя = 'Доход';



----5

--неподтвержденное чтение
-- A ---
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION
-------------------------- t1 ------------------
SELECT @@SPID 'SID', 'insert Показатели' 'результат', * FROM Показатели 
	                                                                WHERE Название_показателя= 'Доход';
																	
SELECT @@SPID 'SID', 'update Оценки'  'результат',  Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки  WHERE Номер_оценки=2;

WAITFOR DELAY '00:00:05';
COMMIT; 



--работа фантомного и неповторяющегося чтения
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'update Оценки'  'результат',  Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки  WHERE Номер_оценки=2;

SELECT @@SPID 'SID', 'select Оценки' 'результат', Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки   WHERE [Значение Показателя]=1.5;

WAITFOR DELAY '00:00:05';

SELECT @@SPID 'SID', 'update Оценки'  'результат',  Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки  WHERE Номер_оценки=2;

SELECT @@SPID 'SID', 'select Оценки' 'результат', Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки   WHERE [Значение Показателя]=1.5;
COMMIT;





--6
--не работа неподтвержденного чтение
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'insert Показатели' 'результат', * FROM Показатели 
	                                                                WHERE Название_показателя= 'Доход';
																	
SELECT @@SPID 'SID', 'update Оценки'  'результат',  Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки  WHERE Номер_оценки=2;
COMMIT;


--не работа неповторяющегося чтения
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'update Оценки'  'результат',  Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки  WHERE Номер_оценки=2;
WAITFOR DELAY '00:00:05';
SELECT @@SPID 'SID', 'update Оценки'  'результат',  Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки  WHERE Номер_оценки=2;
COMMIT;


--работа фантомного чтения
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'select Оценки' 'результат', Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки   WHERE [Значение Показателя]=1.5;
					
WAITFOR DELAY '00:00:05';

SELECT @@SPID 'SID', 'select Оценки' 'результат', Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки   WHERE [Значение Показателя]=1.5;
COMMIT;




--7
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'insert Показатели' 'результат', * FROM Показатели 
	                                                                WHERE Название_показателя= 'Доход';
																	
SELECT @@SPID 'SID', 'update Оценки'  'результат',  Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки  WHERE Номер_оценки=2;
COMMIT;


--не работа неповторяющегося чтения
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'update Оценки'  'результат',  Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки  WHERE Номер_оценки=2;
WAITFOR DELAY '00:00:05';
SELECT @@SPID 'SID', 'update Оценки'  'результат',  Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки  WHERE Номер_оценки=2;
COMMIT;


--не работа фантомного чтения
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
SELECT @@SPID 'SID', 'select Оценки' 'результат', Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки   WHERE [Значение Показателя]=1.5;
					
WAITFOR DELAY '00:00:05';

SELECT @@SPID 'SID', 'select Оценки' 'результат', Номер_оценки, Дата_оценки, Предприятие,
					Показатель, [Значение Показателя] FROM Оценки   WHERE [Значение Показателя]=1.5;
COMMIT;




SELECT * FROM Оценки
--8

begin tran
		INSERT into Оценки values(11, '2024-02-21', 'Предприятие 2', 'Прибыль', 7);
		begin tran
		update Оценки set Показатель ='Себестоимость' where Номер_оценки=11;
		commit  
		if @@TRANCOUNT > 0 rollback;
select count(*) 'amount' from Оценки where Номер_оценки=7;