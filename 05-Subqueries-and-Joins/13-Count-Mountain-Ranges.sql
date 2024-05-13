USE Geography;
GO

SELECT
	c.CountryCode
	,COUNT(*) AS MountainRanges
FROM Mountains AS m 
JOIN MountainsCountries AS mc ON m.Id = mc.MountainId
JOIN Countries AS c ON mc.CountryCode = c.CountryCode
WHERE c.CountryName IN ('United States', 'Russia', 'Bulgaria') 
GROUP BY c.CountryCode
