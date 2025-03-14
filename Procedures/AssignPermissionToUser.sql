CREATE PROCEDURE AssignPermissionToUser
    @UserId INT,
    @PermissionId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO UserPermissions (UserId, PermissionId)
    VALUES (@UserId, @PermissionId);
END;