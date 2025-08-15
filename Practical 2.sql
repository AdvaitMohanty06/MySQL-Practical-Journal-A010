create database BookStore;
use BookStore;

create table IF NOT EXISTS Authors(
AuthID INT Primary Key,
Name varchar(40) NOT NULL,
Country varchar(20),
DOB Date
);

create table IF NOT EXISTS Categories(
CategoryID INT Primary Key,
CategoryName varchar(30)
);

create table IF NOT EXISTS Books(
BookID INT Primary Key,
Title varchar(30) UNIQUE,
AuthID INT,
CategoryID INT,
Price INT check (Price > 0), 
Stock INT check (Stock >= 0),
PublishedYear YEAR DEFAULT (YEAR(CURDATE())),
Foreign Key (AuthID) references Authors(AuthID),
Foreign Key (CategoryID) references Categories(CategoryID)
);

create table IF NOT EXISTS Customers(
CustomerID INT Primary Key,
Name varchar(30) NOT NULL,
Email varchar(50) UNIQUE,
Phone varchar(10) UNIQUE,
Address varchar(250) UNIQUE
);

alter table Customers ADD CONSTRAINT chk_phone CHECK(Phone REGEXP'^[789]');
alter table Customers modify Phone varchar(10) NOT NULL;
alter table Customers add DOB Date;


create table Orders(
Order_ID INT Primary Key,
CustomerID INT,
OrderDate Date,
Status varchar(20) DEFAULT ('Pending'),
Foreign Key(CustomerID) References Customers(CustomerID)
);

create table OrderDetails(
Order_ID INT,
BookID INT,
Quantity INT check (Quantity > 0),
Price DECIMAL(10,2) check (Price > 0.01),
Primary Key (Order_ID, BookID),
Foreign Key (Order_ID) references Orders(Order_ID),
Foreign Key (BookID) references Books(BookID)
);

create table Payments(
Payment_ID INT Primary Key,
Order_ID INT,
Amount INT,
PaymentDate Date,
Method Varchar(20) default('Cash'),
Foreign Key (Order_ID) references Orders(Order_ID)
);

alter table Books modify Price INT check (Price >= 0 AND Price < 10000);
alter table Books add ISBN INT;
alter table Books modify ISBN INT UNIQUE;
alter table Books modify Stock TINYINT;
alter table Books rename Column PublishedYear to YearPublished;
alter table Customers drop Column DOB;

show create table Orders;
alter table Orders drop Foreign Key orders_ibfk_1;
alter table OrderDetails add Column Discount INT default(0);
alter table OrderDetails alter Discount drop default;
alter table Books drop Column ISBN;

show create table Books;
alter table Books drop CHECK books_chk_3;


create table DeliveryAgents(
DeliveryAgentID INT Primary Key,
Name varchar(20),
Phone varchar(10),
Region varchar(5)  DEFAULT ('North'),
CHECK (Region in ('North','South','East','West'))
);

alter table DeliveryAgents add column Email varchar(50) UNIQUE;
alter table DeliveryAgents modify Phone varchar(10);

alter table Orders add Column DeliveryAgentID INT;
alter table Orders add Constraint fk_delivery Foreign Key (DeliveryAgentID)
references DeliveryAgents(DeliveryAgentID);

alter table DeliveryAgents drop Email;
alter table DeliveryAgents rename to DeliveryTeam;

alter table DeliveryTeam drop CHECK deliveryteam_chk_1;
alter table DeliveryTeam rename Column Region to AssignedRegion;
alter table DeliveryTeam add constraint CHECK (AssignedRegion in ('North','South','East','West'));

SET SQL_SAFE_UPDATES = 0;
delete from DeliveryTeam;

show create table Orders;
alter table Orders drop Foreign Key fk_delivery;
drop table DeliveryTeam;

delete from Payments;
delete from OrderDetails;

drop table Payments;
drop table DeliveryTeam;
alter table Books rename to BookInventory;
alter table Customers rename to Clients;
alter table Clients rename Column Name to FullName;
alter table BookInventory rename Column Title to BookTitle;
alter table BookInventory rename to Books;

show create table OrderDetails;
alter table OrderDetails drop Foreign Key orderdetails_ibfk_1;
alter table OrderDetails drop Foreign Key orderdetails_ibfk_2;

create view TopSellingBooks as select 
Books.BookID, Books.BookTitle, OrderDetails.Quantity from 
Books join OrderDetails on Books.BookID = OrderDetails.BookID;

