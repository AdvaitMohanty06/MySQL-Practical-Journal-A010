# Brief Overview 
This practical deals with just one database, for an online bookstore. Here, many changes will be made to the schema, and changes will be made to the constraints. This practical has been divided into many sections. E.R. diagrams have also been made at each stage. 

# Section A - Table Creation and Constraints

Q1. Create a table Authors with the following attributes:
- AuthorID (Primary Key)
- Name (Required)
- Country
- Date of Birth (DOB)

A1. 
```sql
create table IF NOT EXISTS Authors(
AuthID INT Primary Key,
Name varchar(40) NOT NULL,
Country varchar(20),
DOB Date
);
```

Q2. Create a table Categories with:
- CategoryID (Primary Key)
- CategoryName (must be unique)

A2. 
```sql
create table IF NOT EXISTS Categories(
CategoryID INT Primary Key,
CategoryName varchar(30)
);
```

Q3. Create a table Books with these attributes:
- BookID (Primary Key)
- Title (must be unique)
- AuthorID (Foreign Key)
- CategoryID (Foreign Key)
- Price (must be > 0)
- Stock (must be >= 0)
- PublishedYear (Default to current year)

A3. 
```sql
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
```

Q4. Add appropriate foreign key constraints in Books referencing Authors and Categories.

A4. Required constraints have already been added. However, if they had to be added, then this is what they would look like. 
```sql
alter table Books add Foreign Key (AuthID) references Authors(AuthID);
alter table Books add Foreign Key (CategoryID) references Categories(CategoryID);
```

Q5. Create a table Customers with:
- CustomerID (Primary Key)
- Name (Required)
- Email (must be unique)
- Phone
- Address

A5. 
```sql
create table IF NOT EXISTS Customers(
CustomerID INT Primary Key,
Name varchar(30) NOT NULL,
Email varchar(50) UNIQUE,
Phone varchar(10) UNIQUE,
Address varchar(250) UNIQUE
);
```

Q6. Add a CHECK constraint on the Phone column in Customers to ensure phone numbers start with
7, 8, or 9.

A6. 
```sql
alter table Customers ADD CONSTRAINT chk_phone CHECK(Phone REGEXP'^[789]');
```

Q7. Modify the Phone column in Customers to make it NOT NULL.

A7.
```sql
alter table Customers modify Phone varchar(10) NOT NULL;
```

Q8. Add a new column DateOfBirth to Customers.

A8.
```sql
alter table Customers add DOB Date;
```

Q9. Create a table Orders with:
- OrderID (Primary Key)
- CustomerID (Foreign Key)
- OrderDate
- Status (Default value: 'Pending')

A9. 
```sql
create table Orders(
Order_ID INT Primary Key,
CustomerID INT,
OrderDate Date,
Status varchar(20) DEFAULT ('Pending'),
Foreign Key(CustomerID) References Customers(CustomerID)
);
```

Q10. Create a table OrderDetails with:
- OrderID (Foreign Key)
- BookID (Foreign Key)
- Quantity (must be > 0)
- Price (must be > 0.01)
- Primary key should be a combination of OrderID and BookID

A10. 
```sql
create table OrderDetails(
Order_ID INT,
BookID INT,
Quantity INT check (Quantity > 0),
Price DECIMAL(10,2) check (Price > 0.01),
Primary Key (Order_ID, BookID),
Foreign Key (Order_ID) references Orders(Order_ID),
Foreign Key (BookID) references Books(BookID)
);
```

Q11. Create a table Payments with:
- PaymentID (Primary Key)
- OrderID (Foreign Key)
- Amount
- PaymentDate
- Method (Default to 'Cash')

A11. 
```sql
create table Payments(
Payment_ID INT Primary Key,
Order_ID INT,
Amount INT,
PaymentDate Date,
Method Varchar(20) default('Cash'),
Foreign Key (Order_ID) references Orders(Order_ID)
);
```

Q12. Create all foreign key relationships in the tables above. 

A12. Again, all foreign key relationships have been created and made. If they had to be added, they would be written like this. 
```sql
alter table Payments add Foreign Key (Order_ID) references Orders(Order_ID);
alter table OrderDetails Foreign Key (Order_ID) references Orders(Order_ID);
alter table OrderDetails Foreign Key (BookID) references Books(BookID);
```

# Section B - Altering Tables and adding Constraints

Q13. Add a CHECK constraint on the Price column of Books so it cannot exceed 10,000.

A13. 
```sql
alter table Books modify Price INT check (Price >= 0 AND Price < 10000);
```

Q14. Add a UNIQUE constraint to ISBN column in the Books table.

A14.
```sql
alter table Books modify ISBN INT UNIQUE;
```

Q15. Add a new column ISBN to the Books table.

A15. 
```sql
alter table Books add ISBN INT;
```

**Note** :- Chronologically, query A15 will come before A14.

Q16. Modify the Stock column in Books to be of type TINYINT.

A16
```sql
alter table Books modify Stock TINYINT;
```

Q17. Rename the column PublishedYear in Books to YearPublished.

