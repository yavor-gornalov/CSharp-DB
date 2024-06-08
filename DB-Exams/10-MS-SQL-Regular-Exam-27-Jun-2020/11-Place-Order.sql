USE WMS
GO

CREATE OR ALTER PROC usp_PlaceOrder
	(@jobId INT, @serialNumber VARCHAR(50), @quantity INT)
AS
BEGIN
	IF ((SELECT TOP 1 Status FROM Jobs WHERE JobId = @jobId) = 'Finished')
		THROW 50011, 'This job is not active!', 1
	
	IF (@quantity <= 0)
		THROW 50012, 'Part quantity must be more than zero!', 1

	IF ((SELECT TOP 1 JobId FROM Jobs WHERE JobId = @jobId) IS NULL)
		THROW 50013, 'Job not found!', 1

	IF ((SELECT TOP 1 StockQty FROM Parts WHERE SerialNumber = @serialNumber) IS NULL)
		THROW 50014, 'Part not found!', 1

	DECLARE @partId INT = (SELECT TOP 1 PartId FROM Parts WHERE SerialNumber = @serialNumber)
	DECLARE @order INT

	IF ((SELECT TOP 1 JobId FROM Orders WHERE IssueDate IS NULL) = @jobId)
		BEGIN 
			SET @order = (SELECT TOP 1 
							OrderId 
						FROM Orders WHERE JobId = @jobId)
			IF(@partId IN (SELECT PartId FROM OrderParts WHERE OrderId = @order))
			BEGIN
				UPDATE OrderParts
					SET Quantity += @quantity
				WHERE OrderId = @order AND PartId = @partId
				RETURN
			END

			INSERT INTO OrderParts 
			VALUES (@order, @partId, @quantity)
		END
	ELSE
		BEGIN
			INSERT INTO Orders VALUES (@jobId, NULL, 0)
			SET @order = (SELECT TOP 1 
							OrderId 
						FROM Orders 
						ORDER BY OrderId DESC)
			INSERT INTO OrderParts VALUES (@order, @partId, @quantity)
		END
END
GO

DECLARE @err_msg AS NVARCHAR(MAX);
BEGIN TRY
  EXEC usp_PlaceOrder 1, 'ZeroQuantity', 0
END TRY

BEGIN CATCH
  SET @err_msg = ERROR_MESSAGE();
  SELECT @err_msg
END CATCH
