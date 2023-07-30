create database OrderManagementSystem
use OrderManagementSystem

create table Customers(
	CustomerId int primary key identity(1,1),
	FirstName varchar(50) not null,
	LastName varchar(50),
	EmailId varchar(100));

create table Orders(
	OrderId int primary key identity(1,1),
	CustomerId int foreign key references Customers(CustomerId),
	OrderDate date check (OrderDate >= GetDate()),
	OrderTotal Decimal (10, 2));

INSERT INTO Customers (FirstName, LastName, EmailId) VALUES 
('John', 'Doe', 'johndoe@example.com'),
('Jane', 'Smith', 'janesmith@example.com'),
('David', 'Johnson', 'davidjohnson@example.com'),
('Michael', 'Brown', 'michaelbrown@example.com'),
('Emily', 'Davis', 'emilydavis@example.com');

INSERT INTO Orders (CustomerId, OrderDate, OrderTotal) VALUES 
(1, '2023-08-07', 150.99),
(1, '2023-08-10', 249.95),
(2, '2023-08-09', 89.99),
(2, '2023-08-12', 199.50),
(3, '2023-08-08', 50.00),
(3, '2023-08-11', 129.99),
(4, '2023-08-13', 75.00),
(4, '2023-08-14', 299.99),
(5, '2023-08-15', 199.99),
(5, '2023-08-17', 79.95);


select * from Customers
select * from Orders

CREATE PROCEDURE AddNewCustomerOrder
	@FirstName varchar(50),
	@LastName varchar(50),
	@EmailId varchar(100),
	@OrderDate date,
	@OrderTotal Decimal(10,2)
AS
BEGIN
	DECLARE @customerId int
	INSERT INTO Orders VALUES (@firstName, @lastName, @emailId);
	SET @customerId = SCOPE_IDENTITY();
	INSERT INTO Orders VALUES (@customerId, @orderDate, @orderTotal)
END


CREATE PROCEDURE AddNewCustomerOrderUsingTransaction
	@firstName VARCHAR(50),
	@lastName VARCHAR(50),
	@emailId VARCHAR(100),
	@orderDate DATE,
	@orderTotal DECIMAL(10,2)
AS
BEGIN
	
	BEGIN TRANSACTION
	DECLARE @customerId INT

	BEGIN TRY
		INSERT INTO Customers VALUES (@firstName, @lastName, @emailId);
		SET @customerId = SCOPE_IDENTITY();
		INSERT INTO Orders VALUES (@customerId, @orderDate, @orderTotal)

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END


CREATE PROCEDURE GetOrderDetails
AS
BEGIN
	SELECT [FirstName],[LastName],[Orderdate],[OrderTotal] FROM Customers JOIN Orders ON Customers.CustomerId = Orders.CustomerId
END