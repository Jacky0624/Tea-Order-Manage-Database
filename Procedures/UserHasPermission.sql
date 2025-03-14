CREATE PROCEDURE UserHasPermission
    @UserId INT,
    @PermissionId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT CASE 
        WHEN EXISTS (
            SELECT 1 FROM UserPermissions
            WHERE UserId = @UserId AND PermissionId = @PermissionId
        ) 
        THEN 1 ELSE 0 
    END AS HasPermission;
END;
