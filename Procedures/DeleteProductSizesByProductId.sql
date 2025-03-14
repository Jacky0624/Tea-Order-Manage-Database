CREATE PROCEDURE DeleteProductSizesByProductId
    @ProductId INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ProductSizes
    SET isDeleted = 1
    WHERE ProductId = @ProductId;
END;