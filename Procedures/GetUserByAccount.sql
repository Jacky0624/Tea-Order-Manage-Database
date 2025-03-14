CREATE PROCEDURE GetUserByAccount
    @Account NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Id, 
        Username, 
        Account, 
        PasswordHash, 
        RoleId, 
        IsDeleted, 
        CreateAt, 
        CreateUser, 
        ModifyAt, 
        ModifyUser, 
        DeleteAt, 
        DeleteUser
    FROM Users
    WHERE Account = @Account;
END;
