USE LibraryDb

BEGIN TRANSACTION

DECLARE @AuthorIdToDelete INT = (SELECT Id FROM Authors WHERE Name = 'Alex Michaelides')

DECLARE @BooksToDelete TABLE (BookToDeleteId INT)
INSERT INTO @BooksToDelete
SELECT
	Id
FROM Books WHERE AuthorId = @AuthorIdToDelete

DELETE
FROM  LibrariesBooks
WHERE BookId IN (SELECT BookToDeleteId FROM @BooksToDelete)

DELETE 
FROM Books 
WHERE Id IN (SELECT BookToDeleteId FROM @BooksToDelete)

DELETE
FROM Authors WHERE Id = @AuthorIdToDelete

ROLLBACK TRANSACTION