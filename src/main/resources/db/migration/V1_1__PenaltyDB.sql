-- Таблица транспортных средств: марка, модель
CREATE TABLE vehicles
  (
    id BIGINT NOT NULL,
    mark VARCHAR(256),
  	model VARCHAR(256),
  	PRIMARY KEY (id)

  );

-- Таблица водителей
CREATE TABLE drivers
  (
      id BIGINT NOT NULL,
      full_name VARCHAR(256),
      PRIMARY KEY (id)
  );

-- Таблица зарегистрированный средств: гос.номер / тарнспортное средство / водитель
CREATE TABLE registered_vehicles
  (
      id BIGINT NOT NULL,
      vehicles_reg_number VARCHAR(32),
	  vehicle_id BIGINT NOT NULL,
	  driver_id BIGINT NOT NULL,
      PRIMARY KEY (id),
      FOREIGN KEY (vehicle_id) REFERENCES vehicles (id),
	  FOREIGN KEY (driver_id) REFERENCES drivers (id)
  );

CREATE TABLE penalty_catalog
(
    id BIGINT NOT NULL,
	clause VARCHAR(2048),
	cost INT NOT NULL,
	PRIMARY KEY (id)
);

-- Таблица выписанных штрафорв
CREATE TABLE issued_penalties
(
    id BIGINT NOT NULL,
    penalty_id BIGINT NOT NULL,
    registered_vehicle_id BIGINT NOT NULL,
    date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (penalty_id) REFERENCES penalty_catalog (id),
	FOREIGN KEY (registered_vehicle_id) REFERENCES registered_vehicles (id)
);

-- Заполенение таблиц
--

-- vehicles --
INSERT INTO vehicles(id, mark, model) VALUES (0, 'Renault', 'Duster');
INSERT INTO vehicles(id, mark, model) VALUES (1, 'Chevrolet', 'Epica');
INSERT INTO vehicles(id, mark, model) VALUES (2, 'Nissan', 'Primera');
INSERT INTO vehicles(id, mark, model) VALUES (3, 'Hyundai', 'FantaFe');
INSERT INTO vehicles(id, mark, model) VALUES (4, 'Chevrolet', 'Aveo');
INSERT INTO vehicles(id, mark, model) VALUES (5, 'Hyundai', 'Accent');
INSERT INTO vehicles(id, mark, model) VALUES (6, 'Toyota', 'Allex');

-- drivers --
INSERT INTO drivers(id, full_name) VALUES (0, 'Исаков Павел Борисович');
INSERT INTO drivers(id, full_name) VALUES (1, 'Кондратьев Эдуард Данилович');
INSERT INTO drivers(id, full_name) VALUES (2, 'Таранец Бронислав Артёмович');
INSERT INTO drivers(id, full_name) VALUES (3, 'Бородай Ульяна Фёдоровна');
INSERT INTO drivers(id, full_name) VALUES (4, 'Петрик Арсений Платонович');
INSERT INTO drivers(id, full_name) VALUES (5, 'Кличко Денис Валерьевич');
INSERT INTO drivers(id, full_name) VALUES (6, 'Якушев Владлен Юхимович');
INSERT INTO drivers(id, full_name) VALUES (7, 'Быкова Дарья Юхимовна');
INSERT INTO drivers(id, full_name) VALUES (8, 'Овчинников Матвей Платонович');
INSERT INTO drivers(id, full_name) VALUES (9, 'Журавлёв Павел Максимович');
INSERT INTO drivers(id, full_name) VALUES (10, 'Галкин Орландо Богданович');
INSERT INTO drivers(id, full_name) VALUES (11, 'Соболева Жаклин Владимировна');
INSERT INTO drivers(id, full_name) VALUES (12, 'Спивак Яромир Богданович');
INSERT INTO drivers(id, full_name) VALUES (13, 'Никонов Огюст Данилович');

-- registered_vehicles --
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (0, 'в027см27', 6, 0);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (1, 'х501хх61', 3, 0);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (2, 'а145нв123', 2, 1);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (3, 'а141мк702', 0, 1);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (4, 'н399но125', 2, 1);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (5, 'р389ме152', 2, 2);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (6, 'т699нт50', 4, 2);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (7, 'в592ех716', 1, 2);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (8, 'а133хк177', 0, 2);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (9, 'н675ср161', 0, 3);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (10, 'т815ом123', 1, 3);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (11, 'н064мо68', 3, 4);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (12, 'с253рм123', 6,5);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (13, 'с590ра31', 4, 6);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (14, 'м369вр32', 0, 7);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (15, 'р304ке50', 5, 8);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (16, 'р810оо71', 4, 9);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (17, 'с656оа123', 0, 10);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (18, 'о152рс750', 4, 11);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (19, 'а513оу750', 6, 12);
INSERT INTO registered_vehicles(id, vehicles_reg_number, vehicle_id, driver_id) VALUES (20, 'в523аа193', 4, 13);

