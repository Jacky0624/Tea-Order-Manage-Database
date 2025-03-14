CREATE PROCEDURE AddUser
    @Username NVARCHAR(100),
    @Account NVARCHAR(100),
    @PasswordHash NVARCHAR(255),
    @RoleId INT,
    @CreateAt DATETIME,
    @CreateUser NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Users (Username, Account, PasswordHash, RoleId, IsDeleted, CreateAt, CreateUser)
    VALUES (@Username, @Account, @PasswordHash, @RoleId, 0, @CreateAt, @CreateUser);
END;
