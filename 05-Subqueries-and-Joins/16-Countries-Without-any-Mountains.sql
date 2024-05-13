USE Geography;
GO

SELECT
	COUNT(c.CountryCode) - COUNT(mc.CountryCode) AS Count
FROM MountainsCountries AS mc
RIGHT JOIN Countries AS c ON mc.CountryCode = c.CountryCode
