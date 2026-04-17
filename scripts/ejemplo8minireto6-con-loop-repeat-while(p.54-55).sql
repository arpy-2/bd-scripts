-- LOOP (p.54)
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarValoresTablaMultiplicarLoop$$
CREATE PROCEDURE insertarValoresTablaMultiplicarLoop(IN p_numero INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    bucle: LOOP
        IF contador > 9 THEN
            LEAVE bucle;
        END IF;
        INSERT INTO tablaPrueba VALUES(p_numero*contador);
        SET contador= contador +1;
    END LOOP;
END $$
DELIMITER ;
CALL insertarValoresTablaMultiplicarLoop(6);

-- REPEAT (p.55)
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarValoresTablaMultiplicarRepeat$$
CREATE PROCEDURE insertarValoresTablaMultiplicarRepeat(IN p_numero INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    REPEAT
        INSERT INTO tablaPrueba VALUES(p_numero*contador);
        SET contador= contador +1;
    UNTIL contador > 9
    END REPEAT;
END $$
DELIMITER ;
CALL insertarValoresTablaMultiplicarRepeat(6);

-- WHILE (p.55)
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarValoresTablaMultiplicarWhile$$
CREATE PROCEDURE insertarValoresTablaMultiplicarWhile(IN p_numero INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    WHILE contador <= 9 DO
        INSERT INTO tablaPrueba VALUES(p_numero*contador);
        SET contador= contador +1;
    END WHILE;
END $$
DELIMITER ;
CALL insertarValoresTablaMultiplicarWhile(6);
