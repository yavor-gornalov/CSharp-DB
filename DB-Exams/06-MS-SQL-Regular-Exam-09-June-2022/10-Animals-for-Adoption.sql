USE Zoo
GO

SELECT
	a.Name
	, YEAR(a.BirthDate) AS BirthYear
	, at.AnimalType
FROM Animals AS a
JOIN AnimalTypes AS at ON at.Id = a.AnimalTypeId 
	AND at.AnimalType <> 'Birds'
WHERE DATEDIFF(YEAR, a.BirthDate, '01/01/2022') < 5
	AND a.OwnerId IS NULL
ORDER BY a.Name
