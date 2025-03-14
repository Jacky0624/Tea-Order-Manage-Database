CREATE PROCEDURE GetOrderItemsByOrderId
    @OrderId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT Id, OrderId, ProductId, ProductName, ProductSizeId, ProductSizeName, Count, Price, Remark, CreateUser, CreateAt
    FROM OrderItems
    WHERE OrderId = @OrderId;
END;
