USE Service
GO

CREATE OR ALTER FUNCTION udf_HoursToComplete(@StartDate DATETIME, @EndDate DATETIME)
RETURNS INT 
AS
BEGIN
	IF (@StartDate IS NULL) OR (@EndDate IS NULL)
		RETURN 0
	RETURN DATEDIFF(HOUR, @StartDate, @EndDate)
END
GO

SELECT dbo.udf_HoursToComplete(OpenDate, CloseDate) AS TotalHours
   FROM Reports
