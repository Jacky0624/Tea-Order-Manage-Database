CREATE PROCEDURE GetProductCategoryById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, CategoryName, Description, IsActive, CreatedAt, CreateUser, ModifyAt, ModifyUser
    FROM ProductCategories
    WHERE Id = @Id;
END;
