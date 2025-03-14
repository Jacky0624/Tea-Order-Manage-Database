CREATE PROCEDURE CreateProduct
    @ProductName NVARCHAR(255),
    @Description NVARCHAR(MAX),
    @ImageUrl NVARCHAR(500),
    @IsActive BIT,
    @CategoryId INT,
    @CreateUser NVARCHAR(100),
	@NewProductId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Products (ProductName, Description, ImageUrl, IsActive, CategoryId, CreatedAt, CreateUser, ModifyAt, ModifyUser)
    VALUES (@ProductName, @Description, @ImageUrl, @IsActive, @CategoryId, GETDATE(), @CreateUser, GETDATE(), @CreateUser);
	SET @NewProductId = SCOPE_IDENTITY(); 
END;