	CREATE TABLE `lab2`.`Microdistrict` ( `Index` INT NOT NULL AUTO_INCREMENT , `Microdistrict` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL , PRIMARY KEY (`Index`)) ENGINE = InnoDB;
	INSERT INTO `microdistrict`(`Microdistrict`) VALUES ('Східний'), ('Дружба'), ('Центр'), ('Сонячний'), ('Аляска'), ('Новий світ')
	ALTER TABLE lab2.phone ADD District_index int(3) DEFAULT NULL

	UPDATE `phone` Set `District_index` = 1 where Street = 'М.ВЕРБИЦЬКОГО' or Street = 'ПРОСПЕКТ С.БАНДЕРИ'
	UPDATE `phone` Set `District_index` = 2 where Street = 'БРАТІВ ГЖИЦЬКИХ' or Street = 'ГЛИБОКА ДОЛИНА' or Street = 'ГРАБОВСЬКОГО' or Street = 'КАРПЕНКА' or Street = 'ЛІСОВА' or Street = 'ЛУЧАКІВСЬКОГО' or Street = 'МАКАРЕНКА' or Street = 'НАДЗБРУЧАНСЬКА' or Street = 'ПЕТРИКІВСЬКА' or Street = 'ПРОСВІТИ' or Street = 'С.БУДНОГО' or Street = 'ТРОЛЕЙБУСНА'
	UPDATE `phone` Set `District_index` = 3 where Street = 'І.ФРАНКА' or Street = 'ГЕТЬМАНА САГАЙДАЧНОГ' or Street = 'ЖИВОВА' or Street = 'ЗАМКОВА' or Street = 'ЗБАРАЗЬКА' or Street = 'ЗЕЛЕНА' or Street = 'КНЯЗЯ ОСТРОЗЬКОГО' or Street = 'ЛИСТОПАДОВА' or Street = 'ОЛЕНИ КУЛЬЧИЦЬКОЇ' or Street = 'РУСЬКА' or Street = 'ТАНЦОРОВА' or Street = 'ШПИТАЛЬНА'
	UPDATE `phone` Set `District_index` = 4 where Street = '15 КВІТНЯ' or Street = 'БРАТІВ БОЙЧУКІВ'  or Street = 'БУЛЬВАР С.ПЕТЛЮРИ' or Street = 'ВАЛОВА' or Street = 'ГЕНЕРАЛА ТАРНАВСЬКОГ' or Street = 'КИЇВСЬКА' or Street = 'КОРОЛЬОВА' or Street = 'ПРОСПЕКТ ЗЛУКИ' or Street = 'ПУШКІНА' or Street = 'РОМАНА КУПЧИНСЬКОГО'
	UPDATE `phone` Set `District_index` = 5 where Street = 'ЛЕСЯ КУРБАСА' or Street = 'БУЛЬВАР П.КУЛІША'
	UPDATE `phone` Set `District_index` = 6 where Street = 'БІЛЕЦЬКА' or Street = 'БРОВАРНА' or Street = 'ЗА РУДКОЮ'
	ALTER TABLE `phone` ADD INDEX(`District_index`);

1/
SELECT microdistrict, Counter from street_count_temp
where Counter = (SELECT MAX(Counter) from street_count_temp)
UNION
SELECT microdistrict, Counter from street_count_temp
where Counter = (SELECT MIN(Counter) from street_count_temp);


	3. SELECT microdistrict.Microdistrict as name,
Count(DISTINCT(phone.House)) as Counter FROM microdistrict as microdistrict
Left JOIN `phone` as phone on microdistrict.Index = phone.District_index and phone.House % 2 = 0
Where microdistrict.index = 1
Group By microdistrict.Microdistrict

4.	SELECT microdistrict.Microdistrict AS microdistrict, Count(phone.Abonent) as Counter FROM microdistrict as microdistrict Left JOIN `phone` as phone on microdistrict.Index = phone.District_index Where microdistrict.index = 2 Group By microdistrict.Microdistrict
SELECT COUNT(`Abonent`) as counter FROM `phone` WHERE `District_index` = 2

5. SELECT microdistrict.Microdistrict as microdistrict, Count(phone.Abonent) as Counter FROM microdistrict as microdistrict Left JOIN `phone` as phone on microdistrict.Index = phone.District_index Group By microdistrict.Microdistrict
