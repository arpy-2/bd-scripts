DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE alumnos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido1 VARCHAR(50) NOT NULL,
apellido2 VARCHAR(50),
nota DECIMAL(4,2));

DELIMITER $$

DROP TRIGGER IF EXISTS trigger_check_nota_before_insert$$
CREATE TRIGGER trigger_check_nota_before_insert
BEFORE INSERT ON alumnos FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END
$$

DELIMITER $$
DROP TRIGGER IF EXISTS trigger_check_nota_before_update$$
CREATE TRIGGER trigger_check_nota_before_update
BEFORE UPDATE ON alumnos FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END
$$
DELIMITER ;

INSERT INTO alumnos VALUES(1, 'Raúl', 'García', 'García', -1);
INSERT INTO alumnos VALUES(2, 'Rocío', 'López', 'López', 11);
INSERT INTO alumnos VALUES(3, 'Sergio', 'Pérez', 'Pérez', 7.5);

SELECT * FROM alumnos;

UPDATE alumnos SET nota = 20 WHERE id = 1;
UPDATE alumnos SET nota = 8.5 WHERE id = 2;
UPDATE alumnos SET nota = -3 WHERE id = 3;

SELECT * FROM alumnos;


