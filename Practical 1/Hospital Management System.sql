create database Hospital;
use Hospital;

create table patient (
Patient_ID INT Primary Key,
Name varchar(20),
DOB Date,
Gender varchar(6),
Contact varchar(10),
Address varchar(70)
);

create table doctor (
Doctor_ID INT Primary Key, 
Name varchar(20), 
Specialization varchar(40), 
Contact varchar(10)
);

create table appointment (
Appointment_ID INT, 
Patient_ID INT, 
Doctor_ID INT, 
Date date, 
Time datetime, 
Status varchar(20),
Foreign Key(Patient_ID) references patient(Patient_ID),
Foreign Key(Doctor_ID) references doctor(Doctor_ID)
);

INSERT INTO patient values(001, 'Advait Mohanty', '2006-01-11', 'Male', '9667109371', 'No. 12 Drury Lane');
INSERT INTO patient values(002, 'Adithi Upadhyaya', '2006-04-07', 'Female', '9812384878', 'No. 16 Drury Lane');
INSERT INTO patient values(003, 'Vadher Pratham', '2006-12-13', 'Male', '9552346753', 'No. 18 Masterson Street');
INSERT INTO patient values(004, 'Nirmohi Maghdut', '2006-04-21', 'Male', '8732485234', 'No. 162 Big Hill Road');
INSERT INTO patient values(005, 'Bhoomi Nazare', '2006-06-18', 'Female', '9667123876', 'No. 21 Big Hill Road');

INSERT INTO doctor values(101, 'Mahipal S. Sachdev', 'Opthalmology', '9812374916');
INSERT INTO doctor values(102, 'Rajshekhar Reddy', 'Neurology', '9071973668');
INSERT INTO doctor values(103, 'Kenny G', 'Gynacology', '9812374916');

INSERT INTO appointment values(912378, 001, 102, '2025-02-08', '2025-02-08 11:00:00', 'Booked');
INSERT INTO appointment values(823498, 005, 101, '2025-02-21', '2025-02-21 17:45:00', 'Booked');
INSERT INTO appointment values(234098, 003, 103, '2025-05-18', '2025-05-18 18:30:00', 'Cancelled');
INSERT INTO appointment values(298334, 004, 101, '2025-03-30', '2025-03-30 07:20:00', 'Confirmation Reqd');
INSERT INTO appointment values(823498, 002, 103, '2025-08-30', '2025-08-30 20:30:00', 'Confirmation Reqd');
INSERT INTO appointment values(297346, 003, 102, '2025-07-26', '2025-07-26 20:30:00', 'Completed');
INSERT INTO appointment values(298343, 002, 102, '2025-07-27', '2025-07-27 14:30:00', 'Booked');

select * from Doctor inner join Appointment on Doctor.Doctor_ID = Appointment.Doctor_ID;

select patient.name AS Patient, Appointment.Date, Appointment.Time FROM Appointment inner join Patient 
on Appointment.Patient_ID = Patient.Patient_ID 
where Appointment.Doctor_ID = 102 and date = current_date();


