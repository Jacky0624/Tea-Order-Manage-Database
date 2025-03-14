CREATE PROCEDURE GetVariantTypeById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, TypeName FROM VariantTypes WHERE Id = @Id;
END;