USE EducationDB;
GO

CREATE TABLE Students (
	StudentID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(150) NOT NULL,
);

CREATE TABLE Exams(
	ExamID INT PRIMARY KEY,
	Name NVARCHAR(100),
);


CREATE TABLE StudentsExams(
	StudentID INT,
	ExamID INT,

	CONSTRAINT Pk_StudentExam PRIMARY KEY (StudentID, ExamID),
	CONSTRAINT Fk_StudentExams_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	CONSTRAINT Fk_StudentExams_Exams FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);

INSERT INTO Students
	VALUES
		('Mila'),                                      
		('Toni'),
		('Ron');


INSERT INTO Exams
	VALUES
		('101', 'SpringMVC'),
		('102', 'Neo4j'),
		('103', 'Oracle 11g');

INSERT INTO StudentsExams
	VALUES
		(1, 101),
		(1, 102),
		(2, 101);

