USE Geography;
GO

SELECT
	CountryName
	,IsoCode
FROM Countries
WHERE LEN(CountryName) - LEN(REPLACE(UPPER(CountryName), 'A', '')) >= 3
ORDER BY IsoCode;
