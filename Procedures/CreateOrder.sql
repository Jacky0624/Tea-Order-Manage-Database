CREATE PROCEDURE CreateOrder
    @Phone NVARCHAR(20),
    @Title NVARCHAR(255),
    @Address NVARCHAR(500),
    @OrderStatus INT,
    @TotalAmount DECIMAL(10,2),
    @Remark NVARCHAR(MAX), 
	@OrderDate DATETIME,
    @CreateUser NVARCHAR(100),
    @NewOrderId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Orders (Phone, Title, Address, OrderStatus, TotalAmount, Remark, OrderDate, CreateAt, CreateUser, ModifyAt, ModifyUser)  
    VALUES (@Phone, @Title, @Address, @OrderStatus, @TotalAmount, @Remark, @OrderDate, GETDATE(), @CreateUser, GETDATE(), @CreateUser);

    SET @NewOrderId = SCOPE_IDENTITY();
END;
