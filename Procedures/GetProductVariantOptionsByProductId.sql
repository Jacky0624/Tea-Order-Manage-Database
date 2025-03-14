CREATE PROCEDURE GetProductVariantOptionsByProductId
    @ProductId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ProductId, VariantValueId
    FROM ProductVariantOptions
    WHERE ProductId = @ProductId;
END;
