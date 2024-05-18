USE Gringotts;
GO

SELECT DISTINCT
	LEFT(FirstName,1) AS FirstLetter
FROM WizzardDeposits 
WHERE DepositGroup = 'Troll Chest'
ORDER BY FirstLetter
