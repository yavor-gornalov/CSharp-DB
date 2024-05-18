USE Minions

UPDATE Users
SET LastLoginTime = GETDATE();

ALTER TABLE Users
ALTER COLUMN LastLoginTime DATETIME2 NOT NULL;

ALTER TABLE Users
ADD CONSTRAINT DF_LastLoginTime DEFAULT GETDATE() FOR LastLoginTime;

INSERT INTO Users(Username, Password, ProfilePicture, IsDeleted)
	VALUES
	('user', 'password100', NULL, 0)

SELECT * FROM Users;