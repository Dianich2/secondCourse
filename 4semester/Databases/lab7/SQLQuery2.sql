SELECT est.Показатель, est.Предприятие, AVG(est.[Значение показателя]) indicator, COUNT(*) n
	FROM Оценки est
	INNER JOIN Показатели ind ON est.Показатель = ind.Название_показателя
	INNER JOIN Предприятия com ON est.Предприятие = com.Название
	GROUP BY est.Показатель, est.Предприятие WITH ROLLUP

SELECT est.Показатель, est.Предприятие, AVG(est.[Значение показателя]) indicator, COUNT(*) n
	FROM Оценки est
	INNER JOIN Показатели ind ON est.Показатель = ind.Название_показателя
	INNER JOIN Предприятия com ON est.Предприятие = com.Название
	GROUP BY est.Показатель, est.Предприятие WITH CUBE


SELECT est.Показатель, est.Предприятие, AVG(est.[Значение показателя]) indicator, COUNT(*) n
	FROM Оценки est
	INNER JOIN Показатели ind ON est.Показатель = ind.Название_показателя
	INNER JOIN Предприятия com ON est.Предприятие = com.Название
	WHERE est.Показатель = 'Прибыль'
	GROUP BY est.Показатель, est.Предприятие
UNION
SELECT est.Показатель, est.Предприятие, AVG(est.[Значение показателя]) indicator, COUNT(*) n
	FROM Оценки est
	INNER JOIN Показатели ind ON est.Показатель = ind.Название_показателя
	INNER JOIN Предприятия com ON est.Предприятие = com.Название
	WHERE est.Показатель = 'Себестоимость'
	GROUP BY est.Показатель, est.Предприятие

SELECT est.Показатель, est.Предприятие, AVG(est.[Значение показателя]) indicator, COUNT(*) n
	FROM Оценки est
	INNER JOIN Показатели ind ON est.Показатель = ind.Название_показателя
	INNER JOIN Предприятия com ON est.Предприятие = com.Название
	WHERE est.Показатель = 'Прибыль'
	GROUP BY est.Показатель, est.Предприятие
INTERSECT
SELECT est.Показатель, est.Предприятие, AVG(est.[Значение показателя]) indicator, COUNT(*) n
	FROM Оценки est
	INNER JOIN Показатели ind ON est.Показатель = ind.Название_показателя
	INNER JOIN Предприятия com ON est.Предприятие = com.Название
	WHERE est.Показатель = 'Себестоимость'
	GROUP BY est.Показатель, est.Предприятие

SELECT est.Показатель, est.Предприятие, AVG(est.[Значение показателя]) indicator, COUNT(*) n
	FROM Оценки est
	INNER JOIN Показатели ind ON est.Показатель = ind.Название_показателя
	INNER JOIN Предприятия com ON est.Предприятие = com.Название
	WHERE est.Показатель = 'Прибыль'
	GROUP BY est.Показатель, est.Предприятие
EXCEPT
SELECT est.Показатель, est.Предприятие, AVG(est.[Значение показателя]) indicator, COUNT(*) n
	FROM Оценки est
	INNER JOIN Показатели ind ON est.Показатель = ind.Название_показателя
	INNER JOIN Предприятия com ON est.Предприятие = com.Название
	WHERE est.Показатель = 'Себестоимость'
	GROUP BY est.Показатель, est.Предприятие



