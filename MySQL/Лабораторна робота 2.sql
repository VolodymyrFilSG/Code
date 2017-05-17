1.
2.
3.
4.
5.
6. 
7. Select Count(abonent) FROM `phone` WHERE `Phone` LIKE '22%'
8. Select Count(abonent) FROM `phone` WHERE `Phone` LIKE '43%'
9. SELECT `Phone`, `Street`, `House` FROM `phone` WHERE 'abonent' LIKE '%аптека%'
10. SELECT `Phone` FROM `phone` WHERE 'abonent' LIKE '%Педагог%'
11.	SELECT left(phone,2) AS 'ATC', COUNT(left(phone,2)) FROM `phone` GROUP BY (left(phone,2))
12. 
13. SELECT `Abonent` FROM `phone` WHERE LEFT(phone, 1) = RIGHT(phone, 1) OR RIGHT(LEFT(phone, 2), 1) = LEFT(RIGHT(phone, 2), 1) OR RIGHT(LEFT(phone, 3), 1) = LEFT(RIGHT(phone, 3), 1)
14. SELECT `Abonent`, `Phone` FROM `phone` 
	WHERE LEFT(phone, 1) + RIGHT(LEFT(phone, 2), 1) + RIGHT(LEFT(phone, 3), 1) = RIGHT(phone, 1) + LEFT(RIGHT(phone, 2), 1) + LEFT(RIGHT(phone, 3), 1)
15.	SELECT COUNT(house) as `counter`, `Street` FROM `phone` group by `Street` ORDER BY `counter` DESC 	/*доробити*/
16.
17.
18.
19.
20.
21.
22. SELECT Count(flat) FROM `phone` WHERE `Phone` != 0 AND `Street` LIKE 'КИЇВСЬКА' AND `House` LIKE '9'
23.	SELECT `Abonent` FROM `phone` WHERE `Phone` LIKE '%13%' AND `Flat` = 13
24.
25.
26.
27.
28. SELECT Count(abonent) FROM 'phone' WHERE 'phone' LIKE "%1103" /*моя дата народження 11.03.1997*/