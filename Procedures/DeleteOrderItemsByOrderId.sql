CREATE PROCEDURE DeleteOrderItemsByOrderId
    @OrderId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM OrderItems WHERE OrderId = @OrderId;
END;
