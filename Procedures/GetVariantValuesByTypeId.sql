CREATE PROCEDURE GetVariantValuesByTypeId
    @VariantTypeId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, VariantTypeId, Value, ExtraPrice 
    FROM VariantValues 
    WHERE VariantTypeId = @VariantTypeId;
END;
