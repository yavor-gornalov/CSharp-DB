USE Geography
GO

SELECT
	p.PeakName AS [PeakName]
	,m.MountainRange AS [Mountain]
	,p.Elevation AS [Elevation]
FROM Peaks AS p
LEFT JOIN Mountains AS m ON p.MountainId = m.Id
ORDER BY Elevation DESC, PeakName
