
---1
go
CREATE TABLE TR_AUDIT
(
	ID int identity,
	STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')),
	TRNAME varchar(50),
	CC varchar(300)
)

go
SELECT * FROM TEACHER
go
CREATE TRIGGER TR_TEACHER_INS ON TEACHER AFTER INSERT
AS
	DECLARE @a1 varchar(10), @a2 varchar(50), @a3 varchar(1), @a4 varchar(10), @in varchar(300);
	PRINT 'Операция вставки';
	SET @a1 = (select TEACHER from inserted);
	SET @a2 = (select TEACHER_NAME from inserted);
	set @a3 = (select GENDER from inserted);
	set @a4 = (select PULPIT from inserted);
	set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
	INSERT INTO TR_AUDIT(STMT, TRNAME, CC)
	VALUES ('INS', 'TR_TEACHER_INS', @in);
RETURN

DELETE FROM TEACHER WHERE TEACHER_NAME = 'SomeOne';
INSERT INTO TEACHER VALUES ('SMN', 'SomeOne', 'м', 'ИСиТ');
SELECT * FROM TR_AUDIT;


---2
go
CREATE TRIGGER TR_TEACHER_DEL ON TEACHER AFTER DELETE
AS
	DECLARE @a1 varchar(10), @a2 varchar(50), @a3 varchar(1), @a4 varchar(10), @in varchar(300);
	PRINT 'Операция удаления';
	SET @a1 = (select TEACHER from deleted);
	SET @a2 = (select TEACHER_NAME from deleted);
	set @a3 = (select GENDER from deleted);
	set @a4 = (select PULPIT from deleted);
	set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
	INSERT INTO TR_AUDIT(STMT, TRNAME, CC)
	VALUES ('DEL', 'TR_TEACHER_DEL', @in);
RETURN

DELETE FROM TEACHER WHERE TEACHER_NAME = 'SomeOne';
SELECT * FROM TR_AUDIT;


go
CREATE TRIGGER TR_TEACHER_UPD ON TEACHER AFTER UPDATE
AS
	DECLARE @a1 varchar(10), @a2 varchar(50), @a3 varchar(1), @a4 varchar(10), @in varchar(300);
	PRINT 'Операция изменения';
	SET @a1 = (select TEACHER from inserted);
	SET @a2 = (select TEACHER_NAME from inserted);
	set @a3 = (select GENDER from inserted);
	set @a4 = (select PULPIT from inserted);
	set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;

	SET @a1 = (select TEACHER from deleted);
	SET @a2 = (select TEACHER_NAME from deleted);
	set @a3 = (select GENDER from deleted);
	set @a4 = (select PULPIT from deleted);
	set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4 + '/' + @in;
	INSERT INTO TR_AUDIT(STMT, TRNAME, CC)
	VALUES ('UPD', 'TR_TEACHER_UPD', @in);
RETURN

INSERT INTO TEACHER VALUES ('SMN', 'SomeOne', 'м', 'ИСиТ');
DELETE FROM TEACHER WHERE TEACHER_NAME = 'SomeOne';
UPDATE TEACHER SET GENDER = 'м' WHERE TEACHER_NAME = 'SomeOne';
SELECT * FROM TR_AUDIT;



