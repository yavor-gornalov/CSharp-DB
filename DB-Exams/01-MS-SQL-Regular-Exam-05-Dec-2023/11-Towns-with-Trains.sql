USE RailwaysDb
GO

CREATE OR ALTER FUNCTION udf_TownsWithTrains(@name NVARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @result INT
	SELECT 
		@result = COUNT(*)
	FROM Trains AS tr
	WHERE tr.DepartureTownId = (SELECT Id FROM Towns WHERE Name = @name) OR
			tr.ArrivalTownId = (SELECT Id FROM Towns WHERE Name = @name)
	RETURN @result
END
GO

SELECT dbo.udf_TownsWithTrains('Paris') AS "Output"