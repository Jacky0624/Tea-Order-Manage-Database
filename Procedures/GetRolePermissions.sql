CREATE PROCEDURE GetRolePermissions
    @RoleId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT RoleId, PermissionId FROM RolePermissions WHERE RoleId = @RoleId;
END;