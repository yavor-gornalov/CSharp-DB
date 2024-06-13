USE TripService
GO

SELECT
	a.Id AS AccountId
	, CONCAT(a.FirstName, ' ', a.LastName) AS FullName
	, MAX(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate)) AS LongestTrip
	, MIN(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate)) AS ShortestTrip
FROM Accounts AS a
JOIN AccountsTrips AS at ON at.AccountId = a.Id
JOIN Trips AS t ON at.TripId = t.Id
WHERE t.CancelDate IS NULL AND a.MiddleName IS NULL
GROUP BY a.Id, a.FirstName, a.LastName
ORDER BY LongestTrip DESC, ShortestTrip ASC
