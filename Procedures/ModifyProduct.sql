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