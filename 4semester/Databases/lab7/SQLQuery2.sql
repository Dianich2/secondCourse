SELECT est.����������, est.�����������, AVG(est.[�������� ����������]) indicator, COUNT(*) n
	FROM ������ est
	INNER JOIN ���������� ind ON est.���������� = ind.��������_����������
	INNER JOIN ����������� com ON est.����������� = com.��������
	GROUP BY est.����������, est.����������� WITH ROLLUP

SELECT est.����������, est.�����������, AVG(est.[�������� ����������]) indicator, COUNT(*) n
	FROM ������ est
	INNER JOIN ���������� ind ON est.���������� = ind.��������_����������
	INNER JOIN ����������� com ON est.����������� = com.��������
	GROUP BY est.����������, est.����������� WITH CUBE


SELECT est.����������, est.�����������, AVG(est.[�������� ����������]) indicator, COUNT(*) n
	FROM ������ est
	INNER JOIN ���������� ind ON est.���������� = ind.��������_����������
	INNER JOIN ����������� com ON est.����������� = com.��������
	WHERE est.���������� = '�������'
	GROUP BY est.����������, est.�����������
UNION
SELECT est.����������, est.�����������, AVG(est.[�������� ����������]) indicator, COUNT(*) n
	FROM ������ est
	INNER JOIN ���������� ind ON est.���������� = ind.��������_����������
	INNER JOIN ����������� com ON est.����������� = com.��������
	WHERE est.���������� = '�������������'
	GROUP BY est.����������, est.�����������

SELECT est.����������, est.�����������, AVG(est.[�������� ����������]) indicator, COUNT(*) n
	FROM ������ est
	INNER JOIN ���������� ind ON est.���������� = ind.��������_����������
	INNER JOIN ����������� com ON est.����������� = com.��������
	WHERE est.���������� = '�������'
	GROUP BY est.����������, est.�����������
INTERSECT
SELECT est.����������, est.�����������, AVG(est.[�������� ����������]) indicator, COUNT(*) n
	FROM ������ est
	INNER JOIN ���������� ind ON est.���������� = ind.��������_����������
	INNER JOIN ����������� com ON est.����������� = com.��������
	WHERE est.���������� = '�������������'
	GROUP BY est.����������, est.�����������

SELECT est.����������, est.�����������, AVG(est.[�������� ����������]) indicator, COUNT(*) n
	FROM ������ est
	INNER JOIN ���������� ind ON est.���������� = ind.��������_����������
	INNER JOIN ����������� com ON est.����������� = com.��������
	WHERE est.���������� = '�������'
	GROUP BY est.����������, est.�����������
EXCEPT
SELECT est.����������, est.�����������, AVG(est.[�������� ����������]) indicator, COUNT(*) n
	FROM ������ est
	INNER JOIN ���������� ind ON est.���������� = ind.��������_����������
	INNER JOIN ����������� com ON est.����������� = com.��������
	WHERE est.���������� = '�������������'
	GROUP BY est.����������, est.�����������



