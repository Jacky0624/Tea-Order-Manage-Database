CREATE TABLE Roles (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL UNIQUE, 
    Description NVARCHAR(255) NULL
);

CREATE TABLE Users (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(100) NOT NULL,
    Account NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    RoleId INT NOT NULL,

    IsDeleted BIT NOT NULL DEFAULT 0,

    CreateAt DATETIME NOT NULL DEFAULT GETUTCDATE(),
    CreateUser NVARCHAR(100) NOT NULL,

    ModifyAt DATETIME NOT NULL DEFAULT GETUTCDATE(),
    ModifyUser NVARCHAR(100) NULL,

    DeleteAt DATETIME NULL, 
    DeleteUser NVARCHAR(100) NULL,

	FOREIGN KEY (RoleId) REFERENCES Roles(Id) ON DELETE CASCADE
);

CREATE TABLE Permissions (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(255) NULL
);

CREATE TABLE RolePermissions (
    RoleId INT NOT NULL,
    PermissionId INT NOT NULL,
    PRIMARY KEY (RoleId, PermissionId),
    FOREIGN KEY (RoleId) REFERENCES Roles(Id) ON DELETE CASCADE,
    FOREIGN KEY (PermissionId) REFERENCES Permissions(Id) ON DELETE CASCADE
);

CREATE TABLE UserPermissions (
    UserId INT NOT NULL,
    PermissionId INT NOT NULL,
    PRIMARY KEY (UserId, PermissionId),
    FOREIGN KEY (UserId) REFERENCES Users(Id) ON DELETE CASCADE,
    FOREIGN KEY (PermissionId) REFERENCES Permissions(Id) ON DELETE CASCADE
);
INSERT INTO [TeaOrder].[dbo].[Permissions] ([Name], [Description])
VALUES 
    ('ORDER_MANAGE', '訂單管理'),
    ('PRODUCT_MANAGE', '商品管理'),
    ('ACCOUNT_MANAGE', '帳號管理');

INSERT INTO [TeaOrder].[dbo].[Roles] ([Name], [Description])
VALUES 
    ('Admin', '系統管理員'),
    ('Manager', '管理者'),
    ('User', '一般使用者');


INSERT INTO [TeaOrder].[dbo].[RolePermissions] ([RoleId], [PermissionId])
VALUES 
    (1, 1), 
    (1, 2), 
    (1, 3);

INSERT INTO [TeaOrder].[dbo].[RolePermissions] ([RoleId], [PermissionId])
VALUES 
    (2, 1),
    (2, 2); 

INSERT INTO [TeaOrder].[dbo].[RolePermissions] ([RoleId], [PermissionId])
VALUES 
    (3, 1); 

CREATE TABLE ProductCategories (
    Id INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CreateUser NVARCHAR(100) NOT NULL,
    ModifyAt DATETIME NOT NULL DEFAULT GETDATE(),
    ModifyUser NVARCHAR(100) NULL
);

INSERT INTO ProductCategories (CategoryName, Description, IsActive, CreatedAt, CreateUser, ModifyAt, ModifyUser)
VALUES ('茶類', '有關茶產品', 1, GETDATE(), 'admin', GETDATE(), NULL);

CREATE TABLE Products (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    ImageUrl NVARCHAR(500) NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    CategoryId INT NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CreateUser NVARCHAR(100) NOT NULL,
    ModifyAt DATETIME NOT NULL DEFAULT GETDATE(),
    ModifyUser NVARCHAR(100) NULL,
    FOREIGN KEY (CategoryId) REFERENCES ProductCategories(Id)
);

CREATE TABLE ProductSizes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductId INT NOT NULL,
    Size NVARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
	IsDeleted BIT DEFAULT 0 NOT NULL,
    CONSTRAINT UQ_Product_Size UNIQUE (ProductId, Size),
    CONSTRAINT FK_ProductSize_Product FOREIGN KEY (ProductId) REFERENCES Products(Id)
);


