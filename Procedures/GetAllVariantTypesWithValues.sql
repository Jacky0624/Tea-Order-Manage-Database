CREATE PROCEDURE GetAllVariantTypesWithValues
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        vtypes.Id AS VariantTypeId, vtypes.TypeName,
        vValue.Id AS VariantValueId, vValue.Value, vValue.ExtraPrice
    FROM VariantTypes vtypes
    LEFT JOIN VariantValues vValue ON vtypes.Id = vValue.VariantTypeId;
END;
