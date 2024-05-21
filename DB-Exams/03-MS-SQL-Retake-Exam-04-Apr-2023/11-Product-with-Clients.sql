USE Accounting
GO

CREATE OR ALTER FUNCTION udf_ProductWithClients(@name NVARCHAR(35)) 
RETURNS INT
AS 
BEGIN
	RETURN
	(SELECT
		COUNT(*) AS Result
	FROM Products AS p
	JOIN ProductsClients AS pc ON pc.ProductId = p.Id
	JOIN Clients AS c ON pc.ClientId = c.Id
	WHERE p.Name = @name)
END
GO

SELECT dbo.udf_ProductWithClients('DAF FILTER HU12103X')
