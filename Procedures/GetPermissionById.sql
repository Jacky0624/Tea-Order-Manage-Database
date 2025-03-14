CREATE PROCEDURE GetPermissionById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT Id, Name, Description
    FROM [TeaOrder].[dbo].[Permissions]
    WHERE Id = @Id;
END;
