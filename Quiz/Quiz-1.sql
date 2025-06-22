-- single line commment --
/*
multi
line
comment
*/

-- ---------- database Queries -------------
create database Companys ;

use Companys ;

-- ------- Delete database --------------------------------------------
drop table Companys;

-- Database Anylasis ---------------------------------------------------
/*
T1: Employees (ID , Name , address , contact , Email , age , qualfition , salary ,Birth_date , joining date ),
T2: Departments(dept_id , dept_name , head_of_dept ,total_employes, address , projects , section , Decription ,status , location ),
T3: Projects ( project_id , project_name , Head_of_project, start_date , end_date ,client_requirement, cost_of_project ,total_employes , Decription , status ),
T4: Salaries (employee_id, employee_name , overtime , Date , salary , dept_id , salary_type , payment_id , leave , status ),
T5: Clients ( id , name ,age , address , email , contact, client_requirement ,status , payment , project_id)
*/

-- -------- Table Queries ---------------------------------------------------
-- --- Table 1 Employees-------------------------------------------------------
create table Employees (
ID int primary key ,
Name varchar(100) ,
address varchar(100) ,
contact varchar(100),
Email varchar(100) ,
age int check (age>0),
qualfition varchar(50),
salary int ,
Birth_date date ,
joining_date datetime
);
-- insert values in table
insert into Employees
values
( 1 ,'Vijay', 'karjat' , '1024782835' ,'vijay098@gmail.com', 23, 'degree' , 10000 ,'2012-12-24' , '2025-03-01' ),
( 2 ,'Rakesh', 'Thane' , '3628982835' ,'rakesh03@gmail.com', 25, 'degree' , 11000,'2010-12-02' , '2025-03-01' ),
( 3 ,'viraj ', 'Shelu' , '1046233235' ,'viraj12@gmail.com', 23, 'diploma,' , 12000, '2012-06-06' , '2025-03-01' ),
( 4 ,'yash', 'karjat' , '1235647738' ,'yash347@gmail.com', 24, 'diploma' ,15000, '2011-01-09' , '2025-03-01' ),
( 5 ,'sahil', 'karjat' , '3274373823' ,'sahil098@gmail.com', 26, 'degree' ,15500 , '2013-2-24' , '2025-03-01' ),
( 6 ,'bharat', 'karjat' , '23348456566' ,'bharat098@gmail.com', 26, 'diploma' ,15500 , '2013-12-12' , '2025-03-01' ),
( 7 ,'bhavesh', 'karjat' , '143323736' ,'bhavesh098@gmail.com', 26, 'degree' ,15500 , '2013-02-04' , '2025-03-01' ),
( 8 ,'raj', 'karjat' , '386846332' ,'raj098@gmail.com', 26, 'diploma' ,15500 , '2013-12-04' , '2025-03-01' ),
( 9 ,'divya', 'karjat' , '2335457674' ,'raj098@gmail.com', 26, 'diploma' ,15500 , '2013-04-14' , '2025-03-01' ),
( 10 ,'mansi', 'karjat' , '3214667585' ,'mansi098@gmail.com', 26, 'degree' ,15500 , '2013-12-12' , '2025-03-01' );

-- show in the table ----
select*from Employees;
-- delete the table
drop table Employees;
-- dalete the all reacords in table
truncate table Employees;

-- 1 select all column from the table Employees
select*from Employees;

-- 2 select specific column
select name , salary from Employees;

-- 3 select a Employees by Email
select*from Employees where Email='rakesh03@gmail.com';

-- 4 select a Employees by Qualfition
select*from Employees where Qualfition='degree';

-- 5 count the number of employees
select count(*) as total_employees from Employees ;

-- 6. Select Employees with a Qualfition Containing a Specific Word
select*from Employees where Qualfition like '%degree%';

-- 7 select a employees ORDER by name
select*from Employees order by name ;

-- 8. Select employees with a Email Starting with 'B'
SELECT * FROM employees WHERE Email LIKE 'B%';

-- 9. Select employees with More than 50 Characters in Email
SELECT * FROM employees WHERE CHAR_LENGTH(Email) > 50;

-- 10. Select the First 5 employees
SELECT * FROM employees LIMIT 5;

-- 11. Select employees with a Qualfition Name Longer than 3 Characters
SELECT * FROM employees WHERE CHAR_LENGTH(Qualfition ) > 3;

