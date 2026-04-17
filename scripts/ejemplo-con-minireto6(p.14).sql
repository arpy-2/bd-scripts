-- 1
use minireto6;
DELIMITER $$
DROP PROCEDURE IF EXISTS contar_productos$$
CREATE PROCEDURE contar_productos (IN idfab VARCHAR(3), OUT total INT) CREATE PROCEDURE contar_productos (IN idfab VARCHAR(3), OUT total INT)
BEGIN
	SET total = (
		SELECT COUNT(*)
		FROM productos
		WHERE productos.idfab = idfab);
END
$$

DELIMITER ;
CALL contar_productos ('bic', @total);
SELECT @total;

-- 2
use minireto6;
DELIMITER $$
DROP PROCEDURE IF EXISTS contar_productos$$
CREATE PROCEDURE contar_productos (IN idfab VARCHAR(3), OUT total INT) CREATE PROCEDURE contar_productos (IN idfab VARCHAR(3), OUT total INT)
BEGIN
	SELECT COUNT(*)
    INTO total
	FROM productos
	WHERE productos.idfab = idfab;
END
$$

DELIMITER ;
CALL contar_productos ('bic', @total);
SELECT @total;