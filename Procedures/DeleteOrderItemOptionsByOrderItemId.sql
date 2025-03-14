CREATE PROCEDURE DeleteOrderItemOptionsByOrderItemId
    @OrderItemId INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM OrderItemOptions WHERE OrderItemId = @OrderItemId;
END;