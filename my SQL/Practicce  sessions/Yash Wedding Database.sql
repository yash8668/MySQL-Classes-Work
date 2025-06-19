-- Single Line Comment

/*
Multi 
Line 
Comment
*/	

-- ------------------------------------------------------------ Database Queries -------------------------------------------------------------------------------------

-- create a database Wedding_Planner 

create database Wedding_Planner
-- to work on this database, need to use it first 
use Wedding_Planner;

-- ------------------------------------------------------------- Table Queries -------------------------------------------------------------------------------------

-- Create table Engagement(guest_id,name,contact,invitation_status)

create table Engagement(
guest_id int, 
name varchar(100),
contact int,
invitation_status varchar(100)
);

insert into Engagement(guest_id,name,contact,invitation_status)
values
(1,'Tejas Pradhan',1234345567,'invited_attended'),
(2,'Radha Shinde',98765432,'invited_non-attended'),
(3,'Ishan Pednekar',123456789,'uninvited_attended'),
(4,'Yash Patil',123567890,'invited_attended'),
(5,'Unnati Jadhav',656473798,'invited_attended');

select * from Engagement;

-- Create table Wedding(guest_id,name,contact,relation,rsvp_status)

create table Wedding(
guest_id int,
name varchar(100),
contact int,
relation varchar(100),
rsvp_status varchar(100)
);

insert into Wedding(guest_id,name,contact,relation,rsvp_status)
values
(1,'Unnati Jadhav',12345678,'Family friend','invited_attended'),
(2,'Tejas Pradhan',1234567,'Cousin','invited_attended'),
(3,'Radha Shinde',987654346,'Aunt','invited_not-attended'),
(4,'Ishan Pednekar',12000000,'Not-Applicable','not-invited_attended'),
(5,'Yash Patil',656565656,'Boss','invited_not-attended');

select * from wedding;

-- Create a table Reception(guest_id,name,relation,gift,contact)

create table Reception (
guest_id int,
name varchar(100),
relation varchar(100),
gift varchar(100), 
contact int
);

insert into Reception(guest_id,name,relation,gift,contact)
values
(1,'Ishan Pednekar','Not-Applicable','Not-given',12343455),
(2,'Yash Patil','Boss','Cover Card',123567889),
(3,'Tejas Pradhan','Cousin','Present',987567788),
(4,'Radha Shinde','Aunt','Not-Given',12345678),
(5,'Unnati Jadhav','Family Friend','Present',12457688);

select * from Reception;

-- Create a table Event_Management_Employees(Employees,Id_no,Position,Contact)
create table Event_Management_Employees(
Employees varchar(100),
Id_no varchar(100),
Position varchar(100),
Contact int
);

insert into Event_Management_Employees(Employees,Id_no,Position,Contact)
value
('Harsh Jadhav','ADEXR','Event_Head',12344556),
('Wamika','ASDTYG','Assitent_Head',12345678),
('Ashish Nayrayan','ASDER','Hospitality_Head',12357809),
('Dhara More','XSDER','Decoration_Head',87654785),
('Raj Shinde','DEFGY','Finance_Associate',233456789);

select * from Event_Management_Employees;








