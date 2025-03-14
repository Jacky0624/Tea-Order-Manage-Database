CREATE PROCEDURE GetOrderById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id, Phone, Title, Address, OrderStatus, TotalAmount, OrderDate, CreateAt, CreateUser, ModifyAt, ModifyUser, Remark
    FROM Orders
    WHERE Id = @Id;
END;
