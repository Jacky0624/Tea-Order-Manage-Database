CREATE PROCEDURE UpdateProductSizes
    @ProductId INT,
    @Sizes ProductSizeTableType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ps
    SET ps.Price = s.Price
    FROM ProductSizes ps
    INNER JOIN @Sizes s ON ps.Id = s.Id
    WHERE ps.isDeleted = 0;

    UPDATE ps
    SET ps.isDeleted = 0, ps.Price = s.Price
    FROM ProductSizes ps
    INNER JOIN @Sizes s ON ps.ProductId = s.ProductId AND ps.Size = s.Size
    WHERE ps.isDeleted = 1;

    INSERT INTO ProductSizes (ProductId, Size, Price, isDeleted)
    SELECT s.ProductId, s.Size, s.Price, 0
    FROM @Sizes s
    LEFT JOIN ProductSizes ps ON s.ProductId = ps.ProductId AND s.Size = ps.Size
    WHERE ps.Id IS NULL;
 
    UPDATE ProductSizes
    SET isDeleted = 1
    WHERE ProductId = @ProductId
    AND Size NOT IN (SELECT Size FROM @Sizes);
END;
