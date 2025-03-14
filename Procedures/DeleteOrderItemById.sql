CREATE PROCEDURE DeleteOrderItemById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM OrderItems WHERE Id = @Id;
END;
