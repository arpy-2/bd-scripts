CREATE TABLE log_alumnos (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(20),
    nombre VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
DROP TRIGGER IF EXISTS trigger_after_insert_alumnos$$
CREATE TRIGGER trigger_after_insert_alumnos
AFTER INSERT ON alumnos FOR EACH ROW
BEGIN
    INSERT INTO log_alumnos (accion, nombre)
    VALUES ('INSERT', NEW.nombre);
END$$

DELIMITER ;
INSERT INTO alumnos VALUES(4, 'Silvia', 'Robles', 'Robles', -6);
INSERT INTO alumnos VALUES(5, 'Sara', 'Gimenez', 'Gimenez', 15);
INSERT INTO alumnos VALUES(6, 'Rafa', 'Ruiz', 'Ruiz', 7.5);

SELECT * FROM log_alumnos;
