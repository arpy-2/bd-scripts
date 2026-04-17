DELIMITER $$
DROP TRIGGER IF EXISTS trigger_after_update_alumnos$$
CREATE TRIGGER trigger_after_update_alumnos
AFTER UPDATE ON alumnos FOR EACH ROW
BEGIN
    INSERT INTO log_alumnos (accion, nombre)
    VALUES ('UPDATE', NEW.nombre);
END$$

DELIMITER ;
INSERT INTO alumnos VALUES(1, 'Raúl', 'García', 'García', -1);
INSERT INTO alumnos VALUES(2, 'Rocío', 'López', 'López', 11);
INSERT INTO alumnos VALUES(3, 'Sergio', 'Pérez', 'Pérez', 7.5);
INSERT INTO alumnos VALUES(4, 'Silvia', 'Robles', 'Robles', 6);
INSERT INTO alumnos VALUES(5, 'Sara', 'Gimenez', 'Gimenez', 15);
INSERT INTO alumnos VALUES(6, 'Rafa', 'Ruiz', 'Ruiz', 7.5);

UPDATE alumnos SET nombre = 'Sofía' WHERE nombre LIKE 'Sara';
DELETE FROM alumnos WHERE nombre LIKE 'Sofía';

DELIMITER $$
DROP TRIGGER IF EXISTS trigger_after_delete_alumnos$$
CREATE TRIGGER trigger_after_delete_alumnos
AFTER DELETE ON alumnos FOR EACH ROW
BEGIN
    INSERT INTO log_alumnos (accion, nombre)
    VALUES ('DELETE', old.nombre);
END$$
