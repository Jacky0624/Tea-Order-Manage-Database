CREATE PROCEDURE GetOrderItemById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        oi.Id,
        oi.OrderId,
        oi.ProductId,
        oi.ProductName,
        oi.ProductSizeId,
        oi.ProductSizeName,
        oi.Count,
        oi.Price,
        oi.Remark,
        oi.CreateAt,
        oi.CreateUser
    FROM OrderItems oi
    WHERE oi.Id = @Id;
END;