CREATE PROCEDURE GetAllProducts
    @IncludeDeleted BIT = 0 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, ProductName, Description, ImageUrl, IsActive, CategoryId, CreatedAt, CreateUser, ModifyAt, ModifyUser, IsDeleted
    FROM Products
    WHERE (@IncludeDeleted = 1 OR IsDeleted = 0); 
END;
