CREATE PROCEDURE GetAllVariantTypes
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, TypeName FROM VariantTypes;
END;
