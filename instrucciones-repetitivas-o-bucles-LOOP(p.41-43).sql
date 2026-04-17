-- Ejemplo 1:
DELIMITER $$
DROP PROCEDURE IF EXISTS contador$$
CREATE PROCEDURE contador(p1 INT)
BEGIN
    bucle1: LOOP
        SET p1 = p1 + 1;
        IF p1 < 10 THEN
            ITERATE bucle1;
        END IF;
        LEAVE bucle1;
    END LOOP bucle1;
    SET @x = p1;
END $$

DELIMITER ;
CALL contador(0);
SELECT @x;

-- Ejemplo 2 (sumatorio):
DELIMITER $$
DROP PROCEDURE IF EXISTS ejemplo_bucle$$
CREATE PROCEDURE ejemplo_bucle(IN tope INT, OUT suma INT)
BEGIN
    DECLARE contador INT;
    SET contador = 0;
    SET suma = 0;

    bucleSumatorio: LOOP
        IF contador > tope THEN
            LEAVE bucleSumatorio;
        END IF;

        SET suma = suma + contador;
        SET contador = contador +1;
    END LOOP;
END
$$
DELIMITER ;
CALL ejemplo_bucle(10, @suma);
SELECT @suma;

-- Ejemplo 3 (sumatorio):
DELIMITER $$
DROP PROCEDURE IF EXISTS ejemplo_bucle$$
CREATE PROCEDURE ejemplo_bucle(IN tope INT, OUT suma INT)
BEGIN
    DECLARE contador INT;
    SET contador = 0;
    SET suma = 0;

    bucleSumatorio: LOOP
        IF contador < tope THEN
            SET contador = contador +1;
            SET suma = suma + contador;
            ITERATE bucleSumatorio;
        END IF;
        LEAVE bucleSumatorio;
    END LOOP;
END
$$

DELIMITER ;
CALL ejemplo_bucle(10, @suma);
SELECT @suma;
