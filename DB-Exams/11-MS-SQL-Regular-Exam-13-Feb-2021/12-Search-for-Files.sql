USE Bitbucket
GO

CREATE OR ALTER PROC usp_SearchForFiles
	(@fileExtension VARCHAR(100))
AS
SELECT
	f.Id
	, f.Name
	, CONCAT(f.Size, 'KB') AS Size
FROM Files AS f
WHERE f.Name LIKE '%.' + @fileExtension
ORDER BY f.Id, f.Name, f.Size DESC
GO

EXEC usp_SearchForFiles 'txt'
