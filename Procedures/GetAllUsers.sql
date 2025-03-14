CREATE PROCEDURE GetAllUsers
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
	FROM Users WHERE IsDeleted = 0;
END;