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
