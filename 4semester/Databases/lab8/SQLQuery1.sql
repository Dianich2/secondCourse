CREATE VIEW [Преподаватель]
	AS SELECT t.TEACHER, t.TEACHER_NAME, t.GENDER, t.PULPIT
	FROM TEACHER t;

SELECT * FROM Преподаватель

CREATE VIEW [Количество кафедр]
	AS SELECT 
	 f.FACULTY_NAME [Факультет],
	COUNT(p.PULPIT_NAME)[Количество кафедр]
	FROM PULPIT p INNER JOIN FACULTY f
	ON p.FACULTY = f.FACULTY
	GROUP BY f.FACULTY_NAME;

SELECT * FROM [Количество кафедр]

CREATE VIEW [Аудитории](audcod, audtype, audname)
	AS SELECT a.AUDITORIUM, a.AUDITORIUM_TYPE, a.AUDITORIUM_NAME
	FROM AUDITORIUM a
	WHERE a.AUDITORIUM_TYPE LIKE 'ЛК%' WITH CHECK OPTION;

DROP VIEW [Аудитории]

SELECT * FROM [Аудитории]

INSERT [Аудитории] VALUES('105-1','ЛК', '105-1');
DELETE FROM [Аудитории] WHERE audcod = '104-1';
UPDATE [Аудитории] SET audtype = 'ЛК-К' WHERE audcod = '104-1'

CREATE VIEW Дисциплины
	AS SELECT TOP 10 s.SUBJECT, s.SUBJECT_NAME, s.PULPIT
	FROM SUBJECT s
	ORDER BY SUBJECT_NAME

DROP VIEW Дисциплины

SELECT * FROM Дисциплины


CREATE VIEW [Количество кафедр2] WITH SCHEMABINDING
	AS SELECT 
	 f.FACULTY_NAME [Факультет],
	COUNT(p.PULPIT_NAME)[Количество кафедр]
	FROM dbo.PULPIT p INNER JOIN dbo.FACULTY f
	ON p.FACULTY = f.FACULTY
	GROUP BY f.FACULTY_NAME;

SELECT * FROM [Количество кафедр2]