USE Geography
GO

SELECT
	c.CurrencyCode
	,c.Description
	,COUNT(ct.CountryCode) AS NumberOfCountries
FROM Currencies AS c
LEFT JOIN Countries AS ct ON c.CurrencyCode = ct.CurrencyCode
GROUP BY c.CurrencyCode, c.Description
ORDER BY NumberOfCountries DESC, Description