create table Payments(
Payment_ID INT Primary Key,
Order_ID INT,
Amount INT,
PaymentDate Date,
Method Varchar(20) default('Cash'),
Foreign Key (Order_ID) references Orders(Order_ID)
);
alter table Payments modify Method varchar(20) default('Card');

create table OrderNotes(
Notes varchar(500) NOT NULL);
alter table Books drop index ISBN;

show create table Books;
alter table Books drop CHECK BookInventory_chk_1;

create table ReturnRequests(
ReturnID INT Primary Key,
Order_ID INT,
Reason varchar(50),
Status varchar(10) default ('Pending'),
Foreign Key (Order_ID) references Orders(Order_ID)
);

alter table ReturnRequests add Column ReturnDate Date;
alter table ReturnRequests drop Column ReturnDate;
alter table ReturnRequests add Foreign Key (Order_ID) references Orders(Order_ID);

show create table ReturnRequests;
alter table ReturnRequests drop Foreign Key returnrequests_ibfk_1;

show create table Clients;
show create table Books;
create table wishlists(
CustomerID INT, 
BookID INT,
Primary Key(BookID, CustomerID)
);

alter table Wishlists add Column DateAdded date;
alter table Wishlists drop DateAdded;
alter table Wishlists rename to CustomerWishlists;
alter table CustomerWishlists rename to Wishlists;

alter table Authors rename Column Name to Author_Name;
alter table Clients rename Column FullName to Client_Name;
alter table Books rename to BookDetails;
alter table Wishlists rename to BookRequests;
alter table ReturnRequests rename Column Reason to Reason_for_Return;

alter table Authors rename Column Author_Name to Name;
alter table Clients rename Column Client_Name to FullName;
alter table BookDetails rename to Books;
alter table BookRequests rename to Wishlists;
alter table ReturnRequests rename Column Reason_for_return to Reason;

drop table Books;

create table Books(
BookID INT Primary Key,
BookTitle varchar(30) Unique,
AuthID INT Unique,
CategoryID INT Unique, 
Price INT CHECK (Price >= 0  AND Price < 10000),
Stock TINYINT,
YearPublished INT,
Foreign Key (AuthID) references Authors(AuthID),
Foreign Key (CategoryID) references Categories(CategoryID)
);

create table DeliveryAgents(
DeliveryAgentID INT Primary Key,
Name varchar(20),
Phone varchar(10),
Region varchar(5)  DEFAULT ('North'),
CHECK (Region in ('North','South','East','West'))
);

create table DeliveryLogs(
LogID INT Primary Key,
DeliveryAgentID INT,
Date Date,
Status varchar(20),
Foreign Key (DeliveryAgentID) references DeliveryAgents(DeliveryAgentID)
);

alter table DeliveryLogs add Column Comments varchar(70);
alter table DeliveryLogs drop Column Comments;
alter table DeliveryLogs add Constraint CHECK(Status in ('Delivered','Pending','Failed'));

show create table DeliveryLogs;
alter table DeliveryLogs drop CHECK deliverylogs_chk_1;

alter table Books add Column Ratings varchar(30);
alter table Books modify Ratings Decimal(10,2);
alter table Books drop Column Ratings;

create table BookReview(
ReviewID INT Primary Key,
BookID INT,
CustomerID INT,
ReviewText varchar(20),
Foreign Key (BookID) references Books(BookID),
Foreign Key (CustomerID) references Clients(CustomerID)
);

alter table BookReview add Column Stars INT NOT NULL CHECK (Stars in (1,2,3,4,5));
alter table BookReview modify Stars INT NULL;

drop table BookReviews;

create table BookReview(
ReviewID INT Primary Key,
BookID INT,
CustomerID INT,
ReviewText varchar(20),
Stars INT NULL CHECK (Stars in (1,2,3,4,5)),
Foreign Key (BookID) references Books(BookID),
Foreign Key (CustomerID) references Clients(CustomerID)
);

alter table BookReview add Foreign Key (BookID) references Books(BookID);
alter table BookReview add Foreign Key (CustomerID) references Clients(CustomerID);

show create table BookReview;
alter table BookReview drop constraint bookreview_ibfk_1;
alter table BookReview drop constraint bookreview_ibfk_2;
alter table BookReview drop constraint bookreview_ibfk_3;
alter table BookReview drop constraint bookreview_ibfk_4;

drop table BookReview;

create table Coupons(
CouponID INT,
Code varchar(20) UNIQUE,
Discount INT,
ExpiryDate Date
);

alter table Coupons add Column Status varchar(10) default('Active');
alter table Coupons add Constraint CHECK (Discount > 1 and Discount < 50);

show create table Coupons;
alter table Coupons drop Constraint coupons_chk_1;
