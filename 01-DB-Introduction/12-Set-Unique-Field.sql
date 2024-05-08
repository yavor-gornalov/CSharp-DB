USE Minions

ALTER TABLE Users
ADD CONSTRAINT UC_Username UNIQUE(Username);

INSERT INTO Users(Username, Password, ProfilePicture, IsDeleted)
	VALUES
	('user201', 'password100', NULL, 0)

INSERT INTO Users(Username, Password, ProfilePicture, IsDeleted)
	VALUES
	('user201', 'password100', NULL, 0)

SELECT * FROM Users;