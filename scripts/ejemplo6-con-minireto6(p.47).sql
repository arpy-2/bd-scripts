use minireto6;
DELIMITER $$
DROP PROCEDURE IF EXISTS actualizarPrecio$$
CREATE PROCEDURE actualizarPrecio(IN p_idproducto VARCHAR(6))
BEGIN
    DECLARE precio_actual DECIMAL(9, 2);
    DECLARE nuevo_precio DECIMAL(9, 2);

    -- Obtener el precio actual del producto
    SELECT precio INTO precio_actual FROM productos WHERE idproducto = p_idproducto;

    -- Aplicar las condiciones
    IF precio_actual < 50 THEN
        SET nuevo_precio = precio_actual * 1.10; -- Incrementar en un 10%
    ELSEIF precio_actual >= 50 AND precio_actual < 100 THEN
        SET nuevo_precio = precio_actual * 1.05; -- Incrementar en un 5%
    ELSE
        SET nuevo_precio = precio_actual * 0.95; -- Decrementar en un 5%
    END IF;

    -- Actualizar el precio del producto
    UPDATE productos SET precio = nuevo_precio WHERE idproducto = p_idproducto;
END $$
DELIMITER ;
CALL actualizarPrecio(41001);
