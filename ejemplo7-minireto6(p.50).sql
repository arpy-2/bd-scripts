CREATE TABLE tablaPrueba(id INT PRIMARY KEY);
DELIMITER $$
DROP PROCEDURE IF EXISTS insertarValoresBucle$$
CREATE PROCEDURE insertarValoresBucle(IN p_limite INT)
BEGIN
    DECLARE contador INT;

    SET contador = 1;
    bucle: LOOP
        IF contador > p_limite THEN
            LEAVE bucle;
        END IF;
        INSERT INTO tablaPrueba VALUES(contador);
        SET contador= contador +1;
    END LOOP;
END $$
DELIMITER ;
CALL insertarValoresBucle(6);
