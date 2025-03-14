CREATE PROCEDURE GetAllPermissions
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT Id, Name, Description
    FROM Permissions;
END;