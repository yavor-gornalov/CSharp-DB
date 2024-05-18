USE EducationDB;
GO

CREATE TABLE Teachers(
	TeacherID INT,
	Name NVARCHAR(150),
	ManagerID INT

	CONSTRAINT Pk_Teacher PRIMARY KEY (TeacherID),
	CONSTRAINT Fk_Teacher_Manager FOREIGN KEY (ManagerID) REFERENCES Teachers(TeacherID)
);

INSERT INTO Teachers
	VALUES
		(101, 'John', NULL),
		(102, 'Maya', 106),
		(103, 'Silvia', 106),
		(104, 'Ted', 105),
		(105, 'Mark', 101),
		(106, 'Greta', 101);
