USE Bitbucket
GO

SELECT
	p.Id
	, p.Name
	, CONCAT(p.Size, 'KB') AS Size
FROM Files AS p
LEFT JOIN Files AS c ON c.ParentId = p.Id
WHERE c.Id IS NULL
ORDER BY p.Id, p.Name, p.Size DESC
