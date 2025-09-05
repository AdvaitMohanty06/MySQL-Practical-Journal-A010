create database hostel_room_allocation;
use hostel_room_allocation;
drop table student;

create table student(
Student_ID varchar(10) Primary Key, 
Name varchar(20), 
Gender varchar(6), 
Course varchar(60), 
Year varchar(4)
);

create table room(
Room_ID varchar(3) Primary Key, 
Room_Type varchar(10), 
Capacity INT, 
Occupancy_Status INT
);

create table allocation (
Allocation_ID varchar(5) Primary Key, 
Student_ID varchar(10), 
Room_ID varchar(3), 
CheckIn_Date Date, 
CheckOut_Date Date
);


INSERT INTO student values('6022400007','Advait Mohanty', 'Male','B.Sc(Applied Mathematical Computing)','2025');
INSERT INTO student values('6123981212','Kousheya Das', 'Male','M.B.A.','2025');
INSERT INTO student values('6123498233','Amit Kumar Maurya', 'Male','M.B.A.','2025');
INSERT INTO student values('6022400009','Adithi Upadhyaya', 'Female','B.Sc(Applied Mathematical Computing)','2025');
INSERT INTO student values('6022400008','Bhoomi Nazare', 'Female','B.Sc(Applied Mathematical Computing)','2025');
INSERT INTO student values('6022400189','Vadher Pratham', 'Male','B.Sc(Applied Stats and Analytics)','2025');
INSERT INTO student values('6022400123','Anurag Maratha', 'Male','B.Sc(Data Science)','2025');
INSERT INTO student values('6121231123','Muskan Hassani', 'Female','B.Sc(Applied Stats and Analytics)','2025');
INSERT INTO student values('6022112381','Aadi Agarwal', 'Male','B.Sc(Applied Mathematical Computing)','2024');
INSERT INTO student values('6123981234','Rishabh Tiwari', 'Male','M.B.A.','2024');
INSERT INTO student values('6022112382','Juhi', 'Female','B.Sc(Applied Mathematical Computing)','2024');
INSERT INTO student values('6022112383','Tia', 'Female','B.Sc(Applied Stats and Analytics)','2024');


select* from student;

INSERT INTO room values('001','AC Premium', 3, 2);
INSERT INTO room values('002','AC Premium', 3, 0);
INSERT INTO room values('003','Non-AC', 3, 0);
INSERT INTO room values('004','Non-AC', 3, 0);
INSERT INTO room values('005','AC Premium', 2, 1);
INSERT INTO room values('006','AC Premium', 2, 2);
INSERT INTO room values('007','Non-AC', 2, 1);
INSERT INTO room values('008','Non-AC', 2, 1);
INSERT INTO room values('009','AC Premium', 1, 1);
INSERT INTO room values('010','Non-AC', 1, 0);


INSERT INTO allocation values('A0001','6022112381','005','2024-01-14','2024-12-29');
INSERT INTO allocation values('A0002','6123981234','005','2024-01-12','2024-12-13');
INSERT INTO allocation values('A0003','6022112382','009','2024-01-14','2024-12-18');
INSERT INTO allocation values('A0004','6022112383','010','2024-01-14','2024-12-17');
INSERT INTO allocation values('B0001', '6022400007', '009','2025-01-04',null);
INSERT INTO allocation values('B0002', '6123981212', '008','2025-01-03',null);
INSERT INTO allocation values('B0003', '6123498233', '007','2025-01-07',null);
INSERT INTO allocation values('B0004', '6022400009', '001','2025-01-09',null);
INSERT INTO allocation values('B0005', '6022400008', '001','2025-01-01',null);
INSERT INTO allocation values('B0006', '6121231123', '005','2025-01-03',null);
INSERT INTO allocation values('B0007', '6022400189', '006','2025-01-06',null);
INSERT INTO allocation values('B0008', '6022400123', '006','2025-01-04',null);

select student.name, room.room_ID, room.room_type from allocation
join student on allocation.Student_ID = student.Student_ID
join room on allocation.Room_ID = room.Room_ID
where allocation.checkout_date IS NULL;