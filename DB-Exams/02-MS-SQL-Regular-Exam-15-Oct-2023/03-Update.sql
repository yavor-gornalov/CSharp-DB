USE TouristAgency
GO

UPDATE Bookings
SET DepartureDate = DATEADD(DAY, 1, DepartureDate)
WHERE YEAR(DepartureDate) = 2023 AND MONTH(DepartureDate) = 12

UPDATE Tourists
SET Email = NULL
WHERE Email LIKE '%MA%'
