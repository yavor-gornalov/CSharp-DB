USE NationalTouristSitesOfBulgaria
GO

SELECT
	l.Province
	, l.Municipality
	, l.Name AS Location
	, COUNT(s.Id) AS CountOfSites
FROM Sites AS s
JOIN Locations AS l ON s.LocationId = l.Id
WHERE l.Province = 'Sofia'
GROUP BY l.Province, l.Municipality, l.Name
ORDER BY CountOfSites DESC, Location
