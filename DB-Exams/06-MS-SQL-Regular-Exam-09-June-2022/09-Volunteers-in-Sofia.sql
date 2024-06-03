USE Zoo
GO

SELECT
	v.Name
	, v.PhoneNumber
	, TRIM(REPLACE(REPLACE(v.Address, 'sofia', ''), ',', ''))
FROM Volunteers AS v
JOIN VolunteersDepartments AS d ON v.DepartmentId = d.Id
WHERE v.Address LIKE '%sofia%'
	AND d.DepartmentName = 'Education program assistant'
ORDER BY v.Name
