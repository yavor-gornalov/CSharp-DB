USE Accounting
GO

SELECT
	c.Name AS Client
	, CAST(AVG(p.Price) AS INT) AS "Average Price"
FROM Clients AS c
JOIN ProductsClients AS pc ON pc.ClientId = c.Id
JOIN Products AS p ON pc.ProductId = p.Id AND p.VendorId IN (SELECT Id FROM Vendors WHERE NumberVAT LIKE '%FR%')
GROUP BY c.Name
ORDER BY "Average Price", Client DESC
