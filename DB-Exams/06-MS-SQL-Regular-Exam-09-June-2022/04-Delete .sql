USE Zoo
GO

BEGIN TRANSACTION

DECLARE @DepartmentsToDelete TABLE (
	DepartmentId INT
)
INSERT INTO @DepartmentsToDelete
SELECT Id 
FROM VolunteersDepartments 
WHERE DepartmentName = 'Education program assistant'

DECLARE @VolunteersToDelete TABLE (
	VolunteerId INT
) 
INSERT INTO @VolunteersToDelete
SELECT Id
FROM Volunteers WHERE DepartmentId IN (SELECT DepartmentId FROM @DepartmentsToDelete)

DELETE FROM Volunteers 
WHERE Id IN (SELECT VolunteerId FROM @VolunteersToDelete)

DELETE FROM VolunteersDepartments 
WHERE Id IN (SELECT DepartmentId FROM @DepartmentsToDelete)

ROLLBACK TRANSACTION
