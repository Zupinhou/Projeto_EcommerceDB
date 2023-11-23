CREATE TABLE tbCustomers (
    CPF VARCHAR(11) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Birthday DATE,
    Age SMALLINT,
    Gender VARCHAR(1),
    CreditLimit FLOAT,
    PurchaseVolume FLOAT,
    FirstPurchase BIT
);

CREATE TABLE tbSellers (
    SellerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    Email VARCHAR(100),
    HireDate DATE,
    CommissionRate DECIMAL(5, 2)
);

CREATE TABLE tbProduct (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    Weight DECIMAL(7, 2),
    ReleaseDate DATE
);

CREATE TABLE tbOrder (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    CustomerCPF VARCHAR(11),
    SellerID INT,
    OrderDate DATE,
    Status VARCHAR(20),
    Quantity DECIMAL(10,2),
    Price DECIMAL(10,2),
    FOREIGN KEY (CustomerCPF) REFERENCES tbCustomers(CPF),
    FOREIGN KEY (ProductID) REFERENCES tbProduct(ProductID),
    FOREIGN KEY (SellerID) REFERENCES tbSellers(SellerID)
);

CREATE TABLE tbPayment (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES tbOrder(OrderID)
);

CREATE TABLE tbAddress (
    AddressID INT PRIMARY KEY,
    CustomerCPF VARCHAR(11),
    SellerID INT,
    Street VARCHAR(150),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    FOREIGN KEY (CustomerCPF) REFERENCES tbCustomers(CPF),
    FOREIGN KEY (SellerID) REFERENCES tbSellers(SellerID)
);

CREATE TABLE tbPhone (
    PhoneID INT PRIMARY KEY,
    CustomerCPF VARCHAR(11),
    SellerID INT,
    PhoneNumber VARCHAR(11),
    FOREIGN KEY (CustomerCPF) REFERENCES tbCustomers(CPF),
    FOREIGN KEY (SellerID) REFERENCES tbSellers(SellerID)
);
