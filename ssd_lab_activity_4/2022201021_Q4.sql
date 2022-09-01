USE CUSTOMER_DB;

DELIMITER $$
CREATE PROCEDURE getDetails()
BEGIN
	DECLARE finished INTEGER DEFAULT 0;

	DECLARE cust_namee varchar(40);
	DECLARE cust_cityy varchar(35);
	DECLARE cust_countryy varchar(20);
	DECLARE gradee decimal(12, 2);

	DECLARE cur CURSOR FOR
	SELECT CUST_NAME, CUST_CITY, CUST_COUNTRY, GRADE FROM customer
	WHERE AGENT_CODE LIKE 'A00%';

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

	CREATE TABLE temp(
		 t_cust_namee varchar(40),
		 t_cust_cityy varchar(35),
		 t_cust_countryy varchar(20),
		 t_gradee decimal(12, 2)
	);

	OPEN cur;

	getCurCust: LOOP
		FETCH cur INTO cust_namee, cust_cityy, cust_countryy, gradee;
		IF finished = 1 THEN 
			LEAVE getCurCust;
		END IF;
		INSERT INTO temp VALUES (cust_namee, cust_cityy, cust_countryy, gradee);
	END LOOP getCurCust;

	-- SELECT cust_namee, cust_cityy, cust_countryy, gradee;
	CLOSE cur;

	SELECT * FROM temp;


END$$
DELIMITER ;


CALL getDetails();

