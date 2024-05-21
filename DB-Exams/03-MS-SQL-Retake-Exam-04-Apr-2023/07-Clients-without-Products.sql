USE Accounting
GO

SELECT
	c.Id
	,c.Name
	,CONCAT_WS(', ', CONCAT(a.StreetName, ' ', a.StreetNumber), a.City, a.PostCode, ct.Name) AS Address
FROM Clients AS c
LEFT JOIN ProductsClients AS pc ON pc.ClientId = c.Id
JOIN Addresses AS a ON c.AddressId = a.Id
JOIN Countries AS ct ON ct.Id = a.CountryId
WHERE pc.ProductId IS NULL
ORDER BY c.Name
