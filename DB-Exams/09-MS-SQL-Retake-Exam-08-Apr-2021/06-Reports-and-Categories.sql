USE Service
GO

SELECT
	r.Description
	, c.Name AS CategoryName
FROM Reports AS r
JOIN Categories AS c ON r.CategoryId = c.Id
WHERE CategoryId IS NOT NULL
ORDER BY r.Description, c.Name
