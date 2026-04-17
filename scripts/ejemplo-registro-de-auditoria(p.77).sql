DELIMITER $$
DROP TRIGGER IF EXISTS trigger_after_update_alumnos$$
CREATE TRIGGER trigger_after_update_alumnos
AFTER UPDATE ON alumnos FOR EACH ROW
BEGIN
    IF OLD.nota != NEW.nota THEN
        INSERT INTO log_cambios_nota (id_alumno, nota_anterior, nota_nueva)
        VALUES (NEW.id, OLD.nota, NEW.nota);
    END IF;
END$$

UPDATE alumnos SET nota = 5 WHERE id = 1;
UPDATE alumnos SET nota = 7 WHERE id = 1;
SELECT * FROM log_cambios_nota;