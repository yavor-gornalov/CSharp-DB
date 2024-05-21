USE Accounting
GO

SELECT
	c.Name AS Client
	, CAST(AVG(p.Price) AS INT)AS "Average Price"
FROM Clients AS c
JOIN ProductsClients AS pc ON pc.ClientId = c.Id
JOIN Products AS p ON pc.ProductId = p.Id
JOIN Vendors AS v ON p.VendorId = v.Id
WHERE v.NumberVAT LIKE '%FR%'
GROUP BY c.Name, v.NumberVAT
ORDER BY "Average Price", Client DESC
