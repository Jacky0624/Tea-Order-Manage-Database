CREATE PROCEDURE GetAllRoles
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, Name, Description
    FROM Roles;
END;