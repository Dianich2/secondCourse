select * from FACULTY
select * from GROUPS
select * from STUDENT
select * from PROFESSION


---1
go
CREATE FUNCTION COUNT_STUDENTS(@faculty varchar(20)) returns int
AS BEGIN
	DECLARE @rc int = 0;
	SET @rc = (SELECT COUNT(s.IDSTUDENT) FROM STUDENT s join GROUPS g
					ON s.IDGROUP = g.IDGROUP
					WHERE g.FACULTY = @faculty);
	RETURN @rc;
END;

go
DECLARE @f int = dbo.COUNT_STUDENTS('ХТиТ');
print 'Number of students: ' + cast(@f as varchar(4));

SELECT g.FACULTY, dbo.COUNT_STUDENTS(g.FACULTY) [number of students] 
	FROM GROUPS g GROUP BY g.FACULTY

---1.2
go
CREATE FUNCTION COUNT_STUDENTS2(@faculty varchar(20), @profession varchar(70)) returns int
AS BEGIN
	DECLARE @rc int = 0;
	SET @rc = (SELECT COUNT(s.IDSTUDENT) FROM STUDENT s join GROUPS g
					ON s.IDGROUP = g.IDGROUP
					join PROFESSION p
					ON g.PROFESSION = p.PROFESSION
					WHERE g.FACULTY = @faculty AND p.PROFESSION_NAME = @profession);
	RETURN @rc;
END;

go
DECLARE @f int = dbo.COUNT_STUDENTS2('ХТиТ', 'Конструирование и производство изделий из композиционных материалов');
print 'Number of students: ' + cast(@f as varchar(4));

SELECT g.FACULTY, p.PROFESSION_NAME, dbo.COUNT_STUDENTS(g.FACULTY) [number of students] 
	FROM GROUPS g join PROFESSION p
	ON g.PROFESSION = p.PROFESSION
	GROUP BY g.FACULTY, p.PROFESSION_NAME



---2
go
CREATE FUNCTION FSUBJECTS(@pulpit varchar(20)) returns varchar(300)
AS BEGIN
DECLARE Discipline CURSOR LOCAL FOR SELECT s.SUBJECT_NAME FROM SUBJECT s WHERE s.PULPIT = @pulpit;
DECLARE @subject varchar(60), @subject_ret varchar(300) ='';
OPEN Discipline;
FETCH Discipline into @subject;
WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @subject_ret = RTRIM(@subject) +', ' +  @subject_ret;
		FETCH  Discipline into @subject;
	END;
CLOSE Discipline;
SET @subject_ret = 'Дисциплины: ' + @subject_ret;
RETURN @subject_ret;
END;
--DROP FUNCTION FSUBJECTS;
go
SELECT p.PULPIT, dbo.FSUBJECTS(p.PULPIT) [Disciplines] FROM PULPIT p;



---3
go
CREATE FUNCTION FFACPUL(@faculty varchar(20), @pulpit varchar(20)) returns table
AS RETURN 
SELECT f.FACULTY, p.PULPIT FROM FACULTY f left outer join PULPIT p
	ON f.FACULTY = p.FACULTY
	WHERE f.FACULTY = isnull(@faculty,f.FACULTY)and
		p.PULPIT = isnull(@pulpit,p.PULPIT);

go
select * from dbo.FFACPUL(NULL,NULL);
select * from dbo.FFACPUL('ТТЛП',NULL);
select * from dbo.FFACPUL(NULL,'ИСиТ');
select * from dbo.FFACPUL('ЛХ','ТиП');
select * from dbo.FFACPUL('ЛХ','ПИ');



---4
go
CREATE FUNCTION FTEACHER (@pulpit varchar(20)) returns int
AS BEGIN
		DECLARE @result int = 0;
		SET @result  = (SELECT count(*) FROM
									TEACHER t inner join PULPIT p
									ON t.PULPIT = p.PULPIT
									WHERE p.PULPIT = isnull(@pulpit, p.PULPIT));
		RETURN @result;
END;

go
SELECT PULPIT, dbo.FTEACHER(PULPIT.PULPIT) 'Количество преподавателей ☺' FROM PULPIT;
SELECT dbo.FTEACHER(NULL) 'Всего преподавателей';


---6
go
create function FACULTY_REPORT(@c int) returns @fr table
	                        ( [Факультет] varchar(50), [Количество кафедр] int, [Количество групп]  int, 
	                                                                 [Количество студентов] int, [Количество специальностей] int )
	as begin 
                 declare cc CURSOR static for 
	       select FACULTY from FACULTY 
                                                    where dbo.COUNT_STUDENTS2(FACULTY, default) > @c; 
	       declare @f varchar(30);
	       open cc;  
                 fetch cc into @f;
	       while @@fetch_status = 0
	       begin
	            insert @fr values( @f,  (select count(PULPIT) from PULPIT where FACULTY = @f),
	            (select count(IDGROUP) from GROUPS where FACULTY = @f),   dbo.COUNT_STUDENTS2(@f, default),
	            (select count(PROFESSION) from PROFESSION where FACULTY = @f)   ); 
	            fetch cc into @f;  
	       end;   
                 return; 
	end;