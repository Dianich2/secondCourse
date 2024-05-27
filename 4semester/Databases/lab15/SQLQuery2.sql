
---1
go
CREATE TABLE TR_EST
(
	ID int identity,
	STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')),
	TRNAME varchar(20),
	cc varchar(300)
)


go
SELECT * FROM Оценки

go
CREATE TRIGGER TR_EST_INS ON Оценки AFTER INSERT
AS
	DECLARE @a1 varchar(20), @a2 varchar(20), @a3 varchar(20), @a4 real, @in varchar(300);
	PRINT 'Операция вставки';
	SET @a1 = (select Дата_оценки from inserted);
	SET @a2 = (select Предприятие from inserted);
	SET @a3 = (select Показатель from inserted);
	SET @a4 = (select [Значение Показателя] from inserted);
	set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + cast(@a4 as varchar(4));
	INSERT INTO TR_EST(STMT, TRNAME, CC)
	VALUES ('INS', 'TR_EST_INS', @in);
RETURN

INSERT INTO Оценки VALUES(0, '2024-05-23', 'Предприятие 1', 'Прибыль', 17);
SELECT * FROM Оценки;
SELECT * FROM TR_EST;



--2
go
CREATE TRIGGER TR_EST_DEL ON Оценки AFTER DELETE
AS
	DECLARE @a1 varchar(20), @a2 varchar(20), @a3 varchar(20), @a4 real, @in varchar(300);
	PRINT 'Операция удаления';
	SET @a1 = (select Дата_оценки from deleted);
	SET @a2 = (select Предприятие from deleted);
	SET @a3 = (select Показатель from deleted);
	SET @a4 = (select [Значение Показателя] from deleted);
	set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + cast(@a4 as varchar(4));
	INSERT INTO TR_EST(STMT, TRNAME, CC)
	VALUES ('INS', 'TR_DEL', @in);
RETURN



DELETE FROM Оценки WHERE Номер_оценки = 0;
INSERT INTO Оценки VALUES(0, '2024-05-23', 'Предприятие 1', 'Прибыль', 17);
SELECT * FROM Оценки;
SELECT * FROM TR_EST;


--3
go
CREATE TRIGGER TR_EST_UPD ON Оценки AFTER UPDATE
AS
	DECLARE @a1 varchar(20), @a2 varchar(20), @a3 varchar(20), @a4 real, @in varchar(300);
	PRINT 'Операция изменения';
	SET @a1 = (select Дата_оценки from inserted);
	SET @a2 = (select Предприятие from inserted);
	SET @a3 = (select Показатель from inserted);
	SET @a4 = (select [Значение Показателя] from inserted);
	set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + cast(@a4 as varchar(4));

	SET @a1 = (select Дата_оценки from deleted);
	SET @a2 = (select Предприятие from deleted);
	SET @a3 = (select Показатель from deleted);
	SET @a4 = (select [Значение Показателя] from deleted);
	set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + cast(@a4 as varchar(4)) + '/' + @in;
	INSERT INTO TR_EST(STMT, TRNAME, CC)
	VALUES ('INS', 'TR_UPD', @in);
RETURN


UPDATE Оценки SET [Значение Показателя] = 17 WHERE Номер_оценки = 0;
INSERT INTO Оценки VALUES(0, '2024-05-23', 'Предприятие 1', 'Прибыль', 17);
SELECT * FROM Оценки;
SELECT * FROM TR_EST;



