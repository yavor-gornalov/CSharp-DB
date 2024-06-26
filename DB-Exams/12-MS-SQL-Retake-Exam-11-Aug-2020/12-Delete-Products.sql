USE Bakery
GO

CREATE OR ALTER TRIGGER tr_DeleteProduct
ON Products
INSTEAD OF DELETE
AS
BEGIN
	DELETE 
	FROM ProductsIngredients 
	WHERE ProductId IN (SELECT Id FROM DELETED)

	DELETE
	FROM Feedbacks
	WHERE ProductId IN (SELECT Id FROM DELETED)

	DELETE
	FROM Products
	WHERE Id IN (SELECT Id FROM DELETED)
END
GO

BEGIN TRANSACTION

DELETE FROM Products WHERE Id = 7

ROLLBACK TRANSACTION