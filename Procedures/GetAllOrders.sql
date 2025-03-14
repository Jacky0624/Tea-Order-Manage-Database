CREATE PROCEDURE GetAllOrders
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, Phone, Title, Address, OrderStatus, TotalAmount, CreateAt, CreateUser, ModifyAt, ModifyUser, Remark, OrderDate
    FROM Orders;
END;