--4
go
CREATE TRIGGER TR_EST_TR ON Оценки AFTER INSERT, DELETE, UPDATE
AS
	DECLARE @a1 varchar(20), @a2 varchar(20), @a3 varchar(20), @a4 real, @in varchar(300);
	DECLARE @ins int = (select count(*) from inserted),
			@del int = (select count(*) from deleted);


	if @ins > 0 and @del = 0
	begin
		PRINT 'Событие ISERT';
		SET @a1 = (select Дата_оценки from inserted);
		SET @a2 = (select Предприятие from inserted);
		SET @a3 = (select Показатель from inserted);
		SET @a4 = (select [Значение Показателя] from inserted);
		set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + cast(@a4 as varchar(4));
		INSERT INTO TR_EST(STMT, TRNAME, CC)
		VALUES ('INS', 'TR_EST_INS', @in);
	end
	else
	if @ins = 0 and @del > 0
	begin
		PRINT 'Событие DELTE';
		SET @a1 = (select Дата_оценки from deleted);
		SET @a2 = (select Предприятие from deleted);
		SET @a3 = (select Показатель from deleted);
		SET @a4 = (select [Значение Показателя] from deleted);
		SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + cast(@a4 as varchar(4));
		INSERT INTO TR_EST(STMT, TRNAME, CC)
		VALUES ('INS', 'TR_DEL', @in);
	end;
	else
	if @ins > 0 and @del > 0
	begin
		PRINT 'Событие UPDATE';
		SET @a1 = (select Дата_оценки from inserted);
		SET @a2 = (select Предприятие from inserted);
		SET @a3 = (select Показатель from inserted);
		SET @a4 = (select [Значение Показателя] from inserted);
		SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + cast(@a4 as varchar(4));

		SET @a1 = (select Дата_оценки from deleted);
		SET @a2 = (select Предприятие from deleted);
		SET @a3 = (select Показатель from deleted);
		SET @a4 = (select [Значение Показателя] from deleted);
		SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + cast(@a4 as varchar(4)) + '/' + @in;
		INSERT INTO TR_EST(STMT, TRNAME, CC)
		VALUES ('INS', 'TR_UPD', @in);
	end;
RETURN;


DELETE FROM Оценки WHERE Номер_оценки = 0;
UPDATE Оценки SET [Значение Показателя] = 25 WHERE Номер_оценки = 0;
INSERT INTO Оценки VALUES(0, '2024-05-23', 'Предприятие 1', 'Прибыль', 17);
SELECT * FROM Оценки;
SELECT * FROM TR_EST;


---5
INSERT INTO Оценки VALUES(21, '2024-05-23', 'Предприятие 3', 'Прибыль', 17);
SELECT * FROM Оценки;



---6
go
CREATE TRIGGER TR_EST_DEL1 ON Оценки AFTER DELETE
AS PRINT 'TR_EST_DEL1';
RETURN;

go
CREATE TRIGGER TR_EST_DEL2 ON Оценки AFTER DELETE
AS PRINT 'TR_EST_DEL2';
RETURN;

go
CREATE TRIGGER TR_EST_DEL3 ON Оценки AFTER DELETE
AS PRINT 'TR_EST_DEL3';
RETURN;

INSERT INTO Оценки VALUES(0, '2024-05-23', 'Предприятие 1', 'Прибыль', 17);
DELETE FROM Оценки WHERE Номер_оценки = 0;

SELECT t.name, e.type_desc
	FROM sys.triggers t join sys.trigger_events e
	ON t.object_id = e.object_id
		WHERE OBJECT_NAME(t.parent_id) = 'Оценки' and
								e.type_desc = 'DELETE';

EXEC sp_settriggerorder @triggername = 'TR_EST_DEL3',
			@order = 'First', @stmttype = 'DELETE';

EXEC sp_settriggerorder @triggername = 'TR_EST_DEL2',
			@order = 'Last', @stmttype = 'DELETE';



---7
go
CREATE TRIGGER EST_TRAN ON Оценки AFTER INSERT
AS
	DECLARE @val varchar(10) = (select [Значение Показателя] from inserted);
	if @val = 11
	begin
		raiserror('Так тоже незя', 10, 1);
		rollback;
	end;
RETURN;

EXEC sp_settriggerorder @triggername = 'EST_TRAN',
			@order = 'First', @stmttype = 'INSERT';

INSERT INTO Оценки VALUES(0, '2024-05-23', 'Предприятие 1', 'Прибыль', 11);



--8
go
CREATE TRIGGER FACTORIES_INSTEAD_OD ON Предприятия instead of DELETE
AS raiserror (N'Удаление запрещено', 10, 1);
RETURN;

SELECT * FROM Предприятия;
DELETE FROM Предприятия WHERE Название = 'Предприятие 2';



---9
go
CREATE TRIGGER DDL_UNIVER ON database for DDL_DATABASE_LEVEL_EVENTS
AS
	DECLARE @t varchar(50) = EVENTDATA()
	.value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
	DECLARE @t1 varchar(50) = EVENTDATA()
	.value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
	DECLARE @t2 varchar(50) = EVENTDATA()
	.value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');

	PRINT 'Тип события: ' + @t;
	PRINT 'Имя объекта: ' + @t1;
	PRINT 'Тип объекта: ' + @t2;
	raiserror('Операции с базой данных Korneliuk_MyBase запрещены', 16, 1);
	rollback;
RETURN;

CREATE TABLE M(
	a int,
	b real
);