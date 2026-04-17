use minireto6;
DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_producto$$
CREATE PROCEDURE insertar_producto(IN p_idfabricante VARCHAR(3),IN p_idproducto VARCHAR(6),IN p_descripcion VARCHAR(100),
    IN p_precio DECIMAL(9, 2),IN p_existencias INT)
BEGIN
    INSERT INTO productos (idfab, idproducto, descripcion, precio, existencias)
    VALUES (p_idfabricante, p_idproducto, p_descripcion, p_precio, p_existencias);
END $$

DELIMITER ;
CALL insertar_producto('pru', '42342', 'Producto de prueba', 10.99, 50);
SELECT * FROM productos;
