USE Service
GO

SELECT
	u.Username
	, c.Name
FROM Users AS u
JOIN Reports AS r ON r.UserId = u.Id
JOIN Categories AS c ON r.CategoryId = c.Id
WHERE FORMAT(u.Birthdate, 'dd/MM') = FORMAT(r.OpenDate, 'dd/MM')
ORDER BY u.Username, c.Name
