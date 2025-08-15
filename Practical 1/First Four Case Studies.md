# Brief Overview
Thee 4 files contain 4 different situations, one for a hospital, one for a car rental system, one for a hostel allocation and one for a library. The objective of these 4 case studies is to make sure that data is properly organised to ensure the smooth flow of each of these organisations. There are 3 parts to each project. The tables are created, an appropriate number of realistic entries are made, and queries are executed on those records.

# Library Management System - 1
This project aims to develop a Library Management System for college libraries that stores information about books, members, and transactions in order to automate lending activities, avoid manual record-keeping, and generate reports on issued books and due dates.

# Table 1 - Book
This table contains all details pertaining to the books.
- 'Book_ID (Primary Key)
- 'Title'
- 'Author'
- 'Publisher'
- 'ISBN'
- 'Category'
- 'Copies_Available'

# Table 2 - Member
This table pertains to the holders of the library card, i.e. the members. 
- 'Member_ID' (Primary Key)
- 'Name 
- 'Department'
- 'Membership_Date'
- 'Contact'

# Table 3 - Transaction
This table pertains to every book that is borrowed from the library.
- 'Transaction_ID' (Primary Key)
- 'Book_ID'(Foreign Key to Book)
- 'Member_ID'(Foreign Key to Member)
- 'Issue_Date' 
- 'Return_Date' 
- 'Fine'
 
# Queries
Here, we want the number of times books have been borrowed, name of the borrower, title of the book and fine(if any), a combined table of Member and Transaction and, finally one for Book and Transaction. Queries are given below :- 

```sql

select count(*) from TRANSACTION where Fine > 0;

select MEMBER.Name, BOOK.Title, Transaction.Fine from TRANSACTION inner join BOOK on TRANSACTION.Book_ID = BOOK.Book_ID inner join MEMBER on TRANSACTION.Member_ID = MEMBER.MEMBER_ID;

select * from MEMBER join TRANSACTION on TRANSACTION.Member_ID = MEMBER.Member_ID;

select * from BOOK join TRANSACTION on TRANSACTION.Book_ID = BOOK.Book_ID where TRANSACTION.Fine > 0;

``````

# Hospital Management System
This project aims to provide seperate tables for patient data, doctor data and appointment data, to easily pair the three without one massive table, which is hard and complicated to read and maintain. 

# Table 1 - Patient
This table contains data pertaining to all patients.
- 'Patient_ID' (Primary key)
- 'Name'
- 'Date of Birth'
- 'Gender'
- 'Contact' 
- 'Address'

# Table 2 - Doctor
This table contains all the data pertaining to the doctors in the hospital.
- 'Doctor_ID'
- 'Name'
- 'Specialization'
- 'Contact'

# Table 3 - Appointment
This table contains all the appointment info i.e. when the patient meets the doctor. 
- 'Appointment_ID' (Primary Key)
- 'Patient_ID' (Foriegn Key to Patient)
- 'Doctor_ID' (Foriegn Key to Doctor)
- 'Date'
- 'Time' 
- 'Status'

# Queries
Here, we want to select the combined table for Doctor and Appointment. Inner Join gives priority to the Doctor Table. We also want the Patient Name, Date and Time for every appointment for a doctor with ID 102 for the day. We use a combination of Patient and Appointment for this, as well as a constraint to check for the Doctor's ID and the Date. Thankfully, SQL recognizes current dates.

```sql

select * from Doctor inner join Appointment on Doctor.Doctor_ID = Appointment.Doctor_ID;

select patient.name AS Patient, Appointment.Date, Appointment.Time FROM Appointment  join Patient 
on Appointment.Patient_ID = Patient.Patient_ID 
where Appointment.Doctor_ID = 102 and date = current_date();

``````

# Car Rental System
This project aims towards organising the data of a car rental company. It arranges car, renter and rental appointment data for seamless operation. It also has data for staff, although this is not, in any way, related to the other three tables. 

# Table 1 - Customer
This table pertains to the legal information required by an individual to rent a car.
- 'Customer_ID' (Primary Key)
- 'Name'
- 'License_Number'
- 'Contact'

# Table 2 - Car
This contains all the informations used to uniquely identify a car. 
- 'Car_ID' (Primary Key)
- 'Model'
- 'Category'
- 'Manufacturer'
- 'Availability_Status'

# Table 3 - Rental
This contains all the information pertaining to each time a car is rented out. 
- 'Rental_ID' (Primary Key)
- 'Customer_ID' (Foreign Key to Customer)
- 'Car_ID' (Foreign Key to Car)
- 'Rental_Date'
- 'Return_Date'
- 'Total_Amount'

# Table 4 - Staff
This contains staff details.
- 'Staff_ID' 
- 'Name' 
- 'Role'
- 'Contact'

# Queries
We want to just check which cars are currently rented. There are two ways to do this, as has been shown, the first is using the availability criteria, a car is 'rented', if it is 'not available'. The other (not featured in the code) is checking for the return date. No return date means no car at the rental. Here, we extract the model, rental date, and the customers name.

```sql
select car.model, rental.rental_date, customer.name from rental 
join car on rental.car_ID = car.car_ID
join customer on customer.customer_ID = rental.customer_ID
where Availability_Status = 'Not Available';

select car.model, rental.rental_date, customer.name from rental 
join car on rental.car_ID = car.car_ID
join customer on customer.customer_ID = rental.customer_ID
where Return_Date IS NULL;

``````

# Hostel Allocation System
This system was designed to keep an easy track of who is in the hostel and who has signed out. Furthermore, is keeps track of which student is in which room, using numerical codes for both room and student. 

# Table 1 - Student 
This table contains all student data.
- 'Student_ID' (Primary Key)
- 'Name'
- 'Gender'
- 'Course'
- 'Year'

# Table 2 - Room
This table contains the room data, including the code and the room type.
- 'Room_ID' (Primary Key) 
- 'Room_Type'
- 'Capacity' 
- 'Occupancy_Status'

# Table 3 - Allocation
This table actually tells us which student goes into which room. It also gives us the details of the previous occupants of the room, thanks to the 'check-in' and 'check-out' date.
- 'Allocation_ID'
- 'Student_ID'
- 'Room_ID'
- 'CheckIn_Date'
- 'CheckOut_Date'

# Queries
Here, we just need to find the number of current students staying in hostel. We use the same logic as the car rental database, where we used the DATE, if there is no check out date, the person is still in the hostel (hasn't checked out yet). We will need a join of all three tables, and the constraint will be checking whether the checkout date is a null value or not. 

```sql
select student.name, room.room_ID, room.room_type from allocation
join student on allocation.Student_ID = student.Student_ID
join room on allocation.Room_ID = room.Room_ID
where allocation.checkout_date IS NULL;

``````