-- penalty_catalog --
INSERT INTO penalty_catalog(id, clause, cost) VALUES (0, 'Управление ТС водителем, лишенным права управления ТС', 30000);
INSERT INTO penalty_catalog(id, clause, cost) VALUES (1, 'Превышение установленной скорости движения ТС на величину более 60 километров в час', 2500);
INSERT INTO penalty_catalog(id, clause, cost) VALUES (2, 'Невыполнение требования ПДД подать сигнал перед началом движения, перестроением, поворотом, разворотом или остановкой', 500);
INSERT INTO penalty_catalog(id, clause, cost) VALUES (3, 'Нарушение правил остановки или стоянки ТС в местах, отведенных для остановки или стоянки ТС инвалидов', 5000);
INSERT INTO penalty_catalog(id, clause, cost) VALUES (4, 'Движение тяжеловесного и (или) крупногабаритного ТС с превышением габаритов, указанных в специальном разрешении', 5000);
INSERT INTO penalty_catalog(id, clause, cost) VALUES (5, 'Выезд на перекресток или пересечение проезжей части дороги в случае образовавшегося затора', 1000);
INSERT INTO penalty_catalog(id, clause, cost) VALUES (6, 'Выезд в нарушение Правил дорожного движения на полосу, предназначенную для встречного движения, при объезде препятствия либо на трамвайные пути встречного направления при объезде препятстви', 1500);
INSERT INTO penalty_catalog(id, clause, cost) VALUES (7, 'Движение во встречном направлении по дороге с односторонним движением', 5000);
INSERT INTO penalty_catalog(id, clause, cost) VALUES (8, 'Непредоставление преимущества в движении маршрутному транспортному средству, а равно транспортному средству с одновременно включенными проблесковым маячком синего цвета и специальным звуковым сигналом', 500);
INSERT INTO penalty_catalog(id, clause, cost) VALUES (9, 'Нарушение правил остановки или стоянки транспортных средств в местах, отведенных для остановки или стоянки транспортных средств инвалидов', 500);
INSERT INTO penalty_catalog(id, clause, cost) VALUES (10, 'Нарушение правил пользования внешними световыми приборами, звуковыми сигналами, аварийной сигнализацией или знаком аварийной остановки', 500);
INSERT INTO penalty_catalog(id, clause, cost) VALUES (11, 'Нарушение правил перевозки грузов, а равно правил буксировки', 500);

