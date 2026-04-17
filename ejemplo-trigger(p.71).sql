DELIMITER $$
DROP TRIGGER IF EXISTS trigger_update_nota$$
CREATE TRIGGER trigger_update_nota
BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
    -- Limitar entre 0 y 10
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;

    -- Truncar si es mayor que 3
    IF NEW.nota > 3 THEN
        SET NEW.nota = TRUNCATE(NEW.nota, 1);
    END IF;
END$$

DELIMITER ;
UPDATE alumnos SET nota = 7.89 WHERE id = 3;
UPDATE alumnos SET nota = 2.89 WHERE id = 2;

SELECT * FROM alumnos;

