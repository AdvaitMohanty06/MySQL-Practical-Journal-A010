create database car_rental;
use car_rental;

create table customer (
Customer_ID INT Primary Key,
Name varchar(20),
License_Number varchar(16),
Contact varchar (10)
);

create table car (
Car_ID INT Primary Key, 
Model varchar(20), 
Category varchar(20), 
Manufacturer varchar(20), 
Availability_Status varchar(20)
);

create table Rental (
Rental_ID INT Primary Key, 
Customer_ID INT, 
Car_ID INT, 
Rental_Date Date, 
Return_Date Date, 
Total_Amount INT,
Foreign Key (Customer_ID) references customer(Customer_ID),
Foreign Key (Car_ID) references car(Car_ID)
);

create table staff (
Staff_ID INT , 
Name varchar(20), 
Role varchar(20), 
Contact varchar(10)
);

INSERT INTO customer values(001, 'ADVAIT MOHANTY', '2934857391835748', '9667109371');
INSERT INTO customer values(002, 'Adithi Upadhyaya', '2347283858362838', '8123982347');
INSERT INTO customer values(003, 'Agam Singh', '3048579394785748', '8100107893');
INSERT INTO customer values(004, 'Rishabh Tiwari', '182736482947592', '9810298834');
INSERT INTO customer values(005, 'Kenn Mathew', '3247923848203846', '9831012847');
INSERT INTO customer values(006, 'Kevin Mathew', '9827429875920472', '9817343432');


INSERT INTO car values(101, 'Camry', 'Sedan', 'Toyota', 'Available');
INSERT INTO car values(102, 'Accord', 'Sedan', 'Honda', 'Not Available');
INSERT INTO car values(103, 'CR-V', 'SUV', 'Honda', 'Available');
INSERT INTO car values(104, 'Yaris GRMN', 'Hatchback', 'Toyota', 'Available');
INSERT INTO car values(105, 'X-Trail', 'SUV', 'Nissan', 'Not Available');
INSERT INTO car values(106, 'RX-8', 'Coupe', 'Mazda', 'Available');
INSERT INTO car values(107, 'ES 300H', 'Sedan', 'Lexus', 'Not Available');
INSERT INTO car values(108, '4-Runner', 'SUV', 'Toyota', 'Not Available');
INSERT INTO car values(109, 'Cooper S', 'Hatchback', 'Mini', 'Not Available');
INSERT INTO car values(110, 'Supra', 'Coupe', 'Toyota', 'Not Available');

INSERT INTO rental values(0001, 002, 101, '2025-07-03','2025-07-05',463);
INSERT INTO rental values(0002, 003, 104, '2025-07-08','2025-07-11',541);
INSERT INTO rental values(0003, 001, 107, '2025-07-27',null,null);
INSERT INTO rental values(0004, 006, 105, '2025-07-27',null,null);
INSERT INTO rental values(0005, 002, 110, '2025-07-26',null,null);
INSERT INTO rental values(0006, 003, 108, '2025-07-28',null,null);
INSERT INTO rental values(0007, 004, 109, '2025-07-26',null,null);
INSERT INTO rental values(0008, 005, 102, '2025-07-27',null,null);
INSERT INTO rental values(0003, 001, 103, '2025-07-13','2025-07-16',321);

INSERT INTO staff values(1001, 'Arjun Goshal', 'Assistant', '9123712312');
INSERT INTO staff values(1002, 'Bhoomi Nazare', 'Assistant', '9812391238');

select car.model, rental.rental_date, customer.name from rental 
join car on rental.car_ID = car.car_ID
join customer on customer.customer_ID = rental.customer_ID
where Availability_Status = 'Not Available';


