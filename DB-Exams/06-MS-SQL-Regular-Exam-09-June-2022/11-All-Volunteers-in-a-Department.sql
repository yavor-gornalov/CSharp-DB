USE Zoo
GO

CREATE OR ALTER FUNCTION udf_GetVolunteersCountFromADepartment
	(@VolunteersDepartment VARCHAR(30))
RETURNS INT
AS
BEGIN
RETURN (
	SELECT
		COUNT(*)
	FROM Volunteers AS v
	JOIN VolunteersDepartments AS d ON v.DepartmentId = d.Id
		AND d.DepartmentName = @VolunteersDepartment)
END
GO

SELECT dbo.udf_GetVolunteersCountFromADepartment ('Education program assistant')
