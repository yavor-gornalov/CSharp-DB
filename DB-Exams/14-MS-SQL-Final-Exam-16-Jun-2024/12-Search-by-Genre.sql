USE LibraryDb
GO

CREATE OR ALTER PROC usp_SearchByGenre
	(@genreName NVARCHAR(30))
AS
	SELECT
		b.Title AS Title
		, b.YearPublished AS Year
		, b.ISBN AS ISBN
		, a.Name AS Author
		, g.Name AS Genre
	FROM Books AS b
	JOIN Genres AS g ON b.GenreId = g.Id
	JOIN Authors AS a ON b.AuthorId = a.Id
	WHERE g.Name = @genreName
	ORDER BY b.Title
GO

EXEC usp_SearchByGenre 'Fantasy'
