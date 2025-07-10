-- single line comment ----
/*
multi 
line 
comment
*/

-- Database Queries  ----------
create database Assignment ;

use  Assignment ;
Drop database Assignment ;

-- Database  Analysis ------------
/*
1. Airline :
T1: Airlines : ( airline_id, name, code ,country, Rating )
T2: Airports : ( airport_id, name, city, country , code )
T3: Flights : ( flight_id, airline_id, origin_airport_id, destination_airport_id,departure_time, arrival_time )
T4: Passengers : ( passenger_id, name, email, phone ,address )
T5: Bookings : ( booking_id, flight_id, passenger_id, seat_number, booking_date )
2. Hotel :
T6: Hotels : ( hotel_id , name , location , rating ,total_staff )
T7: Rooms : ( room_id , hotel_id , room_type , price , availability )
T8: Guests : ( guest_id , name , email , phone , address )
T9: Reservations : ( reservation_id , guest_id , room_id , check_in , check_out )
T10: Payments : ( payment_id , reservation_id , amount , payment_date ,payment_method )
3. Library :
T11: Books: ( book_id, title, author, isbn, publisher )
T12: Members: ( member_id, name, email, membership_date )
T13: Loans: ( loan_id, book_id, member_id, loan_date, return_date )
T14: Reservations: ( reservation_id, book_id, member_id, reservation_date )
T15: Staff: ( staff_id, name, position, email )
4. College :
T16: Students : (student_id, name, email, enrollment_date , phone )
T17: Courses : ( course_id, course_name, credits )
T18: Enrollments : ( enrollment_id, student_id, course_id, semester )
T19: Professors : ( professor_id, name, department, email ,contact )
T20: Departments : ( department_id, department_name, head_of_department )

5. Birthday Party :
T21: Events: ( event_id, name, date, location, host_id )
T22: Guests: ( guest_id, name, email, phone, address )
T23: Invitations: ( invitation_id, event_id, guest_id, rsvp_status )
T24: Vendors: ( vendor_id, name, service_type, contact_info )
T25: Event_Vendors: ( event_vendor_id, event_id, vendor_id, service_details )

6. Hospital :
T26: Patients: ( patient_id, name, dob, gender, contact_info )
T27: Doctors: ( doctor_id, name, specialization, contact_info )
T28: Appointments: ( appointment_id, patient_id, doctor_id, appointment_date,reason )
T29: Medical_Records: ( record_id, patient_id, doctor_id, diagnosis, treatment )
T30: Billing: ( bill_id, patient_id, amount, billing_date, payment_status )


*/

-- --------------------------------------- Table Related Queries -------------------------------------------------------------------------
--  ---------------------------------------- 1.Airline  ----------------------------------------------------------------------------------------------------------------------------
-- 1. Airlines Table  
create table Airlines (
    Airline_Id int primary key ,
    Name varchar (100),
    Code varchar(10),
    Country varchar(50),
    Rating decimal(2,1)
);

select*from Airlines ; 

truncate table Airlines ;

drop  table Airlines ;

-- 2. Airports Table
create table Airports (
    Airport_Id int primary key ,
    Name varchar(100),
    City varchar (100),
    Country varchar(100),
    Code varchar(10)
);

select*from Airports ; 

truncate table Airports ;

drop  table Airports ;



-- 3. Flights Table 
create table Flights 
( flight_id int primary key ,
 airline_id int , 
 origin_airport_id int ,
 destination_airport_id int ,
 departure_time  datetime , 
 arrival_time datetime ,
 foreign key ( airline_id ) references airlines (airline_id)
 );

select*from Flights  ; 

truncate table Flights  ;

drop  table Flights  ;


-- 4. Passengers Table
create table Passengers (
     passenger_id int , 
     name varchar (100) ,
     email varchar (100),
     phone varchar(10) ,
     address varchar (100) 
);

select*from Passengers  ; 

truncate table Passengers  ;

drop  table Passengers ;

-- 5. Bookings Table 
create table Bookings (
    booking_id int primary key ,
    flight_id int ,
    passenger_id int ,
    seat_number int , 
    booking_date date,  
    foreign key (flight_id) references flights(flight_id)
);

select*from Bookings ; 

