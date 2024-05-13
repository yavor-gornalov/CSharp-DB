USE Geography;
GO

SELECT
	c.ContinentCode
	,c.CurrencyCode
	,COUNT(c.CurrencyCode) AS CurrencyUsage
FROM Countries AS c
GROUP BY c.ContinentCode, c.CurrencyCode
HAVING COUNT(c.CurrencyCode) > 1 AND 
		COUNT(c.CurrencyCode) = (SELECT t.Usage FROM
			(SELECT TOP 1
				COUNT(*) AS Usage
			FROM Countries AS dt
			WHERE dt.ContinentCode = c.ContinentCode
			GROUP BY dt.CurrencyCode
			ORDER BY Usage DESC) AS t)
ORDER BY c.ContinentCode;
