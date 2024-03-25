SELECT ������������_������,  
MAX(����_�������) [������������ ����],
MIN(����_�������)[����������� ����],
SUM(����_�������)[����� ���],
COUNT(*)[���������� ���������� �������]
From  ������  Inner Join  ������ 
On  ������.������������_������ = ������.������������  
And  ������.���������� > 5  Group by ������������_������  

SELECT
result_category,
COUNT(*) AS count
FROM ( SELECT CASE 
  WHEN ������.���������� BETWEEN 2 AND 3 THEN '��������� ����������'
  WHEN ������.���������� BETWEEN 4 AND 7 THEN '���������� ����������'
  ELSE '������� ����������'
  END AS result_category
  FROM ������ ) AS T
GROUP BY result_category
ORDER BY 
CASE 
WHEN result_category = '��������� ����������' THEN 3
WHEN result_category = '���������� ����������' THEN 2
ELSE 1 
END DESC;

SELECT 
    t.������������, 
    g.����������, 
    s.������������_�����,
    ROUND(AVG(CAST(g.���������� AS float(4))), 2) AS AVGNOTE
FROM 
    ������ t 
INNER JOIN 
    ������ g ON t.������������ = g.������������_������
INNER JOIN 
    ��������� s ON s.������������_����� = g.��������
WHERE t.������������ = 'GT' OR t.������������ = 'Supra'
GROUP BY 
    t.������������, 
  s.������������_�����,
  g.����������

SELECT ����������, 
COUNT(*) AS number
FROM ������
GROUP BY ����������
HAVING MAX(����������) IN (4, 10)
ORDER BY number DESC;