truncate table Bookings ;

drop  table Bookings ;

-- --------------------------------------    2.Hotel ---------------------------------------------------------------------------------------------
-- 6. Hotels Table 
 create table Hotels ( 
   hotel_id int primary key , 
   name varchar (100),
   location varchar(100) ,
   rating varchar(100) ,
   total_staff  int 
 );
 
select *from Hotels ;

drop table Hotels ;

truncate table Hotels;

-- 7. Rooms Table 
create table Rooms ( 
room_id int primary key  ,
hotel_id int , 
room_type varchar(100) , 
price  int , 
availability varchar(100),
foreign key (hotel_id) references Hotels(hotel_id)
);

select*from Rooms ;

drop table Rooms ;

truncate table rooms;

-- 8.  Guests Table
 create table Guests ( 
 guest_id int primary key  ,
 name  varchar(100),
 email varchar(100) ,
 phone varchar(100) ,
 address varchar(100)
 );
 
 select*from Guests ;
 
 drop table Guests ;
 
 Truncate table Guests ;
 
 -- 9. Reservations  Table
 create table Reservations  ( 
 reservation_id int primary key ,
 guest_id int , 
 room_id int , 
 check_in datetime  , 
 check_out  datetime,
 foreign key(guest_id)references Guests(guest_id)
 );
 
 select*from  Reservations ;
 
 drop table  Reservations ;
 
 truncate table  Reservations ;
 
  -- 10. Payments Table
  create table Payments ( 
  payment_id int primary key , 
  reservation_id int  , 
  amount int  , 
  payment_date datetime,
  payment_method varchar (100),
  foreign key( reservation_id) references Reservations ( reservation_id)
  );
  
  select*from Payments;
  
  drop table Payments;
  
  truncate table Payments; 
  
  -- ---------------------------------- 3.Library ------------------------------------
  -- 11. Books Table 
	create table Books ( 
    book_id int primary key ,
    title text , 
    author varchar(100), 
    isbn varchar(100) , 
    publisher varchar(100)
    );
    
    select*from Books ;
    
    Drop table Books ;
    
    truncate table Books ;
    
  -- 12. Members Table 
   create table  Members (
   member_id int primary key , 
   name varchar(100),
   email varchar(100), 
   membership_date datetime ,
   book_id int ,
   foreign key (book_id) references Books (book_id)
   );
   
   select*from Members;
   
   drop table Members ;
   
   truncate table Members;
  
  -- 13. Loans Table  
   create table Loans ( 
   loan_id int primary key , 
   book_id int , 
   member_id int , 
   loan_date datetime, 
   return_date datetime,
   foreign key (book_id) references Books (book_id),
   foreign key (member_id) references members (member_id)
   );
   
   select*from Loans ;
   
   drop table Loan ;
   
   Truncate table Loan ;
   
  -- 14. Reservations Table  
   create table  Reservations ( 
   reservation_id int primary key , 
   book_id int , 
   member_id int , 
   reservation_date date ,
   foreign key (book_id) references Books (book_id),
   foreign key (member_id) references members (member_id)
   );
   
   select*from  Reservations;
   
   drop table  Reservations;
   
   truncate table  Reservations;
   
  -- 15. Staff  Table  
   create table Staff ( 
   staff_id int primary key , 
   name varchar (100),
   position varchar(100),
   email varchar(100), 
   address varchar (100)
   );
   
   select*from  Staff ;
   
   drop table  Staff ;
   
   truncate table  Staff ;
   
   -- -------------------------------------------- 4. College ---------------------------------------------------------------
  -- 16. Students  Table  
   create table  Students (
   student_id int primary key , 
   name varchar (100), 
   email varchar (100),
   enrollment_date date , 
   phone varchar (10)
   );
   
   select*from Students ;
   
   drop table  students ;

   truncate table  students ;
   
  -- 17. Courses  Table     
   create table Courses ( 
   course_id int primary key ,
   course_name varchar(50) ,
   credits varchar(100),
   student_id int ,
   foreign key (student_id) references students (student_id)
   );
   select*from Courses ;
   
   drop table  Courses ;

   truncate table  Courses ;
   
  -- 18. Enrollments  Table  
   create table  Enrollments ( 
   enrollment_id int primary key , 
   student_id int , 
   course_id int , 
   semester varchar(100),
   foreign key (student_id) references students (student_id),
   foreign key (courses_id) references Courses (courses_id) 
   );
   select*from  Enrollments ;
   
   drop table   Enrollments ;

   truncate table  Enrollments ;
   
  -- 19. Professors  Table  
   create table  Professors  (
   professor_id int primary key , 
   name varchar (50), 
   department  varchar (100) ,
   email varchar(100) ,
   contact varchar (10)
   );
   select*from Professors;
   
   drop table   Professors;

   truncate table  Professors ;
   
  -- 20. Departments Table  
   create table  Departments  (
   department_id int primary key , 
   department_name varchar(100), 
   head_of_department varchar (100)
   );
   select*from Departments  ;
   
   drop table   Departments  ;

   truncate table  Departments  ;
   
   --  ------------------ 5. Birthday Party -------------------------------------------------------------------------------------------------
   -- 21 Events Table 
  create table  Events ( 
  event_id int primary key,
  name varchar(50), 
  date date , 
  location varchar(50), 
  host_id  int 
  );
  
  select*from Events;
  
  drop table Events;
  
  truncate table Events;
  
   -- 22  Guests Table
 create table  Guests ( 
 guest_id int primary key , 
 name varchar (50), 
 email varchar(50), 
 phone varchar(50), 
 address varchar(50)
 );
 
 select*from  Guests;
 
 drop table  Guests;
 
 truncate table  Guests;
 
 -- 23  Invitations Table
