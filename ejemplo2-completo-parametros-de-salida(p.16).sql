-- Solucion 1. Utilizando SET
DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_max_min_media$$ 
CREATE PROCEDURE calcular_max_min_media(
	IN gama VARCHAR(50),
		OUT maximo DECIMAL(15, 2), 
	OUT minimo DECIMAL(15, 2),
		OUT media DECIMAL(15, 2)
)
BEGIN
	SET maximo = (
		SELECT MAX(precio_venta)
		FROM producto
			WHERE producto.gama = gama);

	SET minimo = (
	SELECT MIN(precio_venta)
	FROM producto
		WHERE producto.gama = gama);

	SET media = (
		SELECT AVG(precio_venta)
		FROM producto
			WHERE producto.gama = gama);
END
$$

DELIMITER ;
CALL calcular_max_min_media('Herramientas', @maximo, @minimo, @media); 
SELECT @maximo, @minimo, @media;

-- Solucion 2. Utilizando SELECT ... INTO
DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_max_min_media$$ 
CREATE PROCEDURE calcular_max_min_media(
	IN gama VARCHAR(50),
		OUT maximo DECIMAL(15, 2), 
	OUT minimo DECIMAL(15, 2),
		OUT media DECIMAL(15, 2)
)
BEGIN
	SELECT 
		MAX(precio_venta),
		MIN(precio_venta),
        AVG(precio_venta)
		FROM producto
	WHERE producto.gama = gama
		INTO maximo, minimo, media;
END
$$

DELIMITER ;
CALL calcular_max_min_media('Herramientas', @maximo, @minimo, @media); 
SELECT @maximo, @minimo, @media;