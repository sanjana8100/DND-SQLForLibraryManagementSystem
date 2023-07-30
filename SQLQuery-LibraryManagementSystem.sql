create database LibraryManagementSystem
use LibraryManagementSystem

create table GenreDetails(
	GenreId int primary key identity(1,1),
	GenreName varchar(50) not null);

create table BorrowerDetails(
	BorrowerId int primary key identity(1,1),
	BorrowerName varchar(50) not null,
	Address varchar(150),
	Phone varchar(50));

create table AuthorDetails(
	AuthorId int primary key identity(1,1),
	AuthorName varchar(50) not null);

create table Books(
	BookId int primary key identity(1,1),
	BookName varchar(50) not null,
	AuthorId int foreign key references AuthorDetails(AuthorId) not null,
	GenreId int foreign key references GenreDetails(GenreId) not null,
	IsBookAvailable bit not null,
	BorrowerId int foreign key references BorrowerDetails(BorrowerId));


insert into BorrowerDetails (BorrowerName, Address, Phone) Values
('Lohith', 'MG Road', '+91 7854236945'),
('Mahathi', 'Commercial Street', '+91 8756412358'),
('Saleem', 'Electronic City', '+91 7895454122'),
('Arshiya', 'JP Nagar', '+91 9456214785'),
('Naveen', 'Indiranagar', '+91 9845321478'),
('Swathi', 'Koramangala', '+91 8756123457');

select * from BorrowerDetails

insert into GenreDetails (GenreName) values
('Fiction'),
('Mystery'),
('Romance'),
('Thriller'),
('Fantasy'),
('Comedy'),
('Horror');

select * from GenreDetails

insert into AuthorDetails (AuthorName) values
('Bram Stoker'),
('Mary Shelly'),
('Stephanie Meyer'),
('Nicholas Sparks'),
('Gillian Flynn'),
('Neil Gaiman'),
('J K Rowling'),
('Agatha Christie'),
('Emma Donoghue');

select * from AuthorDetails

insert into Books (BookName, AuthorId, GenreId, IsBookAvailable, BorrowerId) values
('Room', 9, 1, 0, 5);

insert into Books (BookName, AuthorId, GenreId, IsBookAvailable) values
('Drakula', 1, 7, 1);

insert into Books (BookName, AuthorId, GenreId, IsBookAvailable, BorrowerId) values
('Harry Potter', 7, 5, 0, 2),
('Frankenstein', 2, 7, 0, 4),
('Gone Girl', 5, 4, 0, 3),
('Crooked House', 8, 2, 0, 6);

insert into Books (BookName, AuthorId, GenreId, IsBookAvailable) values
('Twilight', 3, 3, 1),
('Neverwhere', 6, 5, 1);

insert into Books (BookName, AuthorId, GenreId, IsBookAvailable, BorrowerId) values
('The Notebook', 4, 3, 0, 5),
('The Casual Vacancy', 7, 6, 0, 1),
('The Wonder', 9, 7, 0, 2);

select * from Books
