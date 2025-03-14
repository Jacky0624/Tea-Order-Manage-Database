CREATE PROCEDURE GetUserById
    @Id INT
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
    WHERE Id = @Id AND IsDeleted = 0;
END;
