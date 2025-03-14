CREATE PROCEDURE DeleteOrder
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM OrderItems WHERE OrderId = @Id; 
    DELETE FROM Orders WHERE Id = @Id;
END;