-- 12. Select employees with a Qualfition that Does Not Contain 'diploma'
SELECT * FROM employees WHERE Qualfition NOT LIKE '%diploma%';

-- 13. Select the employees with the Longest Name
SELECT * FROM employees ORDER BY CHAR_LENGTH(name) DESC LIMIT 1;

-- 14. Select employees with a Qualfition Containing 'diploma'
SELECT * FROM employees WHERE Qualfition LIKE '%diploma%';

-- 15. Select employees with a address that is Not 'karjat'
SELECT * FROM employees WHERE address != 'karjat';

-- 16. Select the Total Number of Unique employees
SELECT COUNT(DISTINCT name) AS name FROM employees;

-- 17. Select employees with Names that Have More than 6 Characters
SELECT * FROM employees WHERE CHAR_LENGTH(name) > 6;

-- 18. Select employees Ordered by Currency
SELECT * FROM employees ORDER BY contact;

-- 19. Select employees with a contact that is Not NULL
SELECT * FROM employees WHERE contact IS NOT NULL;

-- 20. Select employees with a Qualfition Containing 'a'
SELECT * FROM employees WHERE Qualfition LIKE '%a%';

-- --- Table 2 Departments
create table Departments(
dept_id int primary key ,
dept_name varchar(50) ,
head_of_dept varchar(15) ,
total_employes int ,
address varchar(100),
projects varchar(100) ,
section varchar(10) ,
Decription varchar(100) ,
status varchar(100),
location varchar(50)
);
-- insert values in table -------

insert into Departments
values
( 1 , 'HR ' , 'viraj', 20 , ' karjat ' , 'Ai AGENT ' ,'A','good', ' active' , ' work from home ' ),
( 2 , ' IT ' , 'YASH', 20 , ' shelu ' , 'fanance ' ,'B','good', ' active' , ' in company ' ),
( 3 , ' HR' , 'rushikesh ', 20 , ' karjat ' , ' Ai AGENT ' ,'A','good', ' active' , ' work from home ' ),
( 4 , ' HR' , 'sahil', 20 , ' thane ' , ' Ai AGENT ' ,'A','good', ' active' , ' in company ' ),
( 5 , ' HR' , 'kalpesh', 20 , ' kadav ' , ' Ai AGENT ' ,'A','good', ' active' , ' work from home ' ),
( 6, 'HR ' , 'nayan', 20 , ' karjat ' , 'Ai AGENT ' ,'A','good', ' active' , ' work from home ' ),
( 7 , ' IT ' , 'vinod', 20 , ' shelu ' , 'fanance ' ,'B','good', ' active' , ' in company ' ),
( 8 , ' HR' , 'rupesh ', 20 , ' karjat ' , ' Ai AGENT ' ,'A','good', ' active' , ' work from home ' ),
( 9 , ' HR' , 'sumit', 20 , ' thane ' , ' Ai AGENT ' ,'A','good', ' active' , ' in company ' ),
( 10 , ' HR' , 'bharat', 20 , ' kadav ' , ' Ai AGENT ' ,'A','good', ' active' , ' work from home ' );

-- 1 select all column from the table Employees
select*from Departments;

-- 2 select specific column
select projects , dept_name from Departments;

-- 3 select a Departments by head_of_dept
select*from Departments where head_of_dept ='YASH';

-- 4 select a Departments by dept_name
select*from Departments where dept_name ='HR';

-- 5 count the number of Departments
select count(*) as total_employees from Departments ;

-- 6. Select Departments with a location Containing a Specific Word
select*from Departments where location like '% karjat %';

-- 7 select a Departments ORDER by location
select*from Departments order by location ;

-- 8. Select Departments with a projects Starting with 'A'
SELECT * FROM Departments WHERE projects LIKE 'A%';

-- 9. Select Departments with More than 50 Characters in Email
SELECT * FROM Departments WHERE CHAR_LENGTH(projects) > 5;

-- 10. Select the First 5 Departments
SELECT * FROM Departments LIMIT 5;

-- 11. Select Departments with a Qualfition Name Longer than 3 Characters
SELECT * FROM Departments WHERE CHAR_LENGTH(projects ) > 3;

-- 12. Select Departments with a projects that Does Not Contain 'diploma'
SELECT * FROM Departments WHERE projects NOT LIKE '%fanance %';

-- 13. Select the Departments with the Longest projects
SELECT * FROM Departments ORDER BY CHAR_LENGTH(projects) DESC LIMIT 1;

