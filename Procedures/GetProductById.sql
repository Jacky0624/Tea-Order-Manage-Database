CREATE PROCEDURE GetProductById
    @Id INT,
    @IncludeDeleted BIT = 0 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, ProductName, Description, ImageUrl, IsActive, CategoryId,CreatedAt, CreateUser, ModifyAt, ModifyUser,IsDeleted
    FROM Products
    WHERE Id = @Id
    AND (@IncludeDeleted = 1 OR IsDeleted = 0);
END;
