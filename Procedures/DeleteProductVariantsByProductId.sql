CREATE PROCEDURE DeleteProductVariantsByProductId
    @ProductId INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM ProductVariantOptions 
    WHERE ProductId = @ProductId;
END;