USE Geography;
GO

SELECT
	mc.CountryCode
	,m.MountainRange
	,p.PeakName
	,p.Elevation
FROM Peaks AS p
JOIN Mountains AS m ON p.MountainId = m.Id
JOIN MountainsCountries AS mc ON m.Id = mc.MountainId AND mc.CountryCode = 'BG'
WHERE p.Elevation > 2835
ORDER BY p.Elevation DESC;
