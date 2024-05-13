USE Geography;
GO

SELECT DISTINCT TOP 5
	dt.CountryName AS [Country]
	,COALESCE(dt.PeakName, '(no highest peak)') AS [Highest Peak Name]
	,COALESCE(dt.Elevation, 0) AS [Highest Peak Elevation]
	,COALESCE(dt.MountainRange, '(no mountain)') AS [Mountain]
FROM Countries AS ct,
	(SELECT
		c.CountryName
		,p.PeakName
		,p.Elevation
		,m.MountainRange
		,DENSE_RANK() OVER (PARTITION BY c.CountryName  ORDER BY p.Elevation DESC) AS CountryRank
	FROM Countries AS c
	LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
	LEFT JOIN Mountains AS m ON mc.MountainId = m.Id
	LEFT JOIN Peaks AS p ON m.Id = p.MountainId) AS dt
WHERE dt.CountryRank = 1;
