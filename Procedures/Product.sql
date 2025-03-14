CREATE PROCEDURE GetAllProducts
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, ProductName, Description, ImageUrl, IsActive, CategoryId, CreatedAt, CreateUser, ModifyAt, ModifyUser
    FROM Products;
END;

CREATE PROCEDURE GetProductById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, ProductName, Description, ImageUrl, IsActive, CategoryId, CreatedAt, CreateUser, ModifyAt, ModifyUser
    FROM Products
    WHERE Id = @Id;
END;

CREATE PROCEDURE GetProductsByCategoryId
    @CategoryId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, ProductName, Description, ImageUrl, IsActive, CategoryId, CreatedAt, CreateUser, ModifyAt, ModifyUser
    FROM Products
    WHERE CategoryId = @CategoryId;
END;

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

CREATE PROCEDURE ModifyProduct
    @Id INT,
    @ProductName NVARCHAR(255),
    @Description NVARCHAR(MAX),
    @ImageUrl NVARCHAR(500),
    @IsActive BIT,
    @CategoryId INT,
    @ModifyUser NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Products
    SET ProductName = @ProductName, Description = @Description, ImageUrl = @ImageUrl,
        IsActive = @IsActive, CategoryId = @CategoryId, ModifyAt = GETDATE(), ModifyUser = @ModifyUser
    WHERE Id = @Id;
END;

CREATE PROCEDURE DeleteProduct
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Products WHERE Id = @Id;
END;




