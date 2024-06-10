USE Bakery
GO

BEGIN TRANSACTION

DECLARE @FeedbacksToDelete TABLE (FeedbackId INT)

INSERT INTO @FeedbacksToDelete
SELECT
	Id
FROM Feedbacks
WHERE CustomerId = 14 OR ProductId = 5

DELETE 
FROM Feedbacks
WHERE Id IN (SELECT FeedbackId FROM @FeedbacksToDelete)

ROLLBACK TRANSACTION
