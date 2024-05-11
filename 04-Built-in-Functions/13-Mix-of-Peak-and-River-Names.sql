USE Geography;
GO

--VARIANT 1:
SELECT
	p.PeakName
	,r.RiverName
	,LOWER(p.PeakName) + RIGHT(LOWER(r.RiverName), LEN(r.Rivername) -1) AS [Mix]
FROM Peaks AS p 
JOIN Rivers AS r 
ON RIGHT(LOWER(p.PeakName), 1) = LEFT(LOWER(r.RiverName), 1)
ORDER BY Mix;

--VARIANT 2:
SELECT
	p.PeakName
	,r.RiverName
	,LOWER(p.PeakName) + RIGHT(LOWER(r.RiverName), LEN(r.Rivername) -1) AS [Mix]
FROM Peaks AS p, Rivers AS r 
WHERE RIGHT(LOWER(p.PeakName), 1) = LEFT(LOWER(r.RiverName), 1)
ORDER BY Mix;
