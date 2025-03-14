CREATE PROCEDURE GetOrderItemOptionsByOrderItemId
    @OrderItemId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT OrderItemId, VariantTypeId, VariantType, VariantValueId, VariantValue, ExtraValue
    FROM OrderItemOptions
    WHERE OrderItemId = @OrderItemId;
END;
