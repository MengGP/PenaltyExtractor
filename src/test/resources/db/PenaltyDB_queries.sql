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

-- Водители по гос.номеру
SELECT * FROM drivers
WHERE id IN 
(SELECT driver_id FROM REGISTERED_VEHICLES
where VEHICLES_REG_NUMBER = 'в027см27')

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

--- Штраф по регистрационному номеру итоговый:
SELECT date, full_name, vehicles_reg_number,mark, model, clause, cost FROM
		(SELECT * FROM ISSUED_PENALTIES where REGISTERED_VEHICLE_ID IN 
			(SELECT id FROM REGISTERED_VEHICLES where VEHICLES_REG_NUMBER   =? )
		) as filtered_penalties,
		registered_vehicles,
		PENALTY_CATALOG,
		DRIVERS,
		vehicles
	WHERE
		filtered_penalties.registered_vehicle_id = registered_vehicles.id AND
		filtered_penalties.PENALTY_ID = PENALTY_CATALOG.id AND
		DRIVERS.id IN (SELECT driver_id FROM REGISTERED_VEHICLES where id = filtered_penalties.registered_vehicle_id) AND
		VEHICLES.id IN (SELECT vehicle_id FROM REGISTERED_VEHICLES where id = filtered_penalties.registered_vehicle_id)
	order by date desc;
		
--- Штраф по водителю номеру итоговый:	
SELECT date, full_name, vehicles_reg_number,mark, model, clause, cost FROM	
		(SELECT * FROM ISSUED_PENALTIES where REGISTERED_VEHICLE_ID IN 
			(SELECT id FROM REGISTERED_VEHICLES where driver_id IN 
				(SELECT id FROM DRIVERS where FULL_NAME =? )
			)
		) as filtered_penalties,
		registered_vehicles,
		PENALTY_CATALOG,
		DRIVERS,
		vehicles
	WHERE
		filtered_penalties.registered_vehicle_id = registered_vehicles.id AND
		filtered_penalties.PENALTY_ID = PENALTY_CATALOG.id AND
		DRIVERS.id IN (SELECT driver_id FROM REGISTERED_VEHICLES where id = filtered_penalties.registered_vehicle_id) AND
		VEHICLES.id IN (SELECT vehicle_id FROM REGISTERED_VEHICLES where id = filtered_penalties.registered_vehicle_id)
	order by date desc;


-- 5 наиболее частых штрафов

--- посчитанные penalty_id
SELECT PENALTY_ID , COUNT(PENALTY_ID) as cnt  FROM ISSUED_PENALTIES 
group by PENALTY_ID;

-- верхние 5 с сортировкой по убыванию
SELECT PENALTY_ID , COUNT(PENALTY_ID) as cnt  FROM ISSUED_PENALTIES 
group by PENALTY_ID
order by cnt desc limit 5;

-- итоговый 
SELECT cnt, clause FROM
		PENALTY_CATALOG,
		(SELECT PENALTY_ID, COUNT(PENALTY_ID) as cnt FROM
			ISSUED_PENALTIES 
			group by PENALTY_ID 
			order by cnt desc limit ?
		) as top_penalties 
	where
		PENALTY_CATALOG.id = top_penalties.PENALTY_ID
	order by top_penalties.cnt desc;
	




















































