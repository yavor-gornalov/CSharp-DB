-- Use Hotel database
USE Hotel;
GO

UPDATE Payments
SET TaxRate = (1 - 0.03) * TaxRate;

SELECT TaxRate FROM Payments;
