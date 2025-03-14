CREATE PROCEDURE GetAllVariantValues
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, VariantTypeId, Value, ExtraPrice FROM VariantValues;
END;
