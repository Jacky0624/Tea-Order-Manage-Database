CREATE PROCEDURE GetVariantValuesByIds
    @VariantValueIds dbo.IntList READONLY
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, VariantTypeId, Value, ExtraPrice 
    FROM VariantValues
    WHERE Id IN (SELECT Id FROM @VariantValueIds);
END;
