USE WMS
GO

CREATE OR ALTER FUNCTION udf_GetCost
	(@jobId INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
	DECLARE @Result DECIMAL(18,2)
	SET @Result = (SELECT
			SUM(p.Price * op.Quantity)
		FROM Jobs AS j
		JOIN Orders AS o ON o.JobId = j.JobId
		JOIN OrderParts AS op ON op.OrderId = o.OrderId
		JOIN Parts AS p ON op.PartId = p.PartId
		WHERE j.JobId = @jobId
		GROUP BY j.JobId)
	RETURN COALESCE(@Result, 0)
END
GO

SELECT dbo.udf_GetCost(1)
SELECT dbo.udf_GetCost(3)
