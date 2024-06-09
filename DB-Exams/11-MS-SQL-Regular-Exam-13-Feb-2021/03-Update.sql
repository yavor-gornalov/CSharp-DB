USE Bitbucket
GO

BEGIN TRANSACTION

UPDATE Issues
	SET IssueStatus = 'closed'
WHERE AssigneeId = 6

ROLLBACK TRANSACTION
