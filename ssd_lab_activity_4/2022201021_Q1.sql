USE CUSTOMER_DB;

DELIMITER $$

CREATE PROCEDURE AddNum(
	IN a INT,
	IN b INT,
	OUT sum INT
)
BEGIN
	SET sum = a + b;
END$$

DELIMITER ;

SET @a = 1;
SET @b = 3;
SET @sum = 0;
CALL AddNum(@a, @b, @sum);
SELECT @sum;