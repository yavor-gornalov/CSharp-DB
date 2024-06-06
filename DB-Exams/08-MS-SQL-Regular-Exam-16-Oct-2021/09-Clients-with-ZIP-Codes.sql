USE CigarShop
GO

SELECT
	CONCAT(c.FirstName, ' ', c.LastName) AS FullName
	, a.Country
	, a.ZIP 
	, CONCAT('$', MAX(g.PriceForSingleCigar)) AS CigarPrice 

FROM Clients AS c
JOIN Addresses AS a ON c.AddressId = a.Id
JOIN ClientsCigars AS cg ON cg.ClientId = c.Id
JOIN Cigars AS g ON cg.CigarId = g.Id
WHERE ISNUMERIC(a.ZIP) = 1
GROUP BY c.FirstName, c.LastName, a.Country, a.ZIP
ORDER BY FullName
