USE Geography
GO

SELECT
	p.PeakName AS [PeakName]
	,m.MountainRange AS [Mountain]
	,c.CountryName AS [CountryName]
	,ct.ContinentName [ContinentName]
FROM Peaks AS p
JOIN Mountains AS m ON p.MountainId = m.Id
JOIN MountainsCountries AS mc ON m.Id =mc.MountainId
JOIN Countries AS c ON mc.CountryCode = c.CountryCode
JOIN Continents AS ct ON c.ContinentCode = ct.ContinentCode
ORDER BY PeakName, CountryName
