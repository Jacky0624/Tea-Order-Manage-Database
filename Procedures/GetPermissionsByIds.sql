CREATE TYPE dbo.IntList AS TABLE (Id INT);

CREATE PROCEDURE GetPermissionsByIds
    @PermissionIds dbo.IntList READONLY
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT Id, Name, Description
    FROM Permissions
    WHERE Id IN (SELECT Id FROM @PermissionIds);
END;