-- 14 select the total number of unquie
select count(distinct dept_name) as unquie_name from Departments;

-- 15 select Departments with the name that have more than 10 character
select* from Departments where char_length(address)> 7;

-- 16 select Departments order by status
select * from Departments order by status ;

-- 17 select Departments withdepy_id that is not null
select * from Departments where dept_id is not nulL;

-- 18. SELECT Departments WHERE address CONTAING 'v'
SELECT * FROM Departments where address like '%v%';

-- 19. Select Departments with dept name that Have More than 6 Characters
SELECT * FROM Departments WHERE CHAR_LENGTH(dept_name) > 2;

-- 20. Select Departments with a project name that Does Not Contain 'ai agent'
SELECT * FROM Departments WHERE dept_name NOT LIKE '%hr%';

-- show in the table ----
select*from Departments;
-- delete the table
drop table Departments;
-- dalete the all reacords in table
truncate table Departments;

-- --- Table 3 Projects --
create table Projects (
project_id int primary key ,
project_name varchar(50) ,
Head_of_project varchar(100) ,
start_date datetime ,
end_date datetime ,
client_requirement varchar(100),
cost_of_project int ,
total_employes int ,
Decription varchar(100),
status varchar(100)
);

-- insert values in table -------
insert into Projects
values
(101 , 'Ai Dev ' , 'yash' , '2024-12-24' , '2025-03-01' ,'hotel management software ' ,1500 , 5 , ' useful ', 'Active' ),
(102 , 'Ai Dev ' , 'viraj' , '2024-12-24' , '2025-03-01' ,'price' ,1500 , 5 , ' useful ', 'Active' ),
(103 , 'Ai Dev ' , 'bhavesh ' , '2024-12-24' , '2025-03-01' ,'hotel managenet software ' ,1500 , 5 , ' useful ', 'Active' ),
(104 , 'Ai Dev ' , 'bbharat' , '2024-12-24' , '2025-03-01' ,'managenet software ' ,1500 , 5 , ' useful ', 'Active' ),
(105 , 'Ai Dev ' , 'vikas' , '2024-12-24' , '2025-03-01' ,' college databse ' ,1500 , 5 , ' useful ', 'Active' ),
(106 , 'Ai Dev ' , 'vilas' , '2024-12-24' , '2025-03-01' ,'managenet software ' ,1500 , 5 , ' useful ', 'Active' ),
(107 , 'Ai Dev ' , 'sahil' , '2023-12-24' , '2025-03-01' ,'hotel managenet software ' ,1500 , 5 , ' useful ', 'Active' ),
(108 , 'Ai Dev ' , 'vijay' , '2022-12-24' , '2025-03-01' ,'college databse' ,1500 , 5 , ' useful ', 'Active' ),
(109 , 'Ai Dev ' , 'omkar' , '2024-12-24' , '2025-03-01' ,'hotel managenet software ' ,1500 , 5 , ' not useful ', 'Active' ),
(110 , 'Ai Dev ' , 'kaushal' , '2024-12-24' , '2025-03-01' ,'college managenet software ' ,1500 , 5 , ' useful ', 'Active' );

-------- select quiers
-- 1.Select specific columns
select project_name, Head_of_project from projects;

-- 2 .select a projects by name
select * from projects where Decription ='useful ';

-- 3 count the number of NAME
select count(*) as total_NAME from projects;

-- 4 .select projects with a status containing a specific worid
select * from projects where status like'%active%';

-- 5 select projects order by DESCRIPTION
select * from projects order by status;

-- 6 select projects wiTH status
SELECT * FROM projects where status like '1500';

-- 7 Select projects LESS than 10 character
select * from projects where char_length(status)<10;

-- 8 elect the first 2 projects
select * from projects LIMIT 2;

-- 9 select projects name longer Than 5 character
select * from projects where char_length(project_name)>5;

-- 10 select projects with name that does not coNTAIN 'ai agent'--
select * from projects where project_name not like '%ai agent%';

-- 11. SELECT TH Eprojects WITH shortest NAME
select * from projects order by char_length(project_name) desc limit 6;

-- 12.select projects with address containg a devgad
select* from projects where address like '%karjat%';

-- 13 select projects with project_name that is not'ai agent'
select * from projects where project_name!='ai agent';

-- 14 select the total number of unquie
select count(distinct project_name) as unquie_name from projects;

