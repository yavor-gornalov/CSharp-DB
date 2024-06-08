USE WMS
GO

DECLARE @OrderedQuantities TABLE (
	PartId INT
	, Quantity INT
)

INSERT INTO @OrderedQuantities
SELECT 
	op.PartId, 
	op.Quantity 
FROM Orders AS o
JOIN OrderParts AS op ON o.OrderId = op.OrderId
WHERE o.Delivered = 0

SELECT 
	p.PartId 
	, p.Description
	, SUM(pn.Quantity) AS Required
	, SUM(p.StockQty) AS InStock
	, COALESCE(SUM(q.Quantity), 0) AS Ordered
FROM Parts AS p
LEFT JOIN PartsNeeded AS pn ON p.PartId = pn.PartId
LEFT JOIN Jobs AS j ON pn.JobId = j.JobId
LEFT JOIN @OrderedQuantities AS q ON p.PartId = q.PartId
WHERE j.Status <> 'Finished'
GROUP BY p.PartId, p.Description
HAVING SUM (pn.Quantity) > SUM(p.StockQty) + COALESCE(SUM(q.Quantity), 0)
ORDER BY p.PartId 


