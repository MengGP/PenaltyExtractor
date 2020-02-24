-- PenaltyDB_queries --

-- Все владельцы:
SELECT * FROM DRIVERS 

-- Все гос.номера
SELECT * FROM REGISTERED_VEHICLES 

-- Гос. номера принадлежащие одному владельцу
SELECT * FROM REGISTERED_VEHICLES 
where driver_id IN 
(SELECT id FROM DRIVERS 
where FULL_NAME =? );

-- Штрафы по гос. номру -> простой вариант, т.к. номер только 1
SELECT * FROM ISSUED_PENALTIES  
where REGISTERED_VEHICLE_ID  IN 
(SELECT id FROM REGISTERED_VEHICLES  
where VEHICLES_REG_NUMBER   = 'в027см27');

-- Штрафы по водителю -> усложненный вариант, т.к. у водителя может быть несколько автомобилей
SELECT * FROM ISSUED_PENALTIES  
where REGISTERED_VEHICLE_ID  IN 
(
	SELECT id FROM REGISTERED_VEHICLES 
	where driver_id IN 
	(
		SELECT id FROM DRIVERS 
		where FULL_NAME = 'Исаков Павел Борисович'
	)
);


-- 5 наиболее частых штрафов
	
--- посчитанные penalty_id
SELECT PENALTY_ID , COUNT(PENALTY_ID) as cnt  FROM ISSUED_PENALTIES 
group by PENALTY_ID;

-- верхние 5 с сортировкой по убыванию
SELECT PENALTY_ID , COUNT(PENALTY_ID) as cnt  FROM ISSUED_PENALTIES 
group by PENALTY_ID
order by cnt desc limit 5;

-- итоговый 
SELECT CLAUSE, cnt 
	FROM
		PENALTY_CATALOG,
		(SELECT PENALTY_ID , COUNT(PENALTY_ID) as cnt  FROM ISSUED_PENALTIES 
		 group by PENALTY_ID
		 order by cnt desc limit 5) as top_penalties 
	where
		PENALTY_CATALOG.id = top_penalties.PENALTY_ID
	order by top_penalties.cnt desc;
	




















































