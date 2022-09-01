USE CUSTOMER_DB;

DELIMITER $$

CREATE PROCEDURE GetNames(
	IN city_name varchar (40)
)
BEGIN
	SELECT CUST_NAME
	FROM customer
	WHERE WORKING_AREA = city_name;
END$$

DELIMITER ;

CALL GetNames('Bangalore');

