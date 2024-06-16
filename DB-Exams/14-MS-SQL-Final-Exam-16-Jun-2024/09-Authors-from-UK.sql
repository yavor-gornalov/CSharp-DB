USE LibraryDb
GO

SELECT
	a.Name AS Author
	, c.Email
	, c.PostAddress AS Address
FROM Authors AS a
JOIN Contacts AS c ON a.ContactId = c.Id
WHERE c.PostAddress LIKE '%UK'
ORDER BY a.Name
