CREATE DATABASE Practise;
Use Practise;

CREATE TABLE Student
(StudentID INT, Name Varchar(10), Age INT, Gender Varchar(20)
);

INSERT INTO Student (StudentID, Name, Age, Gender)
VALUES
(01, 'Ram', 20, 'Male'),
(02, 'Sana', 21, 'Female'),
(03, 'John', 21, 'Male'),
(04, 'Peter', 20, 'Male');

SELECT * from Student;

SELECT StudentID, Name from Student;

SET
SQL_SAFE_UPDATES = 0;

UPDATE Student 
SET Age = 31
WHERE StudentID = 4;

SELECT * from Student;

DELETE from Student
WHERE StudentID = 4;

SELECT * from Student;

TRUNCATE TABLE Student;

SELECT * FROM Student;

DROP TABLE Student;

create table student(
StudentID INT,
Name VARCHAR(20),
Age INT,
Gender VARCHAR(20));

ALTER TABLE student 
ADD Location VARCHAR(20);

SELECT * from student;

drop table student;

truncate table Student;

select * from Student;

drop database Practise;

CREATE DATABASE Practise;
Use Practise;

create table student(
StudentID INT,
Name VARCHAR(20),
Age INT,
Gender VARCHAR(20));

INSERT INTO student(StudentID, Name, Age, Gender)
VALUES
(01, 'Ram', 20, 'Male'),
(02, 'Sana', 21, 'Female'),
(03, 'John', 21, 'Male'),
(04, 'Peter', 20, 'Male');

ALTER TABLE student 
ADD Location VARCHAR(20);

UPDATE student 
SET Location = 'Bangalore'
WHERE StudentID IN (1,3);

UPDATE student 
SET Location = 'Bangalore'
WHERE StudentID = 2;

UPDATE student 
SET Location = 'Bangalore'
WHERE StudentID = 4;

DELETE FROM student 
WHERE StudentID = 4;

SELECT * FROM student;

SELECT Name, Location, Gender
FROM student;

SELECT COUNT(*) AS No_of_students
FROM student;

SELECT StudentID, Name 
FROM student 
WHERE location = 'Bangalore';

SELECT DISTINCT Location
from student;

SELECT Name FROM student 
LIMIT 2;

SET AUTOCOMMIT = 0;

START TRANSACTION;

SELECT * FROM student;

DELETE FROM student 
WHERE StudentID = 4;

ROLLBACK;

COMMIT;

SET AUTOCOMMIT = 0;

START TRANSACTION;

SAVEPOINT A;

SELECT * FROM Students;

SAVEPOINT B;

DELETE FROM Student;

select * from Student;

Rollback to B;

select * from Student;

COMMIT;

create table CourseDetails(
CourseID TINYINT Primary Key,
CourseName varchar(20) NOT NULL,
Amount SMALLINT
);

INSERT INTO CourseDetails 
VALUES(01, 'SQL', 15000), (02, 'Power-BI', 12000);

SELECT * FROM CourseDetails;

CREATE TABLE StudentDetails(
SID INT Primary Key,
SName VARCHAR(20) NOT NULL,
Age TINYINT check(Age > 18),
Gender VARCHAR(20) check (Gender = 'Male' OR Gender = 'Female'),
CourseID TINYINT,
FOREIGN KEY(CourseID) references CourseDetails(CourseID)
);

INSERT INTO StudentDetails
VALUES
(01, 'Ram', 30, 'Male', 01),
(02, 'Sana', 31, 'Female', 02),
(03, 'Advait', 29, 'Male', 02),
(04, 'Adithi', 70, 'Female', 01),
(05, 'Pratham', 81, 'Female', 02);

create table Sales(
OrderID TINYINT,
ProductID TINYINT,
Quantity INT,
Price FLOAT,
OrderDate DATE,
CustomerID INT
);

alter table Sales modify column CustomerID VARCHAR(4);

show create table Sales;

INSERT INTO Sales (OrderID, ProductID, Quantity, Price, OrderDate, CustomerID)
VALUES 
(1, 101, 50, 15.00, '2023-02-10', 'C001'),
(2, 102, 30, 10.00, '2023-03-15', 'C002'),
(3, 101, 60, 15.00, '2023-04-20', 'C003'),
(4, 103, 40, 20.00, '2023-05-05', 'C004'),
(5, 102, 75, 10.00, '2023-06-10', 'C005'),
(6, 104, 90, 25.00, '2023-07-15', 'C006'),
(7, 101, 30, 15.00, '2023-08-20', 'C007'),
(8, 102, 70, 10.00, '2023-09-10', 'C008'),
(9, 101, 80, 15.00, '2023-08-20', 'C009'),
(10, 103, 50, 20.00, '2023-12-12', 'C010');
