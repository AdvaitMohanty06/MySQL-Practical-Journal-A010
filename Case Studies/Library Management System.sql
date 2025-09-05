CREATE database library_management;
USE Library_management;

create table BOOK (
Book_ID INT,
Title VARCHAR(30),
Author VARCHAR(40),
Publisher VARCHAR(50),
ISBN VARCHAR(13),
Category VARCHAR(10),
Copies_Availabe INT,
PRIMARY KEY(Book_ID)
);

create table MEMBER (
Member_ID INT PRIMARY KEY,
Name VARCHAR(20),
Department VARCHAR(30),
Membership_Date DATE,
Contact VARCHAR(10)
);

create table TRANSACTION (
Transaction_ID INT,
Book_ID INT,
Member_ID INT,
Issue_Date DATE,
Return_Date DATE,
Fine INT,
FOREIGN KEY (Book_ID) REFERENCES BOOK(Book_ID),
FOREIGN KEY (Member_ID) REFERENCES MEMBER(Member_ID)
);

INSERT INTO BOOK Values(12308, 'A Book of Travellers Tales', 'Eric Newby', 'Puffin', 6748523686422 , 'Travelogue' , 20);
INSERT INTO BOOK Values(29478, 'Inside Parliament - Views from the Front Row', "Derek O'Brien", 'Puffin', 5876536789642 , 'Politics' , 12);
INSERT INTO BOOK Values(12346, 'The Siege: Attack on the Taj', 'Adrian Levy' , 'Puffin', 6748523686422 , 'Journalist' , 31);
INSERT INTO BOOK VALUES(10238, 'Tomb of Sand', 'Gitanjali Shree', 'Puffin', 9754234578752, 'Fiction', 54);
INSERT INTO BOOK VALUES(13245, 'Land Guns Caste Woman', 'Gita Ramaswamy', 'Puffin', 7542357907532, 'Memoir', 24);

INSERT INTO MEMBER Values(912374, 'Advait', 'B.Sc (AMC)', '2024-08-12', 9667109371);
INSERT INTO MEMBER Values(298347, 'Adithi', 'B.Sc (AMC)', '2024-08-11', 9810293384);
INSERT INTO MEMBER Values(198237, 'Krutika', 'B.Sc (ASA)', '2024-08-19', 9631925145);
INSERT INTO MEMBER Values(198346, 'Nirmohi', 'B.Sc (ASA)', '2024-09-21', 9342342445);
INSERT INTO MEMBER Values(913762, 'Anurag', 'B.Sc (DS)', '2024-04-23', 9674776403);
INSERT INTO MEMBER Values(123986, 'Nikunj Sinha', 'B.Sc (DS)', '2024-04-28', 9745757698);

INSERT INTO TRANSACTION Values(87579, 12308, 912374, '2025-01-13', '2025-01-27', 100); 
INSERT INTO TRANSACTION Values(91236, 12346, 198237, '2025-01-19', '2025-01-20', 100); 
INSERT INTO TRANSACTION Values(12383, 10238, 298347, '2025-01-17', '2025-01-28', 50); 
INSERT INTO TRANSACTION Values(23456, 13245, 123986, '2025-01-07', '2025-01-28', 250); 
INSERT INTO TRANSACTION Values(93456, 13245, 912374, '2025-01-07', '2025-01-12', 0); 
INSERT INTO TRANSACTION Values(23456, 13245, 198237, '2025-01-07', '2025-01-13', 0); 

select count(*) from TRANSACTION where Fine > 0;

select MEMBER.Name, BOOK.Title, Transaction.Fine from TRANSACTION inner join BOOK on TRANSACTION.Book_ID = BOOK.Book_ID inner join MEMBER on TRANSACTION.Member_ID = MEMBER.MEMBER_ID;

select * from MEMBER inner join TRANSACTION on TRANSACTION.Member_ID = MEMBER.Member_ID;

select * from BOOK inner join TRANSACTION on TRANSACTION.Book_ID = BOOK.Book_ID where TRANSACTION.Fine > 0;



















drop table BOOK;
drop table TRANSACTION;
drop table MEMBER;
