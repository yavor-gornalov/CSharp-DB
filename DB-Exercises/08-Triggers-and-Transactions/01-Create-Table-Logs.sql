USE Bank
GO

CREATE TABLE Logs (
	LogId INT IDENTITY
	,AccountId INT NOT NULL 
	,OldSum MONEY NOT NULL 
	,NewSum MONEY NOT NULL
);
GO

CREATE OR ALTER TRIGGER tr_AccountBalanceUpdate
ON Accounts FOR UPDATE
AS
BEGIN
	INSERT INTO 
		Logs(AccountId, OldSum, NewSum)
	SELECT 
		i.Id, d.Balance, i.Balance
	FROM inserted AS i
	JOIN deleted AS d ON i.Id = d.Id
	WHERE i.Balance <> d.Balance
END
GO
