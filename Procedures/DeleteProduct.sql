CREATE PROCEDURE DeleteProduct
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Products
    SET IsDeleted = 1
    WHERE Id = @Id;
END;