CREATE TYPE ProductSizeTableType AS TABLE
(
    Id INT NULL,
    ProductId INT NOT NULL,
    Size NVARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE VariantTypes (
    Id INT PRIMARY KEY IDENTITY(1,1),
    TypeName NVARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO VariantTypes (TypeName) VALUES 
('甜度'), ('冰塊'), ('加料');
CREATE TABLE VariantValues (
    Id INT PRIMARY KEY IDENTITY(1,1),
    VariantTypeId INT NOT NULL,
    Value NVARCHAR(50) NOT NULL UNIQUE,
    ExtraPrice DECIMAL(10,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_VariantValues_VariantTypes FOREIGN KEY (VariantTypeId) REFERENCES VariantTypes(Id)
);
INSERT INTO VariantValues (VariantTypeId, Value, ExtraPrice) VALUES 
(1, '全糖', 0), (1, '半糖', 0), (1, '無糖', 0),
(2, '正常冰', 0), (2, '少冰', 0), (2, '去冰', 0), (2, '溫', 0), (2, '熱', 0), 
(3, '珍珠', 10), (3, '椰果', 10), (3, '布丁', 15), (3, '不加料', 0);
CREATE TABLE ProductVariantOptions (
    ProductId INT NOT NULL,
    VariantValueId INT NOT NULL,
    CONSTRAINT PK_ProductVariantOptions PRIMARY KEY (ProductId, VariantValueId),
    CONSTRAINT FK_ProductVariantOptions_Product FOREIGN KEY (ProductId) REFERENCES Products(Id),
    CONSTRAINT FK_ProductVariantOptions_VariantValue FOREIGN KEY (VariantValueId) REFERENCES VariantValues(Id)
);
CREATE TYPE ProductVariantTableType AS TABLE (
    ProductId INT NOT NULL,
    VariantValueId INT NOT NULL
);

CREATE TABLE Orders (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Phone NVARCHAR(20) NOT NULL,
    Title NVARCHAR(255) NOT NULL,
    Address NVARCHAR(500) NOT NULL,
    OrderStatus INT NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL DEFAULT 0, 
    OrderDate DATETIME NOT NULL,
    CreateAt DATETIME NOT NULL DEFAULT GETDATE(),
    CreateUser NVARCHAR(100) NOT NULL,
    ModifyAt DATETIME NOT NULL DEFAULT GETDATE(),
    ModifyUser NVARCHAR(100) NULL,
    Remark NVARCHAR(MAX) NULL
);


CREATE TABLE OrderItems (
    Id INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    ProductName NVARCHAR(255) NOT NULL,
    ProductSizeId INT NOT NULL, 
    ProductSizeName NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
	Count INT NOT NULL,
    Remark NVARCHAR(MAX) NULL,
    CreateAt DATETIME NOT NULL DEFAULT GETDATE(),
    CreateUser NVARCHAR(100) NOT NULL,
    CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (OrderId) REFERENCES Orders(Id),
    CONSTRAINT FK_OrderItems_Products FOREIGN KEY (ProductId) REFERENCES Products(Id),
    CONSTRAINT FK_OrderItems_ProductSizes FOREIGN KEY (ProductSizeId) REFERENCES ProductSizes(Id)
);

CREATE TABLE OrderItemOptions (
    OrderItemId INT NOT NULL, 
    VariantTypeId INT NOT NULL, 
    VariantType NVARCHAR(100) NOT NULL,
    VariantValueId INT NOT NULL, 
    VariantValue NVARCHAR(100) NOT NULL, 
    ExtraValue DECIMAL(10,2) NOT NULL DEFAULT 0, 
    CONSTRAINT PK_OrderOptions PRIMARY KEY (OrderItemId, VariantTypeId),
    CONSTRAINT FK_OrderOptions_OrderItems FOREIGN KEY (OrderItemId) REFERENCES OrderItems(Id) ON DELETE CASCADE,
    CONSTRAINT FK_OrderOptions_VariantTypes FOREIGN KEY (VariantTypeId) REFERENCES VariantTypes(Id),
    CONSTRAINT FK_OrderOptions_VariantValues FOREIGN KEY (VariantValueId) REFERENCES VariantValues(Id)
);

CREATE TYPE OrderItemOptionsTableType AS TABLE
(
    OrderItemId INT NOT NULL,
    VariantTypeId INT NOT NULL,
    VariantType NVARCHAR(100) NOT NULL,
    VariantValueId INT NOT NULL,
    VariantValue NVARCHAR(100) NOT NULL,
    ExtraValue DECIMAL(10,2) NOT NULL DEFAULT 0
);

CREATE TYPE OrderItemTableType AS TABLE
(
    OrderId INT,
    ProductId INT,
    ProductName NVARCHAR(255),
    ProductSizeId INT,
    ProductSizeName NVARCHAR(100),
    Count INT, 
    Price DECIMAL(10,2),
    Remark NVARCHAR(MAX),
    CreateUser NVARCHAR(100)
);
