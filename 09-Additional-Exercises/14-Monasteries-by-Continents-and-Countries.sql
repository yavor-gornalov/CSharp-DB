USE Geography
GO

UPDATE Countries
SET CountryName = 'Burma'
WHERE CountryName = 'Myanmar'

INSERT INTO Monasteries
	(Name, CountryCode) 
VALUES
	('Hanga Abbey', (SELECT CountryCode FROM Countries WHERE CountryName = 'Tanzania'))

INSERT INTO Monasteries 
	(Name, CountryCode)
VALUES
	('Myin-Tin-Daik', (SELECT CountryCode FROM Countries WHERE CountryName = 'Myanmar'))

SELECT 
	ct.ContinentName
	,c.CountryName
	,COUNT(m.Name) AS MonasteriesCount
FROM Continents AS ct
LEFT JOIN Countries AS c ON ct.ContinentCode = c.ContinentCode
LEFT JOIN Monasteries AS m ON m.CountryCode = c.CountryCode
WHERE c.IsDeleted = 0
GROUP BY ct.ContinentName, c.CountryName
ORDER BY MonasteriesCount DESC, CountryName
