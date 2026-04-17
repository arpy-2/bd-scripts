use minireto6;
DELIMITER $$
DROP PROCEDURE IF EXISTS listar_productos$$
CREATE PROCEDURE listar_productos(IN idfab VARCHAR(3))
BEGIN
    SELECT *
    FROM productos
    WHERE productos.idfab = idfab;
END
$$

DELIMITER ;
CALL listar_productos('bic');