CREATE PROCEDURE GetAllProductSizes
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Id, 
        ProductId, 
        Size, 
        Price 
    FROM ProductSizes;
END;
