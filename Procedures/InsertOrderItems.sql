CREATE PROCEDURE InsertOrderItems
    @OrderItemTable OrderItemTableType READONLY
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO OrderItems (OrderId, ProductId, ProductName, ProductSizeId, ProductSizeName, Count, Price, Remark, CreateUser, CreateAt)
    SELECT OrderId, ProductId, ProductName, ProductSizeId, ProductSizeName, Count, Price, Remark, CreateUser, GETDATE()
    FROM @OrderItemTable;
END;