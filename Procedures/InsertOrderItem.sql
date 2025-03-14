CREATE PROCEDURE InsertOrderItem
    @OrderId INT,
    @ProductId INT,
    @ProductName NVARCHAR(255),
    @ProductSizeId INT,
    @ProductSizeName NVARCHAR(255),
    @Count INT,
    @Price DECIMAL(10,2),
    @Remark NVARCHAR(MAX),
    @CreateUser NVARCHAR(100),
    @NewOrderItemId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO OrderItems (OrderId, ProductId, ProductName, ProductSizeId, ProductSizeName, Count, Price, Remark, CreateUser, CreateAt)
    VALUES (@OrderId, @ProductId, @ProductName, @ProductSizeId, @ProductSizeName, @Count, @Price, @Remark, @CreateUser, GETDATE());

    SET @NewOrderItemId = SCOPE_IDENTITY();
END;
