USE Geography
GO

SELECT
	c.CountryName
	,ContinentName
	,COUNT(r.Id) AS RiversCount
	,COALESCE (SUM(r.Length), 0) AS TotalLength
FROM Countries AS c
LEFT JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
LEFT JOIN Rivers AS r ON cr.RiverId = r.Id
LEFT JOIN Continents AS ct ON c.ContinentCode = ct.ContinentCode
GROUP BY c.CountryName, ct.ContinentName
ORDER BY RiversCount DESC, TotalLength DESC, CountryName
