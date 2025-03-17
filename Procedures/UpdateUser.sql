CREATE PROCEDURE UpdateUser
    @Id INT,
    @Username NVARCHAR(100),
    @Account NVARCHAR(100),
    @RoleId INT,
    @ModifyAt DATETIME,
    @ModifyUser NVARCHAR(100),
    @PasswordHash NVARCHAR(255),
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Users
    SET Username = @Username, Account = @Account, RoleId = @RoleId, 
        ModifyAt = @ModifyAt, ModifyUser = @ModifyUser, PasswordHash = @PasswordHash
    WHERE Id = @Id AND IsDeleted = 0;
END;
