USE Bank
GO

CREATE OR ALTER PROCEDURE usp_TransferMoney
    (@SenderId INT, @ReceiverId INT, @Amount MONEY)
AS
BEGIN
    BEGIN TRANSACTION;
		EXEC usp_WithdrawMoney @SenderId, @Amount;
		EXEC usp_DepositMoney @ReceiverId, @Amount;

		IF ((SELECT Balance FROM Accounts WHERE Id = @SenderId) < 0)
		BEGIN
			ROLLBACK TRANSACTION;
			THROW 50003, 'Not enough funds', 1;
		END
    COMMIT TRANSACTION;
END
GO

EXEC usp_TransferMoney 5, 1, 5000
SELECT * FROM Accounts WHERE Id IN (5, 1)
