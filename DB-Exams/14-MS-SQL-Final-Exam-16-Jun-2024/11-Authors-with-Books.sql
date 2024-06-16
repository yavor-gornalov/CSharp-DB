USE LibraryDb
GO

CREATE OR ALTER FUNCTION udf_AuthorsWithBooks
	(@name NVARCHAR(100))
RETURNS
INT
AS
BEGIN
RETURN (
	SELECT
		COUNT(*)
	FROM Books AS b
	JOIN Authors AS a ON b.AuthorId = a.Id
	WHERE a.Name = @name )
END
GO

SELECT dbo.udf_AuthorsWithBooks('J.K. Rowling')
