CREATE PROCEDURE InsertOrderItemOptions
    @OrderItemId INT,
    @OrderItemOptions OrderItemOptionsTableType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO OrderItemOptions (OrderItemId, VariantTypeId, VariantType, VariantValueId, VariantValue, ExtraValue)
    SELECT @OrderItemId, VariantTypeId, VariantType, VariantValueId, VariantValue, ExtraValue
    FROM @OrderItemOptions;
END;
