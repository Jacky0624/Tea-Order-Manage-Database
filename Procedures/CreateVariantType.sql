CREATE PROCEDURE CreateVariantType
    @TypeName NVARCHAR(50),
    @NewId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO VariantTypes (TypeName)
    OUTPUT INSERTED.Id
    VALUES (@TypeName);

    SET @NewId = SCOPE_IDENTITY();
END;
