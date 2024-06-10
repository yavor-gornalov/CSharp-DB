USE Bakery
GO

DECLARE @CountriesDistributros TABLE (
CountryName NVARCHAR(50)
, DisributorName NVARCHAR(25)
, Ingradients INT
)

INSERT INTO @CountriesDistributros
SELECT
	c.Name AS CountryName
	, d.Name AS DisributorName
	, COUNT (i.Id) AS Ingradients
FROM Countries AS c
LEFT JOIN Distributors AS d ON d.CountryId = c.Id
LEFT JOIN Ingredients AS i ON i.DistributorId = d.Id
GROUP BY c.Name, d.Name

SELECT
	c.Name AS CountryName
	, d.Name AS DisributorName
FROM Countries AS c
LEFT JOIN Distributors AS d ON d.CountryId = c.Id
LEFT JOIN Ingredients AS i ON i.DistributorId = d.Id
GROUP BY c.Name, d.Name
HAVING COUNT(i.Id) = (SELECT dt.MaxCount FROM (SELECT
							cd.CountryName
							, MAX(cd.Ingradients) AS MaxCount
						FROM @CountriesDistributros AS cd
						WHERE CountryName = c.Name
						GROUP BY cd.CountryName) AS dt)
ORDER BY CountryName, DisributorName