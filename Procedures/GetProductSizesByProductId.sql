CREATE PROCEDURE GetProductSizesByProductId
    @ProductId INT,
    @IncludeDeleted BIT = 0 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, ProductId, Size, Price, isDeleted
    FROM ProductSizes
    WHERE ProductId = @ProductId
    AND (@IncludeDeleted = 1 OR isDeleted = 0);
END;
