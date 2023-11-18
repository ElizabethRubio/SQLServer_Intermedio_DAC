/* --------------------------------------------------------------------------------------------
							Sección práctica (10 puntos – 5 puntos cada pregunta)
										Base de datos Northwind
*/ --------------------------------------------------------------------------------------------

USE Northwind
GO

/*-------------------------- 
Pregunta 1: Usted como analista logístico, cree un Stored Procedure que permita validar la cantidad de
ítems en el inventario de productos de la base de datos Northwind. Este debe actualizar el
valor cada vez que se añaden pedidos. Pegue el código para 5 pedidos cualesquiera (invéntelo)
y pegue el paso a paso de cómo van cambiando los valores de la columna de UnitsInStock
*/--------------------------

SELECT *
FROM Products

CREATE PROCEDURE ActualizarInventarios1
	@ProductId INT,
	@IngresodeStock INT
as
BEGIN
	
	IF EXISTS (SELECT * FROM Products WHERE ProductID = @ProductId)
	BEGIN
		UPDATE Products
		SET UnitsInStock = UnitsInStock + @IngresodeStock
		WHERE ProductID = @ProductId;
		PRINT CONCAT('Se actualizó exitosamente el stock de: ' , @ProductID,' añadiendo: ', @IngresodeStock,' unidades al stock.')
	END
	ELSE 
	BEGIN
		PRINT CONCAT('El producto con ID: ' , @ProductID,' no existe en la base de datos.')
	END
END

SELECT *
FROM Products

EXEC ActualizarInventarios1 80, 20 --- No existe el producto
EXEC ActualizarInventarios1 1, 10
EXEC ActualizarInventarios1 2, 15
EXEC ActualizarInventarios1 3, 20
EXEC ActualizarInventarios1 4, 30