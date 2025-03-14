CREATE PROCEDURE SoftDeleteUser
    @Id INT,
    @DeleteAt DATETIME,
    @DeleteUser NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Users
    SET IsDeleted = 1, DeleteAt = @DeleteAt, DeleteUser = @DeleteUser
    WHERE Id = @Id;
END;