-- issued_penalties --
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (0,1,1,'2020-02-18 18:50:25');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (1,3,6,'2020-02-06 09:07:09');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (2,6,14,'2020-02-17 13:49:56');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (3,0,1,'2020-02-14 21:13:37');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (4,5,12,'2020-02-09 12:08:26');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (5,0,2,'2020-02-13 15:22:28');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (6,1,8,'2020-02-16 11:18:29');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (7,4,10,'2020-02-14 03:38:54');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (8,3,15,'2020-02-01 23:09:15');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (9,6,8,'2020-02-25 18:58:16');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (10,10,13,'2020-02-09 18:31:18');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (11,10,16,'2020-02-09 23:06:19');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (12,9,3,'2020-02-05 07:32:03');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (13,3,15,'2020-02-05 18:39:35');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (14,6,6,'2020-02-19 13:45:53');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (15,0,0,'2020-02-14 02:17:58');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (16,6,7,'2020-02-27 04:35:12');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (17,6,15,'2020-02-16 08:34:30');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (18,8,11,'2020-02-26 21:39:22');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (19,8,4,'2020-02-14 12:22:21');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (20,5,0,'2020-02-18 06:36:47');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (21,10,4,'2020-02-10 08:32:06');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (22,9,0,'2020-02-12 00:22:04');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (23,4,11,'2020-02-17 16:25:45');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (24,9,2,'2020-02-28 19:36:50');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (25,4,12,'2020-02-25 16:04:39');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (26,1,10,'2020-02-22 16:00:15');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (27,9,2,'2020-02-17 08:09:06');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (28,4,13,'2020-02-21 08:30:17');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (29,7,8,'2020-02-26 23:17:43');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (30,6,13,'2020-02-20 02:59:25');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (31,5,14,'2020-02-20 22:36:36');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (32,1,6,'2020-02-23 14:11:04');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (33,0,2,'2020-02-18 12:32:12');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (34,6,0,'2020-02-02 05:28:19');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (35,9,11,'2020-02-06 17:28:49');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (36,10,6,'2020-02-20 14:44:21');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (37,5,10,'2020-02-06 02:28:37');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (38,9,17,'2020-02-02 13:47:24');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (39,2,9,'2020-02-02 02:14:55');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (40,9,12,'2020-02-26 23:14:05');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (41,8,5,'2020-02-19 21:57:00');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (42,5,15,'2020-02-15 08:39:10');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (43,7,11,'2020-02-09 23:10:27');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (44,10,15,'2020-02-02 06:34:24');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (45,10,17,'2020-02-06 04:55:16');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (46,3,17,'2020-02-11 12:32:01');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (47,2,13,'2020-02-28 08:01:51');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (48,0,0,'2020-02-03 19:08:11');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (49,5,8,'2020-02-02 15:13:03');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (50,8,16,'2020-02-05 00:33:14');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (51,1,0,'2020-02-02 16:51:19');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (52,9,9,'2020-02-16 20:38:25');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (53,6,6,'2020-02-06 11:47:06');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (54,1,3,'2020-02-05 19:35:25');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (55,5,1,'2020-02-07 22:16:59');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (56,8,0,'2020-02-13 07:04:39');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (57,7,0,'2020-02-08 13:01:59');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (58,1,15,'2020-02-03 15:48:27');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (59,0,4,'2020-02-04 04:19:29');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (60,10,5,'2020-02-01 22:50:51');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (61,8,0,'2020-02-15 17:57:35');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (62,4,13,'2020-02-25 13:18:36');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (63,2,16,'2020-02-21 03:23:14');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (64,6,8,'2020-02-04 03:28:33');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (65,0,17,'2020-02-13 12:41:40');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (66,8,7,'2020-02-28 14:04:40');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (67,7,11,'2020-02-18 17:06:07');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (68,6,7,'2020-02-02 20:18:58');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (69,3,16,'2020-02-02 18:14:23');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (70,8,0,'2020-02-20 07:12:13');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (71,10,7,'2020-02-15 10:10:29');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (72,10,16,'2020-02-22 12:18:38');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (73,0,0,'2020-02-25 11:40:38');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (74,1,7,'2020-02-05 20:57:01');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (75,7,4,'2020-02-03 00:23:24');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (76,7,6,'2020-02-21 22:44:21');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (77,8,2,'2020-02-17 22:09:44');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (78,6,19,'2020-02-13 00:31:31');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (79,6,13,'2020-02-01 10:26:42');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (80,0,6,'2020-02-15 18:24:05');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (81,8,18,'2020-02-06 22:21:30');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (82,0,4,'2020-02-06 06:01:59');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (83,8,4,'2020-02-13 06:08:28');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (84,1,8,'2020-02-02 14:43:39');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (85,1,12,'2020-02-23 09:25:56');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (86,9,16,'2020-02-24 16:35:26');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (87,2,5,'2020-02-03 18:19:38');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (88,2,0,'2020-02-15 18:40:26');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (89,10,4,'2020-02-03 06:16:08');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (90,0,13,'2020-02-23 10:21:36');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (91,5,10,'2020-02-25 20:30:01');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (92,5,11,'2020-02-15 10:34:34');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (93,10,2,'2020-02-19 06:59:04');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (94,3,7,'2020-02-26 04:31:39');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (95,6,0,'2020-02-02 09:54:00');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (96,2,2,'2020-02-15 21:18:13');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (97,8,18,'2020-02-23 08:38:07');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (98,4,0,'2020-02-15 06:16:12');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (99,10,4,'2020-02-19 04:31:45');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (100,0,6,'2020-02-04 12:02:05');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (101,1,6,'2020-02-21 16:47:54');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (102,5,17,'2020-02-01 08:45:00');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (103,10,19,'2020-02-01 23:33:22');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (104,0,5,'2020-02-14 17:58:55');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (105,0,19,'2020-02-27 02:27:38');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (106,6,19,'2020-02-25 18:35:18');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (107,3,10,'2020-02-03 11:04:38');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (108,3,14,'2020-02-27 21:31:57');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (109,5,14,'2020-02-08 16:10:55');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (110,8,6,'2020-02-16 12:51:43');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (111,8,5,'2020-02-04 21:41:20');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (112,7,7,'2020-02-14 10:55:35');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (113,5,5,'2020-02-02 07:46:48');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (114,4,8,'2020-02-22 15:56:09');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (115,5,13,'2020-02-04 12:02:58');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (116,4,7,'2020-02-02 23:11:25');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (117,0,10,'2020-02-15 20:50:33');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (118,9,15,'2020-02-17 02:18:04');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (119,3,17,'2020-02-19 14:01:36');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (120,4,10,'2020-02-20 19:59:44');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (121,3,14,'2020-02-20 10:38:28');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (122,6,0,'2020-02-25 08:42:16');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (123,9,10,'2020-02-06 07:55:09');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (124,9,0,'2020-02-13 23:40:02');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (125,7,19,'2020-02-03 05:34:37');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (126,3,14,'2020-02-05 16:28:49');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (127,0,17,'2020-02-14 13:24:14');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (128,3,19,'2020-02-14 22:45:58');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (129,8,13,'2020-02-03 16:05:19');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (130,7,0,'2020-02-05 18:01:48');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (131,9,0,'2020-02-23 01:28:27');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (132,7,11,'2020-02-04 22:33:03');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (133,0,14,'2020-02-28 08:34:51');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (134,10,0,'2020-02-10 12:29:09');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (135,2,7,'2020-02-13 23:12:47');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (136,0,4,'2020-02-22 17:26:52');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (137,8,13,'2020-02-13 01:52:36');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (138,9,14,'2020-02-28 05:22:45');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (139,5,15,'2020-02-08 18:49:19');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (140,5,13,'2020-02-21 00:28:40');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (141,10,17,'2020-02-24 01:18:44');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (142,8,14,'2020-02-08 19:24:19');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (143,6,17,'2020-02-16 03:06:43');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (144,0,1,'2020-02-10 15:54:34');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (145,8,15,'2020-02-23 13:19:01');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (146,5,10,'2020-02-01 11:13:00');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (147,8,2,'2020-02-08 20:42:49');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (148,6,4,'2020-02-09 16:02:48');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (149,1,1,'2020-02-14 06:15:21');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (150,7,5,'2020-02-16 23:16:41');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (151,2,12,'2020-02-17 14:29:37');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (152,0,11,'2020-02-17 00:27:36');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (153,6,9,'2020-02-10 11:47:19');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (154,2,16,'2020-02-06 15:19:20');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (155,6,3,'2020-02-11 01:05:26');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (156,10,6,'2020-02-24 13:20:51');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (157,9,15,'2020-02-24 10:01:35');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (158,1,0,'2020-02-26 17:26:49');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (159,0,18,'2020-02-18 00:17:42');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (160,0,6,'2020-02-26 20:51:27');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (161,8,17,'2020-02-15 23:18:04');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (162,10,18,'2020-02-19 08:02:13');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (163,8,17,'2020-02-16 03:58:11');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (164,7,15,'2020-02-21 08:19:02');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (165,3,11,'2020-02-05 02:20:17');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (166,0,5,'2020-02-03 14:48:36');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (167,0,10,'2020-02-08 22:33:09');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (168,3,8,'2020-02-01 08:59:28');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (169,0,3,'2020-02-18 10:53:06');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (170,9,18,'2020-02-24 20:13:29');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (171,0,8,'2020-02-22 07:32:03');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (172,7,3,'2020-02-08 00:35:32');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (173,8,4,'2020-02-17 03:30:54');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (174,0,2,'2020-02-05 21:14:34');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (175,0,13,'2020-02-14 22:10:40');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (176,0,12,'2020-02-13 11:47:18');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (177,9,7,'2020-02-28 08:54:04');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (178,7,8,'2020-02-11 04:13:48');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (179,2,0,'2020-02-07 05:29:37');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (180,4,18,'2020-02-18 02:21:19');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (181,6,10,'2020-02-03 20:41:56');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (182,3,6,'2020-02-25 16:04:20');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (183,3,2,'2020-02-04 23:29:58');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (184,10,17,'2020-02-03 13:47:46');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (185,0,9,'2020-02-15 19:08:50');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (186,9,16,'2020-02-10 09:30:14');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (187,7,12,'2020-02-27 11:44:10');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (188,0,5,'2020-02-10 22:32:49');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (189,10,0,'2020-02-17 02:36:55');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (190,1,17,'2020-02-13 07:37:01');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (191,3,11,'2020-02-13 01:07:29');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (192,8,0,'2020-02-08 03:00:21');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (193,4,11,'2020-02-13 17:05:49');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (194,5,7,'2020-02-02 18:15:17');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (195,6,11,'2020-02-23 07:15:52');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (196,10,17,'2020-02-04 20:09:11');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (197,3,2,'2020-02-19 03:06:16');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (198,2,7,'2020-02-16 04:50:01');
INSERT INTO issued_penalties(id, penalty_id, registered_vehicle_id, date) VALUES (199,2,2,'2020-02-23 22:40:49');
--end--