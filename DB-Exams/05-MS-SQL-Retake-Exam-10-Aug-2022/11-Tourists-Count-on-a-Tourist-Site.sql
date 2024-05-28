USE NationalTouristSitesOfBulgaria
GO

CREATE OR ALTER FUNCTION udf_GetTouristsCountOnATouristSite 
	(@Site VARCHAR(100))
RETURNS INT
AS
BEGIN
RETURN 
(
	SELECT
		COUNT(*)
	FROM Tourists AS t
	JOIN SitesTourists AS st ON st.TouristId = t.Id
	JOIN Sites AS s ON st.SiteId = s.Id
	WHERE s.Name = @Site 
)
END
GO

SELECT dbo.udf_GetTouristsCountOnATouristSite ('Regional History Museum – Vratsa')
