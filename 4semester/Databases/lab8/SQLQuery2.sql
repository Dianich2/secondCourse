CREATE VIEW Estimations
	AS SELECT e.����_������, e.�����������, e.����������
	FROM ������ e;

SELECT * FROM Estimations

CREATE VIEW EstimationsImp
	AS SELECT p.��������_����������, 
	SUM(e.[�������� ����������]) [�������� ����������],
	AVG(p.��������_����������) ��������_����������
	FROM ������ e
	INNER JOIN ���������� p
	ON e.���������� = p.��������_����������
	GROUP BY p.��������_����������

SELECT * FROM EstimationsImp

CREATE VIEW Factory (name, req, tel, rep)
	AS SELECT p.��������,
	p.����������_���������, 
	p.�������, 
	p.����������_����
	FROM ����������� p


SELECT * FROM Factory

INSERT Factory VALUES('Factory3', 'IBAN:223409238049283', 
'80298347283', 'representor 3, HR')

UPDATE Factory set name = 'Factory 3' WHERE name = 'Factory3'
DELETE Factory WHERE name = 'Factory 3'

CREATE VIEW Indicators
	AS SELECT TOP 2 p.��������_����������, p.��������_����������
	FROM ���������� p
	WHERE p.��������_���������� > 0.5
	ORDER BY p.��������_����������

SELECT * FROM Indicators


CREATE VIEW EstimationsImp2 WITH SCHEMABINDING
	AS SELECT p.��������_����������, 
	SUM(e.[�������� ����������]) [�������� ����������],
	AVG(p.��������_����������) ��������_����������
	FROM dbo.������ e
	INNER JOIN dbo.���������� p
	ON e.���������� = p.��������_����������
	GROUP BY p.��������_����������

SELECT * FROM EstimationsImp2
