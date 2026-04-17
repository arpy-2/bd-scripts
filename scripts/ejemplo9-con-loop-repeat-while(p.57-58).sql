-- LOOP (p.57)
DELIMITER $$
DROP FUNCTION IF EXISTS sumatorio2Num$$
CREATE FUNCTION sumatorio2Num(n1 INT, n2 INT)
RETURNS INT
DETERMINISTIC CONTAINS SQL
BEGIN
    DECLARE total INT;
    DECLARE contador INT;
    SET total = 0;
    SET contador = 0;
    bucle1: LOOP
        IF contador < n2 THEN
            SET total = total + n1;
            SET contador = contador + 1;
            ITERATE bucle1;
        END IF;
        LEAVE bucle1;
    END LOOP bucle1;
    RETURN total;
END
$$

DELIMITER ;
SELECT sumatorio2Num(2,4);

-- REPEAT (p.58)
DELIMITER $$
DROP FUNCTION IF EXISTS sumatorio2Num$$
CREATE FUNCTION sumatorio2Num(n1 INT, n2 INT)
RETURNS INT
DETERMINISTIC CONTAINS SQL
BEGIN
    DECLARE total INT;
    DECLARE contador INT;
    SET total = 0;
    SET contador = 0;
    REPEAT
        SET total = total + n1;
        SET contador = contador +1;
    UNTIL contador >=n2
    END REPEAT;
    RETURN total;
END
$$
DELIMITER ;
SELECT sumatorio2Num(2,4);

-- WHILE (p.58)
DELIMITER $$
DROP FUNCTION IF EXISTS sumatorio2Num$$
CREATE FUNCTION sumatorio2Num(n1 INT, n2 INT)
RETURNS INT
DETERMINISTIC CONTAINS SQL
BEGIN
    DECLARE total INT;
    DECLARE contador INT;
    SET total = 0;
    SET contador = 0;
    WHILE contador < n2 DO
        SET total = total + n1;
        SET contador = contador +1;
    END WHILE;
    RETURN total;
END
$$
DELIMITER ;
SELECT sumatorio2Num(2,4);
