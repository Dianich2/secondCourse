SELECT Наименование_товара,  
MAX(Цена_продажи) [Максимальная цена],
MIN(Цена_продажи)[Минимальная цена],
SUM(Цена_продажи)[Сумма цен],
COUNT(*)[Количество заказанных товаров]
From  Заказы  Inner Join  Товары 
On  Заказы.Наименование_товара = Товары.Наименование  
And  Товары.Количество > 5  Group by Наименование_товара  

SELECT
result_category,
COUNT(*) AS count
FROM ( SELECT CASE 
  WHEN ТОВАРЫ.Количество BETWEEN 2 AND 3 THEN 'Небольшое количество'
  WHEN ТОВАРЫ.Количество BETWEEN 4 AND 7 THEN 'Нормальное количество'
  ELSE 'Большое количество'
  END AS result_category
  FROM ТОВАРЫ ) AS T
GROUP BY result_category
ORDER BY 
CASE 
WHEN result_category = 'Небольшое количество' THEN 3
WHEN result_category = 'Нормальное количество' THEN 2
ELSE 1 
END DESC;

SELECT 
    t.Наименование, 
    g.Количество, 
    s.Наименование_фирмы,
    ROUND(AVG(CAST(g.Количество AS float(4))), 2) AS AVGNOTE
FROM 
    ТОВАРЫ t 
INNER JOIN 
    ЗАКАЗЫ g ON t.Наименование = g.Наименование_товара
INNER JOIN 
    ЗАКАЗЧИКИ s ON s.Наименование_фирмы = g.Заказчик
WHERE t.Наименование = 'GT' OR t.Наименование = 'Supra'
GROUP BY 
    t.Наименование, 
  s.Наименование_фирмы,
  g.Количество

SELECT Количество, 
COUNT(*) AS number
FROM ТОВАРЫ
GROUP BY Количество
HAVING MAX(Количество) IN (4, 10)
ORDER BY number DESC;