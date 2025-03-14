CREATE PROCEDURE ModifyOrder
    @Id INT,
    @Phone NVARCHAR(20),
    @Title NVARCHAR(255),
    @Address NVARCHAR(500),
    @OrderStatus INT,
    @TotalAmount DECIMAL(10,2),
	@OrderDate DATETIME,
    @ModifyUser NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Orders
    SET Phone = @Phone,
        Title = @Title,
        Address = @Address,
        OrderStatus = @OrderStatus,
        TotalAmount = @TotalAmount,
		OrderDate = @OrderDate,
        ModifyAt = GETDATE(),
        ModifyUser = @ModifyUser
    WHERE Id = @Id;
END;
