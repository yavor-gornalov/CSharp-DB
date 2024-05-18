USE Bank
GO

CREATE OR ALTER PROC usp_DepositMoney
	(@AccountId INT, @MoneyAmount MONEY)
AS
BEGIN TRANSACTION
	IF (@MoneyAmount < 0)
		THROW 50001, 'Cannot deposit negative or zero Amount!', 1;
	IF (SELECT COUNT(*)  FROM Accounts WHERE Id = @AccountId) < 1
	    THROW 50002,'Given AccountID does not exists!', 1;
	
	UPDATE Accounts
	SET Balance = Balance + @MoneyAmount
	WHERE @AccountId = Id
COMMIT
GO

EXEC usp_DepositMoney 1, 10
SELECT * FROM Accounts WHERE Id = 1