-- 15 select projects with the name that have more than 10 character
select* from projects where char_length(adress)> 10;

-- 16 select projects order by status
select * from projects order by status ;

-- 17 select projects with project_idthat is not null
select * from projects where project_id is not nulL;

-- 18. SELECT projects WHERE project CONTAING 'v'
SELECT * FROM projects where project_name like '%v%';

-- 19. Selectprojects with name that Have More than 6 Characters
SELECT * FROM projects WHERE CHAR_LENGTH(project_name) > 6;

-- 20. Select projects twith a project name that Does Not Contain 'ai agent'
SELECT * FROM projects WHERE project_name NOT LIKE '%ai agent%';

-- show in the table ----
select*from Projects;
-- delete the table
drop table Projects;
-- dalete the all reacords in table
truncate table Projects;

-- -- Table 4 Salaries ----------------------------------------------------
create table Salaries (
employee_id int ,
employee_name varchar(100) ,
overtime time ,
Date date ,
salary int ,
dept_id int ,
salary_type varchar(100),
payment_id int ,
leaves varchar(10) ,
status varchar(50) ,
foreign key (employee_id ) references Employees (ID) ,
foreign key (dept_id ) references Departments(dept_id)
);

-- insert values in table -------
insert into Salaries
values
(1 ,'yash', '3.00' , '2024-12-24',10000 ,1, 'banking ' , 643382386 ,'3', 'done'),
(2 ,'bhavesh', '2.00' , '2023-12-24',16000 ,2, 'cash' , 325232386 ,'2', 'pending'),
(3 ,'viraj', '3.00' , '2024-12-24',13000 ,3, 'banking ' , 356436684 ,'5', 'done'),
(4 ,'nayan', '2.00' , '2023-12-24',14000 ,4, 'cash' , 43646555 ,'7', 'pending'),
(5 ,'kalpesh', '3.00' , '2024-12-24',15000 ,5, 'banking ' , 345346568 ,'3', 'done'),
(6 ,'mayur', '2.00' , '2023-12-24',11000 ,6, 'cash' , 95663523 ,'8', 'pending'),
(7 ,'asmita', '3.00' , '2024-12-24',100000 ,7, 'banking ' , 34558587 ,'3', 'done'),
(8 ,'bhushan', '2.00' , '2023-12-24',100700 ,8, 'cash' , 45435589,'7', 'pending'),
(9 ,'sahil', '3.00' , '2024-12-24',104000 ,9, 'banking ' , 45753434 ,'3', 'done'),
(10 ,'nihal', '2.00' , '2023-12-24',102000 ,10, 'cash' , 46363264 ,'11', 'pending');
-- show in the table ----
select*from Salaries;
-- delete the table
drop table Salaries;
-- dalete the all reacords in table
truncate table Salaries;

----------- select quires
-- 1.Select specific columns
select employee_id,employee_name from salaries;

-- 2 .select a salaries by name
select * from salaries where employee_name ='yash';

-- 3 count the number of NAME
select count(*) as total_NAME from salaries;

-- 4 .select salaries with status a containing a specific worid done
select * from salaries where status like'%done%';

-- 5 select salaries order by DESCRIPTION
select * from salaries order by status;

-- 6 select salaries wiTH status
SELECT * FROM salaries where status like 'done';

-- 7 Select salaries name LESS than 10 character
select * from salaries where char_length(employee_name)<10;

-- 8 elect the first 2 salaries
select * from salaries LIMIT 2;

-- 9 select salaries employee_name longer Than 5 character
select * from salaries where char_length(employee_name)>5;

-- 10 select salaries with employee_name that does not coNTAIN 'yash'--
select * from salaries where employee_name not like '%yash%';

-- 11. SELECT TH salariess WITH shortest NAME
select * from salaries order by char_length(employee_name) desc limit 6;

-- 12.select salaries withname containg a viraj
select* from salaries where employee_name like '%viraj%';

-- 13 select salaries with name that is not'bharat'
select * from salaries where employee_name!='bharat';

-- 14 select the total number of unquie
select count(distinct employee_name) as unquie_name from salaries;

-- 15 select salaries with the name that have more than 10 character
select* from salaries where char_length(employee_name)> 10;

-- 16 select salaries order by status
select * from salaries order by status ;

-- 17 select salaries with with that is not null
select * from salaries where employee_name is not nulL;

