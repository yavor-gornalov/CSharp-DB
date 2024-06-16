USE LibraryDb
GO

DECLARE @LibrariesWithMysteryGenre TABLE (LibraryId INT)
INSERT INTO @LibrariesWithMysteryGenre

SELECT DISTINCT
	lb.LibraryId
FROM Books AS b
JOIN Genres AS g ON b.GenreId = g.Id
JOIN LibrariesBooks AS lb ON lb.BookId = b.Id
WHERE g.Name = 'Mystery'

SELECT
    l.Name AS [Library]
    , c.Email
FROM Libraries AS l
JOIN Contacts AS c ON l.ContactId = c.Id
WHERE l.Id NOT IN (SELECT LibraryId FROM @LibrariesWithMysteryGenre)
ORDER BY l.Name;
