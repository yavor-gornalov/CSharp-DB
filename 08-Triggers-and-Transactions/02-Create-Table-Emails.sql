USE Bank
GO

CREATE TABLE NotificationEmails (
	Id INT IDENTITY
	,Recipient INT NOT NULL 
	,Subject NVARCHAR(100) NOT NULL 
	,Body NVARCHAR(MAX) NOT NULL
);
GO

CREATE OR ALTER TRIGGER tr_NotificationOnBalanceUpdate
ON Logs AFTER INSERT
AS
BEGIN
	INSERT INTO 
		NotificationEmails(Recipient, Subject, Body)
	SELECT 
		i.AccountId
		,CONCAT('Balance change for account: ', i.AccountId)
		,CONCAT('On ', FORMAT(GETDATE(), 'MMM dd yyyy h:mm tt'), ' your balance was changed from ', i.OldSum, ' to ',i.NewSum, '.')
	FROM inserted AS i
END
GO

UPDATE Accounts
	SET Balance = Balance + 10
WHERE Id = 1

SELECT
	*
FROM NotificationEmails

SELECT
	*
FROM Logs

truncate table Logs
truncate table NotificationEmails