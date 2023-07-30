create database AddressBookApplication
use AddressBookApplication

create table Contact(
	ContactId int primary key identity(1,1),
	Name varchar(50) not null,
	Phone varchar(50),
	State varchar(50),
	City varchar(50),
	Zipcode varchar(50));

create table ContactEmail(
	Id int primary key identity(1,1),
	ContactId int foreign key references Contact(ContactId),
	Email varchar(100));

insert into Contact (Name, Phone, State, City, ZipCode) Values
('Harish', '+91 8654235478', 'Maharashtra', 'Pune', '563 110'),
('Vishwa', '+91 8642351478', 'Maharashtra', 'Mumbai', '562 106'),
('Nanditha', '+91 9754235478', 'Telangana', 'Hyderabad', '573 002'),
('Srinivas', '+91 8654274581', 'Kerala', 'Munnar', '563 130'),
('Krishna', '+91 7954235492', 'Karnataka', 'Mysore', '537 400');

select * from Contact

insert into ContactEmail(ContactId, Email) Values
(1, 'harish1@gmail.com'),
(1, 'harish222@gmail.com'),
(2, 'vishwa@yahoo.com'),
(3, 'nanditha@gmail.com'),
(4, 'srinivas@gmail.com'),
(4, 'srinivasa@gmail.com'),
(4, 'srinivas@yahoo.com'),
(5, 'krishna@gmail.com'),
(5, 'krishnaTrades@gmail.com');

select * from ContactEmail