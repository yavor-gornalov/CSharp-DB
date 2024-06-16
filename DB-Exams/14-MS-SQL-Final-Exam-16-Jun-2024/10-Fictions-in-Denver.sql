USE LibraryDb
GO

SELECT
	a.Name AS Author
	, b.Title
	, l.Name AS Library
	, c.PostAddress AS [Library Address]
FROM Books AS b
JOIN Authors AS a ON b.AuthorId = a.Id
JOIN Genres AS g ON b.GenreId = g.Id
JOIN LibrariesBooks AS lb ON lb.BookId = b.Id
JOIN Libraries AS l ON lb.LibraryId = l.Id
JOIN Contacts AS c ON l.ContactId = c.Id
WHERE g.Name LIKE 'Fiction' 
	AND c.PostAddress LIKE '%Denver%'
ORDER BY b.Title
