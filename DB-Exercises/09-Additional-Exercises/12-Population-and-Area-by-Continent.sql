USE Geography
GO

SELECT
	ct.ContinentName AS ContinentName
	,SUM(CAST(cn.AreaInSqKm AS BIGINT)) AS CountriesArea
	,SUM(CAST(cn.Population AS BIGINT)) AS CountriesPopulation
FROM Continents AS ct
JOIN Countries AS cn ON ct.ContinentCode = cn.ContinentCode
GROUP BY ContinentName
ORDER BY CountriesPopulation DESC
