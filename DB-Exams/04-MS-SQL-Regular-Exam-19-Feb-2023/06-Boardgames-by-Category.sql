USE Boardgames
GO

SELECT
	b.Id
	, b.Name
	, b.YearPublished
	, c.Name AS CategoryName
FROM Boardgames AS b
JOIN Categories AS c ON b.CategoryId = c.Id AND
	c.Name IN ('Strategy Games', 'Wargames' ) 
ORDER BY b.YearPublished DESC
