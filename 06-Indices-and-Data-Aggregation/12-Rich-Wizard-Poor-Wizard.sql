USE Gringotts;
GO

SELECT
	SUM(dt.[Difference]) AS SumDifference
FROM 
	(SELECT 
		wd.FirstName AS [Host Wizard]
		,wd.DepositAmount AS [Host Wizard Deposit]
		,(SELECT FirstName FROM WizzardDeposits WHERE Id = wd.Id + 1) AS [Guest Wizard]
		,(SELECT DepositAmount FROM WizzardDeposits WHERE Id = wd.Id + 1) AS [Guest Wizard Deposit]
		,wd.DepositAmount - (SELECT DepositAmount FROM WizzardDeposits WHERE Id = wd.Id + 1) AS [Difference]
	FROM WizzardDeposits AS wd ) as dt
