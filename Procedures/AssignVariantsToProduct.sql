CREATE PROCEDURE AssignVariantsToProduct
    @VariantTable ProductVariantTableType READONLY
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM ProductVariantOptions WHERE ProductId IN (SELECT DISTINCT ProductId FROM @VariantTable);

    INSERT INTO ProductVariantOptions (ProductId, VariantValueId)
    SELECT vt.ProductId, vt.VariantValueId
    FROM @VariantTable vt
    WHERE NOT EXISTS (
        SELECT 1 FROM ProductVariantOptions pvo 
        WHERE pvo.ProductId = vt.ProductId AND pvo.VariantValueId = vt.VariantValueId
    );
END;