-- 18. SELECT salaries WHERE employee_name CONTAING 'an'
SELECT * FROM salaries where employee_name like '%an%';

-- 19. Select salaries with Names that Have More than 6 Characters
SELECT * FROM salaries WHERE CHAR_LENGTH(employee_name) > 6;

-- 20. Select salaries twith a employee_name that Does Not Contain 'yash'
SELECT * FROM salaries WHERE employee_name NOT LIKE '%yash%';

-- Table 5 Clients
create table Clients (
id int primary key ,
name varchar(100) ,
age int ,
address varchar(100) ,
email varchar(100),
contact varchar (100),
status varchar(100) ,
payment varchar(60),
project_id int ,
foreign key( project_id) references Projects( project_id)
);

-- insert values in table -------
insert into Clients
values
( 1 , 'yash' , 23 , 'karjat' ,'yash08@gamil.com ' , '3437326638' , 'active' , 'online' , 101 ),
( 2 , 'vilas' , 24 , 'thane' ,'vilas04@gamil.com ' , '634782682' , 'Inactive' , 'cash' , 102 ),
( 3 , 'viraj' , 22 , 'shelu ' ,'VIRAJ74@gamil.com ' , '7562345356' , 'active' , 'online' , 103 ),
( 4 , 'bhavesh' , 19 , 'CSMT' ,'bhavesh23@gamil.com ' , '365427535' , 'Inactive' , 'cash' , 104 ),
( 5 , 'sahil' , 20 , 'karjat' ,'sahil6@gamil.com ' , '34353463623' , 'active' , 'online' , 105 ),
( 6 , 'nihal' , 24 , 'SHELU' ,'nihal23@gamil.com ' , '33547326638' , 'Inactive' , 'cash' , 106 ),
( 7 , 'vikas' ,31 , 'karjat' ,'vikas86@gamil.com ' , '5367735336' , 'active' , 'online' , 107 ),
( 8 , 'manish' , 25 , 'CSMT' ,'manish24@gamil.com ' , '34373243423' , 'Inactive' , 'cash' , 108 ),
( 9 , 'bhushan' , 29 , 'thane' ,'bhushan47@gamil.com ' , '356333323' , 'active' , 'online' , 109 ),
( 10 , 'kunal' , 26 , 'karjat' ,'Kunal353@gamil.com ' , '63847563487' , 'active' , 'cash' , 110 );

-- show in the table ----
select*from Clients;
-- delete the table
drop table Clients;
-- dalete the all reacords in table
truncate table Clients;

----------- select quires
-- 1.Select specific columns
select name , project_id from Clients;

-- 2 .select a Clients by name
select * from Clients where name ='yash';

-- 3 count the number of NAME
select count(*) as total_NAME from Clients;

-- 4 .select Clients with name a containing a specific worid done
select * from Clients where name like'%viraj%';

-- 5 select Clients order by name
select * from Clients order by name;

-- 6 select Clients wiTH name
SELECT * FROM Clients where name like 'sahil';

-- 7 Select Clients name LESS than 10 character
select * from Clients where char_length(name)<10;

-- 8 elect the first 2 Clients
select * from Clients LIMIT 2;

-- 9 select Clients name longer Than 5 character
select * from Clients where char_length(name)>5;

-- 10 select Clients with name that does not coNTAIN 'bharat'--
select * from Clients where name not like '%bhavesh%';

-- 11. SELECT TH Clients WITH shortest NAME
select * from Clients order by char_length(name) desc limit 6;

-- 12.select Clients withname containg a nayan
select* from Clients where name like '%viraj%';

-- 13 select Clients with name that is not'yash'
select * from Clients where name!='yash';

-- 14 select the total number of unquie
select count(distinct name) as unquie_name from Clients ;

-- 15 select Clients with the name that have more than 10 character
select* from Clients where char_length(name)> 6;

-- 16 select Clients order by id
select * from Clients order by id ;

-- 17 select Clients with with that is not null
select * from Clients where name is not nulL;

-- 18. SELECT Clients WHERE name CONTAING 'an'
SELECT * FROM Clients where name like '%an%';

-- 19. Select Clients with Names that Have More than 6 Characters
SELECT * FROM Clients WHERE CHAR_LENGTH(name) > 6;

-- 20. Select Clients twith a name that Does Not Contain 'yash'
SELECT * FROM Clients WHERE name NOT LIKE '%yash%';