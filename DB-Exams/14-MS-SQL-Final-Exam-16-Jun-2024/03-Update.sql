USE LibraryDb

BEGIN TRANSACTION

UPDATE c
	SET  Website = CONCAT('www.', LOWER(REPLACE(a.Name, ' ', '')), '.com')
FROM Authors AS a
JOIN Contacts AS c ON a.ContactId = c.Id
WHERE c.Email IS NULL

ROLLBACK TRANSACTION