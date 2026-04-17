-- Ejemplo 1: 
DELIMITER $$
DROP PROCEDURE IF EXISTS ejemplo_bucle_while$$
CREATE PROCEDURE ejemplo_bucle_while(IN tope INT, OUT suma INT)
BEGIN
    DECLARE contador INT;
    SET contador = 1;
    SET suma = 0;

    WHILE contador <= tope DO
        SET suma = suma + contador;
        SET contador = contador + 1;
    END WHILE;

END
$$

DELIMITER ;
CALL ejemplo_bucle_while(10, @suma);
SELECT @suma;
