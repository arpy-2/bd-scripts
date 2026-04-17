-- Solución con SET
use minireto6;
DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_max_min_media$$
CREATE PROCEDURE calcular_max_min_media(IN idfab VARCHAR(3), OUT maximo DECIMAL(15,2), OUT minimo DECIMAL(15,2), OUT media DECIMAL(15,2))
BEGIN
    SET maximo = (SELECT MAX(precio) FROM productos WHERE productos.idfab = idfab);
    SET minimo = (SELECT MIN(precio) FROM productos WHERE productos.idfab = idfab);
    SET media = (SELECT AVG(precio) FROM productos WHERE productos.idfab = idfab);
END
$$

DELIMITER ;
CALL calcular_max_min_media('bic', @maximo, @minimo, @media);
SELECT @maximo, @minimo, @media;

-- Solución con SELECT ... INTO
use minireto6;
DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_max_min_media$$
CREATE PROCEDURE calcular_max_min_media(IN idfab VARCHAR(3), OUT maximo DECIMAL(15,2), OUT minimo DECIMAL(15,2), OUT media DECIMAL(15,2))
BEGIN
    SELECT MAX(precio), MIN(precio), AVG(precio)
    FROM productos
    WHERE productos.idfab = idfab
    INTO maximo, minimo, media;
END
$$

DELIMITER ;
CALL calcular_max_min_media('bic', @maximo, @minimo, @media);
SELECT @maximo, @minimo, @media;