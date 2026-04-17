-- REPEAT
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarValoresBucleRepeat$$
CREATE PROCEDURE insertarValoresBucleRepeat(IN p_limite INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    REPEAT
        INSERT INTO tablaPrueba VALUES(contador);
        SET contador= contador +1;
    UNTIL contador > p_limite
    END REPEAT;
END $$
DELIMITER ;
CALL insertarValoresBucleRepeat(6);

-- WHILE
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarValoresBucleWhile$$
CREATE PROCEDURE insertarValoresBucleWhile(IN p_limite INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    WHILE contador <= p_limite DO
        INSERT INTO tablaPrueba VALUES(contador);
        SET contador= contador +1;
    END WHILE;
END $$
DELIMITER ;
CALL insertarValoresBucleWhile(6);
