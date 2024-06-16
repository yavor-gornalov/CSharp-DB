USE LibraryDb
GO

SELECT
	Title [Book Title]
	, ISBN
	, YearPublished [YearReleased]
FROM Books
ORDER BY YearPublished DESC, Title
