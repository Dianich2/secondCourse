CREATE VIEW Estimations
	AS SELECT e.Дата_оценки, e.Предприятие, e.Показатель
	FROM Оценки e;

SELECT * FROM Estimations

CREATE VIEW EstimationsImp
	AS SELECT p.Название_показателя, 
	SUM(e.[Значение Показателя]) [Значение Показателя],
	AVG(p.Важность_показателя) Важность_показателя
	FROM Оценки e
	INNER JOIN Показатели p
	ON e.Показатель = p.Название_показателя
	GROUP BY p.Название_показателя

SELECT * FROM EstimationsImp

CREATE VIEW Factory (name, req, tel, rep)
	AS SELECT p.Название,
	p.Банковские_реквизиты, 
	p.Телефон, 
	p.Контакнтое_лицо
	FROM Предприятия p


SELECT * FROM Factory

INSERT Factory VALUES('Factory3', 'IBAN:223409238049283', 
'80298347283', 'representor 3, HR')

UPDATE Factory set name = 'Factory 3' WHERE name = 'Factory3'
DELETE Factory WHERE name = 'Factory 3'

CREATE VIEW Indicators
	AS SELECT TOP 2 p.Название_показателя, p.Важность_показателя
	FROM Показатели p
	WHERE p.Важность_показателя > 0.5
	ORDER BY p.Важность_показателя

SELECT * FROM Indicators


CREATE VIEW EstimationsImp2 WITH SCHEMABINDING
	AS SELECT p.Название_показателя, 
	SUM(e.[Значение Показателя]) [Значение Показателя],
	AVG(p.Важность_показателя) Важность_показателя
	FROM dbo.Оценки e
	INNER JOIN dbo.Показатели p
	ON e.Показатель = p.Название_показателя
	GROUP BY p.Название_показателя

SELECT * FROM EstimationsImp2
