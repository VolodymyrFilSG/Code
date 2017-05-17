1.		SELECT `Abonent`, (CASE WHEN House%2 > 0 THEN 'Ліва' ELSE 'права' END) as Side 
		FROM `phone` WHERE `Street` = 'РУСЬКА'

2.		SELECT left(Abonent,1) AS Abonent, COUNT(left(Abonent,1)) as COUNTER FROM `phone` 
		WHERE `Abonent` LIKE 'К%' OR `Abonent` LIKE 'М%' OR `Abonent` LIKE 'С%' AND `Index` IS NOT NULL GROUP BY (left(Abonent,1))

3.		Select Count(abonent) as ATC22 	FROM `phone` 
		WHERE `Phone` LIKE '22%'

4. 		Select Count(abonent) as UTEL FROM `phone` 
		WHERE `Phone` LIKE '11%'

5. 		SELECT left(phone,2) AS 'ATC', COUNT(left(phone,2)) as COUNTER 
		FROM `phone` WHERE `Index` IS NOT NULL GROUP BY (left(phone,2))

6. 		SELECT `Abonent` FROM `phone` 
		WHERE LEFT(phone, 1) = RIGHT(phone, 1) OR RIGHT(LEFT(phone, 2), 1) = LEFT(RIGHT(phone, 2), 1) OR RIGHT(LEFT(phone, 3), 1) = LEFT(RIGHT(phone, 3), 1)

7. 		SELECT `Abonent`, `Phone` FROM `phone` 
		WHERE LEFT(phone, 1) + RIGHT(LEFT(phone, 2), 1) + RIGHT(LEFT(phone, 3), 1) = RIGHT(phone, 1) + LEFT(RIGHT(phone, 2), 1) + LEFT(RIGHT(phone, 3), 1)

8. 		SELECT COUNT(house) as `counter`, `Street` 
		FROM `phone` group by `Street` ORDER BY `counter` DESC LIMIT 1


		

9. 		SELECT LEFT(`Street`, 1) as LETTER, COUNT(LEFT(`Street`, 1)) as street_cnt
		FROM `phone` WHERE `Index` IS NOT NULL GROUP BY LEFT(`Street`, 1)			/*доробити*/
		/*SELECT LEFT(street,1), COUNT(*) FROM (SELECT DISTINCT street FROM phone) as t GROUP BY LEFT(street, 1)*/
		/*CREATE VIEW STREETS AS
		SELECT DISTINCT(`Street`) FROM `phone` WHERE `Street` IS NOT NULL
		SELECT LEFT(`Street`, 1) as LETTER, COUNT(LEFT(`Street`, 1)) as street_cnt FROM lab2.streets GROUP BY LEFT(`Street`, 1)
		DROP VIEW STREETS*/

10. 	SELECT `Abonent` FROM `phone` 
		WHERE `Abonent` LIKE '%ий %' OR `Abonent` LIKE '%ко %'

11.		SELECT `Abonent` FROM `phone` WHERE `Phone` % 2 = 1

12. 	SELECT `Abonent` FROM `phone` WHERE `Phone` LIKE '%13%' AND `Flat` = 13

13. 	SELECT `Abonent` FROM `phone` WHERE `Phone` like CONCAT("%", house, "%")

14.		SELECT `Abonent` FROM `phone` 
		WHERE `Phone` like CONCAT("%", house, "%") AND `Phone` like CONCAT("%", Flat, "%")

15.		CREATE TABLE `phone` (
  		`Index` int(2) DEFAULT NULL,
  		`Phone` int(6) DEFAULT NULL,
  		`Abonent` varchar(32) DEFAULT NULL,
  		`Street` varchar(20) DEFAULT NULL,
  		`House` varchar(8) DEFAULT NULL,
  		`Flat` int(3) DEFAULT NULL,
  		`G` int(1) DEFAULT NULL
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;

		INSERT INTO phone (`Index`,`Phone`,`Abonent`,`Street`,`House`,`Flat`,`G`)
  		SELECT `Index`,`Phone`,`Abonent`,`Street`,`House`,`Flat`,`G`
  		FROM lab2.phone WHERE `Abonent` like 'Ко%' and `Phone` like '%77%' and `Phone` %13 = 0

16.		SELECT `Abonent` FROM `phone` WHERE `House` = MONTH(CURRENT_TIMESTAMP) AND `Flat` = DAY(CURRENT_TIMESTAMP)