create table  Invitations( 
invitation_id int primary key , 
event_id int , 
guest_id int , 
rsvp_status varchar(50),
foreign key (event_id) references Events (event_id),
foreign key (guest_id ) references Guests (guest_id )
 );
 
 select*from Invitations;
 
 drop table Invitations;
 
 truncate table Invitations;

 -- 24  Vendors Table 
create table Vendors ( 
vendor_id int primary key , 
name varchar(100), 
service_type  varchar(100), 
contact_info varchar(100)
);

select*from Vendors;

drop table Vendors;

truncate table Vendors;

 -- 25  Event_Vendors Table 
create table Event_Vendors( 
event_vendor_id int primary key , 
event_id int , 
vendor_id int , 
service_details varchar(100),
foreign key (event_id) references Events (event_id),
foreign key (vendor_id) references Vendors (vendor_id)
);

select*from  Event_Vendors;

drop table  Event_Vendors;

truncate table  Event_Vendors;

-- ------------------- 6. Hospital -------------------------------------------------------------------------------------------
-- 26 Patients Table 
create table Patients (
 patient_id int primary key , 
 name varchar (100), 
 dob varchar (50),
 gender varchar(50),
 contact_info varchar(50)
 );
 
 select*from Patients ;
 
 drop table Patients;
 
 truncate table Patients;
 
 -- 27 Doctors Table 
create table  Doctors ( 
doctor_id int primary key , 
name varchar(50),
specialization varchar(50), 
contact_info varchar(100)
);

select*from Doctors;

drop table Doctors;

truncate table Doctors;

 -- 28 Appointments Table 
create table  Appointments ( 
appointment_id int primary key , 
patient_id int , 
doctor_id int , 
appointment_date datetime ,
reason varchar(100) ,
foreign key (patient_id) references Patients (patient_id),
foreign key (docter_id) references Doctors (docter_id)
);

select*from Appointments;

drop table Appointments;

truncate table Appointments;

 -- 29  Medical_Records Table 
create table  Medical_Records ( 
record_id int primary key , 
patient_id int ,
doctor_id int , 
diagnosis varchar(100),
treatment varchar(100),
foreign key(patient_id) references Patients (patient_id),
foreign key (docter_id) references Doctors (docter_id)
);

select*from Medical_Records;

drop table Medical_Records;

truncate table Medical_Records;

 -- 30  Billing Table 

create table Billing (
bill_id int primary key , 
patient_id int ,
amount int , 
billing_date date , 
payment_status varchar(100),
foreign key(patient_id) references Patients (patient_id)
);

select*from Billing;

drop table Billing;

truncate table Billing;

--  