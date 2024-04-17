CREATE VIEW [�������������]
	AS SELECT t.TEACHER, t.TEACHER_NAME, t.GENDER, t.PULPIT
	FROM TEACHER t;

SELECT * FROM �������������

CREATE VIEW [���������� ������]
	AS SELECT 
	 f.FACULTY_NAME [���������],
	COUNT(p.PULPIT_NAME)[���������� ������]
	FROM PULPIT p INNER JOIN FACULTY f
	ON p.FACULTY = f.FACULTY
	GROUP BY f.FACULTY_NAME;

SELECT * FROM [���������� ������]

CREATE VIEW [���������](audcod, audtype, audname)
	AS SELECT a.AUDITORIUM, a.AUDITORIUM_TYPE, a.AUDITORIUM_NAME
	FROM AUDITORIUM a
	WHERE a.AUDITORIUM_TYPE LIKE '��%' WITH CHECK OPTION;

DROP VIEW [���������]

SELECT * FROM [���������]

INSERT [���������] VALUES('105-1','��', '105-1');
DELETE FROM [���������] WHERE audcod = '104-1';
UPDATE [���������] SET audtype = '��-�' WHERE audcod = '104-1'

CREATE VIEW ����������
	AS SELECT TOP 10 s.SUBJECT, s.SUBJECT_NAME, s.PULPIT
	FROM SUBJECT s
	ORDER BY SUBJECT_NAME

DROP VIEW ����������

SELECT * FROM ����������


CREATE VIEW [���������� ������2] WITH SCHEMABINDING
	AS SELECT 
	 f.FACULTY_NAME [���������],
	COUNT(p.PULPIT_NAME)[���������� ������]
	FROM dbo.PULPIT p INNER JOIN dbo.FACULTY f
	ON p.FACULTY = f.FACULTY
	GROUP BY f.FACULTY_NAME;

SELECT * FROM [���������� ������2]