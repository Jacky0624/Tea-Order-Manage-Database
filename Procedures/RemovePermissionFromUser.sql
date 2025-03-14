CREATE PROCEDURE RemovePermissionFromUser
    @UserId INT,
    @PermissionId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM UserPermissions
    WHERE UserId = @UserId AND PermissionId = @PermissionId;
END;
