use minireto6;
DELIMITER $$
DROP FUNCTION IF EXISTS contar_productos$$
CREATE FUNCTION contar_productos(f_idfabricante VARCHAR(3))
	RETURNS INT
DETERMINISTIC CONTAINS SQL READS SQL DATA
BEGIN
    DECLARE total INT;
    SET total = (SELECT COUNT(*) 
                 FROM productos 
                 WHERE productos.idfab = idfab);
    RETURN total;
END $$

DELIMITER ;
SELECT contar_productos('bic');