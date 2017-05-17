1.		CREATE VIEW Adress AS
		SELECT	Left(Abonent, INSTR(Abonent, ' ') - 1) as Прізвище,
		CONCAT(LEFT(SUBSTRING_INDEX(Abonent, ' ', -2), 1),'. ', LEFT(SUBSTRING_INDEX(Abonent, ' ', -1), 1),'.' ) as Ініціали,
		CONCAT('вул. ', Street, ', буд. ', House, ' кв.', Flat) as Адреса
		FROM phone WHERE Abonent IS NOT NULL