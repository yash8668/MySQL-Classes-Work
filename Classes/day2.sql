-- use database to work on it
use skp;

-- Table-1 {Department (Parent Table)}
create table Department(
id int primary key,
name varchar(100),
description text
);

-- display table data
select * from Department;

-- insert 6 records
insert into Department
values
(101, 'English', 'Key responsibilities of the [Department Name] Department include planning, 
coordinating, monitoring, and evaluating department-specific activities while 
upholding the organizations values and ethics.'),
(102, 'Finance', 'Key responsibilities of the [Department Name] Department include planning, 
coordinating, monitoring, and evaluating department-specific activities while 
upholding the organizations values and ethics.'),
(103, 'History', 'Key responsibilities of the [Department Name] Department include planning, 
coordinating, monitoring, and evaluating department-specific activities while 
upholding the organizations values and ethics.'),
(104, 'Maths', 'Key responsibilities of the [Department Name] Department include planning, 
coordinating, monitoring, and evaluating department-specific activities while 
upholding the organizations values and ethics.'),
(105, 'Commerce', 'Key responsibilities of the [Department Name] Department include planning, 
coordinating, monitoring, and evaluating department-specific activities while 
upholding the organizations values and ethics.'),
(106, 'Computer', 'Key responsibilities of the [Department Name] Department include planning, 
coordinating, monitoring, and evaluating department-specific activities while 
upholding the organizations values and ethics.');


-- Table-2 {Faculty(Child Table)}
 create table Faculty(
 id int primary key,
 name varchar(100),
 dept_id int,
 foreign key (dept_id) references department(id)
 );

-- display table data
select * from faculty;

-- insert values
insert into faculty
values
(1,'Dr. Prashant',101),
(2,'Dr. Ritu',103),
(3,'Dr. Rohit',104),
(4,'Dr. Prashant',105),
(5,'Dr. Prateek',106),
(6,'Dr. Asha',103),
(7,'Dr. Ritvik',null),
(8,'Dr. Sameer',102),
(9,'Dr. Priya',105),
(10,'Dr. Namita',101);

   -- show the table Students 
select*from Faculty;

 -- delete the table 
 drop table Faculty;
 
 -- delete the reacords in teble 
 truncate table Faculty;
 
 -- Table- 3 Students
 create table Students
 ( Student_id int primary key ,
 name varchar(100),
 std int ,
 dept_id int ,
 contact varchar(15),
 Faculty_id int ,
 foreign key (dept_id) references Department(Id),
 foreign key ( Faculty_id) references Faculty (Id)
 );


 -- insert values in students table 
 insert into Students
 values 
 ( 1 ,'Yash ', 8 , 104 , ' 4536676574',3),
 ( 2 ,'viraj', 7 , 105 , ' 1257412345',2),
 ( 3 ,'bhavesh', 12 , 102 , ' 4213211574', 2),
 ( 4 ,'nikhil ', 11 , 106 , ' 4536421335',6),
 ( 5 ,'viraj ', 9 , 101 , ' 4536676574',5);
 
  -- show the table Students 
select*from Students;

 -- delete the table 
 drop table Students;
 
 -- delete the reacords in teble 
 truncate table Students ;
 
 -- table 4 marks
 create table Marks
 ( student_id  int ,
  result_date date ,
  sub varchar (100),
  exam_type  varchar (100),
  totol_marks int,  
  Faculty_Id int ,
  foreign key (Student_id ) references Students(Student_id)
  );
  
  insert into Marks
  values 
  (1 ,'2025-11-22','maths ', 'unit test ' , 100  , 4 ),
  (2 ,'2025-1-25','marathi ', 'unit test ' , 35  , 2 ),
  (3 ,'2025-9-5','english', 'unit test ' , 86  , 3 ),
  (4 ,'2025-1-20','maths ', 'semester 1 ' , 70  , 5 ),
  (5 ,'2025-3-20','maths ', 'unit test ' , 100  , 1 );
  

 -- show the table Marks 
select*from Marks;

 -- delete all table 
 drop table Marks;
 -- delete the reacords in teble 
 truncate table Marks ;

-- table 5 salary 

create table  Salary 
( teachaer_id  int ,
 teacher_name varchar (100),
 subject varchar(100),
 Faculty_id int ,
 address varchar (100),
 foreign key ( Faculty_id ) references Faculty ( id )
 );
 
 -- insert  values in salary table
 insert into Salary
values 
( 101 , ' bhavesh ' ,'maths' , 1, 'Pune' ),
( 102 , ' yash ' ,'english' , 4, 'Thane' ),
( 103 , ' viraj ' ,'Bio ' , 2, 'mumbai' ),
( 104 , ' vilas ' ,'physics' , 5, 'Pune' ),
( 105 , ' mansi ' ,'marathi ' , 1, 'karjat' );

 -- show the table salary 
 select*from Salary ;
 -- delete all table 
 drop table  Salary;
 -- delete the reacords in teble 
 truncate table Salary ;