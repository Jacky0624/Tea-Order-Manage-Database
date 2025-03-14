CREATE PROCEDURE GetAllProductCategories
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, CategoryName, Description, IsActive, CreatedAt, CreateUser, ModifyAt, ModifyUser
    FROM ProductCategories;
END;