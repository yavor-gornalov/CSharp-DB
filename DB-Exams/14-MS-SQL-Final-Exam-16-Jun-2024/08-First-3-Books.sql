USE LibraryDb
GO

SELECT TOP 3
	b.Title
	, b.YearPublished AS [Year]
	, g.Name AS [Genre]
FROM Books AS b
JOIN Genres AS g ON b.GenreId = g.Id
WHERE (b.YearPublished > 2000 AND b.Title LIKE '%a%')
	OR (b.YearPublished < 1950 AND g.Name LIKE '%Fantasy%')
ORDER BY b.Title, b.YearPublished DESC