A17. 
```sql
alter table Books rename Column PublishedYear to YearPublished;
```

Q18. Drop the column DateOfBirth from the Customers table.

A18.
```sql
alter table Customers drop Column DOB;
```

**Note** :- As it references a table that has not been created, Q19 has been skipped for now. It will be featured in the next question. 

Q20. Drop the foreign key constraint from Orders referencing Customers.

A20. Here, to know the name of the foreign key constraint, we use the first, query, then we put in the name of the constraint in the second query.
```sql
show create table Orders;
alter table Orders drop Foreign Key orders_ibfk_1;
```

Q21. Add a column Discount to OrderDetails with default value 0.

A21. 
```sql
alter table OrderDetails add Discount INT default(0);
```

Q22. Drop the default value from the Discount column in OrderDetails.

A22.
```sql
alter table OrderDetails alter Discount drop default;
```

Q23. Drop the ISBN constraint from the Books table.

A23. We see only one constraint from the 'show create' query, so we can remove that.
```sql
show create table Books;
alter table Books alter ISBN drop default;
```

Q24. Drop the CHECK constraint on Price in the Books table.

A24. 
```sql
show create table Books;
alter table Books drop CHECK books_chk_3;
```

# Section C - Delivery Agents Table

Q33. Create a table DeliveryAgents with:
- AgentID (Primary Key)
- Name
- Phone (Unique)
- Region (must be one of: 'North', 'South', 'East', 'West')
- Default region should be 'North'

A33. 
```sql
create table DeliveryAgents(
DeliveryAgentID INT Primary Key,
Name varchar(20),
Phone varchar(10),
Region varchar(5)  DEFAULT ('North'),
CHECK (Region in ('North','South','East','West'))
);
```

Q34. Add an Email column (unique) to DeliveryAgents.

A34. 
```sql
alter table DeliveryAgents add column Email varchar(50) UNIQUE;
```

Q35. Modify the Phone column in DeliveryAgents to type VARCHAR(10).

A35.
```sql
alter table DeliveryAgents modify Phone varchar(10);
```

Q36. Drop the Email column from DeliveryAgents.

A36. 
```sql
alter table DeliveryAgents drop Email;
```

Q37. Rename the table DeliveryAgents to DeliveryTeam.

A37. 
```sql
alter table DeliveryAgents rename to DeliveryTeam;
```

Q19. Add a new column DeliveryAgentID in Orders referencing DeliveryAgents.

A19. This is the question from section 2, only here, we reference it to DeliveryTeam, not DeliveryAgents. We first must add the column, then add the constraint/connection. So we use two queries for this.
```sql
alter table Orders add Column DeliveryAgentID INT;
alter table Orders add Constraint fk_delivery Foreign Key (DeliveryAgentID)
references DeliveryTeam(DeliveryAgentID);
```

Q38. Rename the column Region to AssignedRegion in DeliveryTeam.

A38. There are steps to this. First, the check constraint has to be removed, and then the column name must be changed, after which the check constraint must be changed. 
```sql
alter table DeliveryTeam drop CHECK deliveryteam_chk_1;
alter table DeliveryTeam rename Column Region to AssignedRegion;
alter table DeliveryTeam add constraint CHECK (AssignedRegion in ('North','South','East','West'));
```

Q39. Truncate the DeliveryTeam table (delete all rows).

A39. We first set the safe updates to 0, and then execute the required queries. 
```sql
SET SQL_SAFE_UPDATES = 0;
delete from DeliveryTeam;
```

Q40. Drop the entire DeliveryTeam table.

A40. We first need to delete the foreign key constraint and then remove the table entirely. 
```sql
show create table Orders;
alter table Orders drop Foreign Key fk_delivery;
drop table DeliveryTeam;
```

Q41. Truncate the Payments table.

A41.
```sql
drop table Payments;
```

Q42. Truncate the OrderDetails table.

A42. 
```sql
drop table DeliveryTeam;
```

# Section D - Dropping and Renaming

Q43. Drop the Payments table entirely.

A43. 
```sql
drop table Payments;
```

Q44. Drop the Delivery table entirely. 

A44. 
```sql
drop table DeliveryTeam;
```

Q45. Rename the Books table to BookInventory.

A45. 
```sql
alter table Books rename to BookInventory;
```

Q46. Rename the Customers table to Clients.

A46.
```sql
alter table Customers rename to Clients;
```

Q47. Rename the column Name in Clients to FullName.

A47.
```sql
alter table Clients rename Column Name to FullName;
```

Q48. Rename the column Title in BookInventory to BookTitle.

A48.
```sql
alter table BookInventory rename Column Title to BookTitle;
```

Q49. Rename the table BookInventory back to Books.

A49.
```sql
alter table BookInventory rename to Books;
```

Q50. Drop all foreign keys from OrderDetails referencing Orders and Books.

A50.
```sql
show create table OrderDetails;
alter table OrderDetails drop Foreign Key orderdetails_ibfk_1;
alter table OrderDetails drop Foreign Key orderdetails_ibfk_2;
```

