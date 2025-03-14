CREATE PROCEDURE GetRoleById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, Name, Description
    FROM Roles
    WHERE Id = @Id;
END;
