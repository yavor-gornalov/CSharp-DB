USE NationalTouristSitesOfBulgaria
GO

SELECT DISTINCT
	SUBSTRING(t.Name, CHARINDEX(' ', t.Name, 1) + 1, LEN(t.Name) - CHARINDEX(' ', t.Name, 1)) AS LastName
	, Nationality
	, t.Age
	, t.PhoneNumber
FROM Tourists AS t
JOIN SitesTourists AS st ON st.TouristId = t.Id
JOIN Sites AS s ON st.SiteId = s.Id
JOIN Categories AS c ON s.CategoryId = c.Id
WHERE c.Name = 'History and archaeology'
ORDER BY LastName
