-- Populate Towns table
INSERT INTO Towns (Name) 
	VALUES
		('Sofia'),
		('Plovdiv'),
		('Varna'),
		('Burgas');

-- Populate Addresses table
INSERT INTO Addresses (AddressText, TownId) VALUES
('123 Vitosha Boulevard', 1),
('86 Tsar Simeon', 2),
('19 Khan Asparuh', 3),
('101 Tsar Kaloyan', 4);


-- Populate Departments table
INSERT INTO Departments (Name) 
	VALUES
	('Engineering'),
	('Sales'),
	('Marketing'),
	('Software Development'),
	('Quality Assurance');

-- Populate Employees table
INSERT INTO Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary, AddressId) 
	VALUES
		('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00, 1),
		('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00, 3),
		('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25, 3),
		('Georgi', 'Teziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00, 4),
		('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88, 1);