---4
go
CREATE TRIGGER TR_TEACHER ON TEACHER AFTER INSERT, DELETE, UPDATE
AS
	DECLARE @a1 varchar(10), @a2 varchar(50), @a3 varchar(1), @a4 varchar(10), @in varchar(300);
	DECLARE @ins int = (select count(*) from inserted),
			@del int = (select count(*) from deleted);


	if @ins > 0 and @del = 0
	begin
		PRINT 'Событие ISERT';
		SET @a1 = (select TEACHER from inserted);
		SET @a2 = (select TEACHER_NAME from inserted);
		set @a3 = (select GENDER from inserted);
		SET @a4 = (select PULPIT from inserted);
		SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
		INSERT INTO TR_AUDIT(STMT, TRNAME, CC)
		VALUES ('INS', 'TR_TEACHER_INS', @in);
	END
	else
	if @ins = 0 and @del > 0
	begin
		PRINT 'Событие DELTE';
		SET @a1 = (select TEACHER from deleted);
		SET @a2 = (select TEACHER_NAME from deleted);
		SET @a3 = (select GENDER from deleted);
		SET @a4 = (select PULPIT from deleted);
		SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
		INSERT INTO TR_AUDIT(STMT, TRNAME, CC)
		VALUES ('DEL', 'TR_TEACHER_DEL', @in);
	end;
	else
	if @ins > 0 and @del > 0
	begin
		PRINT 'Событие UPDATE';
		SET @a1 = (select TEACHER from inserted);
		SET @a2 = (select TEACHER_NAME from inserted);
		SET @a3 = (select GENDER from inserted);
		SET @a4 = (select PULPIT from inserted);
		SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;

		SET @a1 = (select TEACHER from deleted);
		SET @a2 = (select TEACHER_NAME from deleted);
		SET @a3 = (select GENDER from deleted);
		SET @a4 = (select PULPIT from deleted);
		SET @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4 + '/' + @in;
		INSERT INTO TR_AUDIT(STMT, TRNAME, CC)
		VALUES ('UPD', 'TR_TEACHER_UPD', @in);
	end;
RETURN;

INSERT INTO TEACHER VALUES ('SMN', 'SomeOne', 'м', 'ИСиТ');
DELETE FROM TEACHER WHERE TEACHER_NAME = 'SomeOne';
UPDATE TEACHER SET GENDER = 'м' WHERE TEACHER_NAME = 'SomeOne';
SELECT * FROM TR_AUDIT;



---5
UPDATE TEACHER SET GENDER = 'о' WHERE TEACHER_NAME = 'SomeOne';
SELECT * FROM TR_AUDIT;



---6
go
CREATE TRIGGER TR_TEACHER_DEL1 ON TEACHER AFTER DELETE
AS PRINT 'TR_TEACHER_DLE1';
RETURN;

go
CREATE TRIGGER TR_TEACHER_DEL2 ON TEACHER AFTER DELETE
AS PRINT 'TR_TEACHER_DLE2';
RETURN;

go
CREATE TRIGGER TR_TEACHER_DEL3 ON TEACHER AFTER DELETE
AS PRINT 'TR_TEACHER_DLE3';
RETURN;

INSERT INTO TEACHER VALUES ('SMN', 'SomeOne', 'м', 'ИСиТ');
DELETE FROM TEACHER WHERE TEACHER_NAME = 'SomeOne';


SELECT t.name, e.type_desc
	FROM sys.triggers t join sys.trigger_events e
	ON t.object_id = e.object_id
		WHERE OBJECT_NAME(t.parent_id) = 'TEACHER' and
								e.type_desc = 'DELETE';

EXEC sp_settriggerorder @triggername = 'TR_TEACHER_DEL3',
			@order = 'First', @stmttype = 'DELETE';

EXEC sp_settriggerorder @triggername = 'TR_TEACHER_DEL2',
			@order = 'Last', @stmttype = 'DELETE';




---7
go
CREATE TRIGGER TEACHER_TRAN ON TEACHER AFTER INSERT
AS
	DECLARE @pulp varchar(10) = (select PULPIT from inserted);
	if @pulp = 'ТЛ'
	begin
		raiserror('Так незя', 10, 1);
		rollback;
	end;
RETURN;

EXEC sp_settriggerorder @triggername = 'TEACHER_TRAN',
			@order = 'First', @stmttype = 'INSERT';

go
INSERT INTO TEACHER VALUES ('SMN2', 'SomeOne2', 'м', 'ТЛ');
SELECT * FROM TR_AUDIT;
SELECT * FROM TEACHER;




---8
go
CREATE TRIGGER FACULTY_INSTEAD_OF ON FACULTY instead of DELETE
AS raiserror (N'Удаление запрещено', 10, 1);
RETURN;

SELECT * FROM FACULTY;
DELETE FROM FACULTY WHERE FACULTY = 'ТОВ';




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
	raiserror('Операции с базой данных UNIVER запрещены', 16, 1);
	rollback;
RETURN;

CREATE TABLE M(
	a int,
	b real
);